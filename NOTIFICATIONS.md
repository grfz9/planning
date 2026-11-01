# Activer les notifications iPhone

Les rappels arrivent comme ceux d'une vraie appli, même planning fermé.
Un robot GitHub (`.github/workflows/notifications.yml`) vérifie toutes les 5 minutes les rappels à envoyer.

## Une seule fois (environ 3 minutes)

### 1. Supabase : créer les tables des notifications
SQL Editor → New query → colle tout [`notifications.sql`](notifications.sql) → **Run**.

### 2. GitHub : ajouter 2 secrets
Dépôt `grfz9/planning` → **Settings** → **Secrets and variables** → **Actions** → **New repository secret** :

| Nom | Valeur |
|---|---|
| `VAPID_PRIVATE_KEY` | la clé privée donnée par Claude dans la conversation |
| `SUPABASE_SERVICE_KEY` | Supabase → Project Settings → API Keys → clé **secret** (`sb_secret_…`) ou, dans *Legacy API keys*, la clé **service_role** |

Ces deux clés sont secrètes : ne les colle jamais dans un fichier du dépôt.

### 3. Lancer le robot une première fois
Onglet **Actions** du dépôt → **Notifications iPhone** → **Run workflow** (si GitHub demande d'activer les Actions, accepte).

## Sur chaque iPhone
1. Safari → planning → Partager → **Sur l'écran d'accueil**.
2. Ouvre le planning **depuis l'icône**, connecte-toi.
3. Plus → Réglages → **Activer les notifications** → Autoriser.

## Bon à savoir
- GitHub lance le robot toutes les 5 minutes, parfois avec quelques minutes de retard : un rappel « 10 min avant » peut arriver un peu tard.
- Les rappels des 7 prochains jours sont envoyés au serveur à chaque synchronisation.
- GitHub met en pause les robots planifiés d'un dépôt public sans activité pendant 60 jours : relance-le depuis l'onglet Actions si besoin.
