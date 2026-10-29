# Activer les comptes et la synchronisation

Sans cette étape, le planning marche quand même : tout reste enregistré sur l'appareil.
Avec elle, chacun crée son compte et retrouve **son** planning sur PC et téléphone. Personne d'autre n'y a accès.

Compte environ 5 minutes. Tout est gratuit (offre Free de Supabase).

## 1. Créer le projet

1. Va sur https://supabase.com et crée un compte (bouton **Start your project**).
2. **New project** : donne un nom (ex. `planning`), choisis un mot de passe de base de données (garde-le), région **Europe**, puis **Create new project**. Attends 1 à 2 minutes.

## 2. Créer la table et les règles de sécurité

1. Menu de gauche : **SQL Editor** → **New query**.
2. Copie tout le contenu du fichier [`supabase.sql`](supabase.sql) de ce dépôt, colle-le, puis **Run**.
3. Le message « Success. No rows returned » veut dire que c'est bon.

## 3. Autoriser ton site

1. Menu de gauche : **Authentication** → **URL Configuration**.
2. **Site URL** : `https://grfz9.github.io/planning/`
3. **Redirect URLs** : ajoute `https://grfz9.github.io/planning/`
4. **Save**.

(Les e-mails de confirmation et de mot de passe oublié renverront vers ton planning.)

## 4. Brancher le planning

1. Menu de gauche : **Project Settings** → **API** (ou **Data API**).
2. Copie **Project URL** et la clé **anon public**.
3. Sur GitHub, ouvre `config.js`, clique sur le crayon ✏️ et colle les deux valeurs :

```js
window.PLANNING_CONFIG = {
  supabaseUrl: "https://xxxx.supabase.co",
  supabaseAnonKey: "eyJhbGciOi..."
};
```

4. **Commit changes**. Une minute après, le bouton **Compte** du planning permet de créer un compte.

> La clé « anon » peut être publique : la sécurité vient des règles de l'étape 2, qui empêchent un compte de lire les données d'un autre. Ne colle **jamais** la clé « service_role ».

## Bon à savoir

- À la création d'un compte, Supabase envoie un e-mail de confirmation : clique sur le lien, puis connecte-toi.
- La première fois que tu te connectes sur un appareil où tu avais déjà un planning sans compte, ce planning est versé dans ton compte.
- **Se déconnecter** retire le planning de l'appareil (il reste dans ton compte). Pratique sur un appareil partagé.
- Si tu modifies sur deux appareils en même temps, c'est la dernière modification enregistrée qui gagne.
