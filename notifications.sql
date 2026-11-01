-- Notifications iPhone : à coller une fois dans Supabase (SQL Editor → New query → Run).
-- push_subs : les appareils qui ont accepté les notifications.
-- push_jobs : les prochains rappels à envoyer (calculés par le planning).
-- Chaque compte ne voit que ses propres lignes. L'envoi (robot GitHub) utilise la clé secrète.

create table if not exists public.push_subs (
  endpoint   text primary key,
  user_id    uuid not null default auth.uid() references auth.users(id) on delete cascade,
  p256dh     text not null,
  auth       text not null,
  created_at timestamptz not null default now()
);
alter table public.push_subs enable row level security;
drop policy if exists "subs perso" on public.push_subs;
create policy "subs perso" on public.push_subs for all using (auth.uid() = user_id) with check (auth.uid() = user_id);

create table if not exists public.push_jobs (
  id       text not null,
  user_id  uuid not null default auth.uid() references auth.users(id) on delete cascade,
  fire_at  timestamptz not null,
  title    text not null,
  body     text not null default '',
  sent     boolean not null default false,
  primary key (user_id, id)
);
alter table public.push_jobs enable row level security;
drop policy if exists "jobs perso" on public.push_jobs;
create policy "jobs perso" on public.push_jobs for all using (auth.uid() = user_id) with check (auth.uid() = user_id);
create index if not exists push_jobs_due on public.push_jobs (fire_at) where not sent;

-- Remplace d'un coup les rappels à venir du compte connecté.
create or replace function public.replace_my_jobs(jobs jsonb)
returns void language sql security invoker as $$
  delete from public.push_jobs where user_id = auth.uid() and not sent;
  insert into public.push_jobs (id, fire_at, title, body)
  select j->>'id', (j->>'fire_at')::timestamptz, j->>'title', coalesce(j->>'body','')
  from jsonb_array_elements(jobs) j
  on conflict (user_id, id) do update set fire_at = excluded.fire_at, title = excluded.title, body = excluded.body, sent = false;
$$;
