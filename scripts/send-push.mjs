// Envoie les rappels arrivés à échéance (lancé toutes les 5 min par GitHub Actions).
import webpush from "web-push";

const { SUPABASE_URL, SUPABASE_SERVICE_KEY, VAPID_PUBLIC_KEY, VAPID_PRIVATE_KEY } = process.env;
if (!SUPABASE_URL || !SUPABASE_SERVICE_KEY || !VAPID_PUBLIC_KEY || !VAPID_PRIVATE_KEY) {
  console.log("Secrets manquants : notifications désactivées (voir NOTIFICATIONS.md).");
  process.exit(0);
}
webpush.setVapidDetails("https://grfz9.github.io/planning/", VAPID_PUBLIC_KEY, VAPID_PRIVATE_KEY);

const H = { apikey: SUPABASE_SERVICE_KEY, Authorization: "Bearer " + SUPABASE_SERVICE_KEY, "Content-Type": "application/json" };
const api = async (path, opts = {}) => {
  const r = await fetch(SUPABASE_URL + "/rest/v1/" + path, { ...opts, headers: { ...H, ...(opts.headers || {}) } });
  if (!r.ok) throw new Error(path + " → " + r.status + " " + (await r.text()));
  return r.status === 204 ? null : r.json().catch(() => null);
};

const now = Date.now();
const from = new Date(now - 30 * 60000).toISOString();   // rattrape un retard du robot jusqu'à 30 min
const to = new Date(now + 2 * 60000).toISOString();
const jobs = await api(`push_jobs?sent=eq.false&fire_at=gte.${from}&fire_at=lte.${to}&select=*`);
console.log(jobs.length + " rappel(s) à envoyer");
if (!jobs.length) process.exit(0);

const users = [...new Set(jobs.map(j => j.user_id))];
const subs = await api(`push_subs?user_id=in.(${users.join(",")})&select=*`);

for (const j of jobs) {
  for (const s of subs.filter(s => s.user_id === j.user_id)) {
    try {
      await webpush.sendNotification({ endpoint: s.endpoint, keys: { p256dh: s.p256dh, auth: s.auth } },
        JSON.stringify({ title: j.title, body: j.body, tag: j.id }), { TTL: 3600, urgency: "high" });
    } catch (e) {
      console.log("Échec d'envoi :", e.statusCode || e.message);
      if (e.statusCode === 404 || e.statusCode === 410)
        await api(`push_subs?endpoint=eq.${encodeURIComponent(s.endpoint)}`, { method: "DELETE" });
    }
  }
  await api(`push_jobs?user_id=eq.${j.user_id}&id=eq.${encodeURIComponent(j.id)}`, { method: "PATCH", body: JSON.stringify({ sent: true }) });
}
