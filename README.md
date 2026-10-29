# Mon planning

Un planning de la semaine en grille : les heures à gauche (8h → 24h), une colonne par jour, et des cartes posées sur leur créneau. Une liste « À caser » garde les idées sans date.

**Ouvrir :** https://grfz9.github.io/planning/

## Ce qu'il fait

- **Touche une case vide** pour créer une carte à cette heure. Double-clic sur l'en-tête d'un jour pour une carte sans heure.
- **Étiquettes** libres (nom et couleur), plusieurs par carte. Touche une étiquette en haut pour masquer ou afficher ses cartes.
- **Glisser-déposer** sur un autre jour ou une autre heure (souris sur PC, appui long sur iPhone). Tire le bas d'une carte pour changer sa durée.
- Dans une carte : jour, heure de début et de fin (ex. 13:00 → 16:00), rappel, jours de répétition (ex. lundi, mercredi, vendredi), description, checklist, terminée.
- **Rappels** : alerte avec son quand le planning est ouvert, notification si tu l'autorises.
- **Calendrier iPhone** : Réglages → « Ajouter la semaine au Calendrier (.ics) ». Les cartes avec une heure arrivent dans le Calendrier avec leur rappel, même appli fermée.
- **Couleur d'accent** et **heures affichées** au choix dans les Réglages. Mode sombre automatique.
- **Installable sur l'iPhone** : Safari → Partager → « Sur l'écran d'accueil ».

## Vue Année (war map)

Bouton **Année** en haut : les 12 mois rangés par trimestre, semaine par semaine.

- Choisis une période dans la légende (Vacances, Lancement, Q4…), puis touche ou glisse sur les jours pour les colorier. **Gomme** pour effacer.
- Renomme les périodes, change leur couleur (touche le nombre de jours à droite), ajoutes-en.
- 3 objectifs à cocher sous chaque mois.
- Listes à cocher à droite : Business goals, Voyage / vacances, Possession, Santé, ou les tiennes.
- Touche un jour (sans pinceau actif) pour ouvrir sa semaine. La période du jour s'affiche aussi dans la vue Semaine.

## Vision, Habitudes, Routine, Finances

- **Vision** : Why, How, Vision 1 an, Vision 5 ans (pages lignées) et un tableau d'images qui te motivent.
- **Habitudes** : un habit tracker par mois. Touche une case : 1 = fait, 0,5 = à moitié, 0 = pas fait. Le % de réussite se calcule par habitude.
- **Routine** : les étapes de ta routine (heure facultative), à cocher chaque jour.
- **Finances** : objectifs à 5 ans et 3 ans, et un tableau mois par mois (objectif, réalisé, %).

## Comptes et synchronisation

Chacun peut créer son compte (bouton **Compte**) et retrouver **son** planning sur PC et téléphone, sans que personne d'autre n'y ait accès.
Il faut d'abord brancher un projet Supabase gratuit : voir **[SYNCHRO.md](SYNCHRO.md)** (5 minutes).

## Où sont mes données ?

Sans compte : dans le navigateur de l'appareil. Rien n'est envoyé sur internet.
Avec un compte : une copie sur l'appareil et une copie dans ton projet Supabase, protégée par des règles qui la réservent à ton compte.
Tu peux toujours exporter une sauvegarde depuis les Réglages.

## Fichiers

- `index.html` : toute l'appli (HTML, CSS, JS).
- `manifest.webmanifest`, `icon-*.png` : installation sur l'écran d'accueil.
- `sw.js` : fonctionnement hors connexion et notifications.
- `config.js` : adresse et clé publique de ton projet Supabase (vide = sans compte).
- `supabase.sql` : table et règles de sécurité à créer dans Supabase.
- `vendor/supabase.js` : client Supabase 2.45.4 (licence MIT, voir `vendor/LICENSE-supabase`).
