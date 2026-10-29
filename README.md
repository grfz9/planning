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

## Où sont mes données ?

Dans le navigateur de l'appareil (localStorage). Rien n'est envoyé sur internet.
Pour passer du PC à l'iPhone : Réglages → « Exporter la sauvegarde », puis « Importer… » sur l'autre appareil.

## Fichiers

- `index.html` : toute l'appli (HTML, CSS, JS).
- `manifest.webmanifest`, `icon-*.png` : installation sur l'écran d'accueil.
- `sw.js` : fonctionnement hors connexion et notifications.
