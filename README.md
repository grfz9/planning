# Mon planning

Un planning de la semaine façon Trello : une liste par jour (lundi → dimanche), plus une liste « À caser » pour les idées sans date. Chaque tâche est une carte qu'on glisse d'un jour à l'autre.

**Ouvrir :** https://grfz9.github.io/planning/

## Ce qu'il fait

- **Ajouter une carte** sous un jour, puis la toucher pour la détailler.
- **Étiquettes** libres (nom et couleur), plusieurs par carte. Touche une étiquette en haut pour masquer ou afficher ses cartes.
- **Glisser-déposer** : à la souris sur ordinateur, appui long puis glisser sur iPhone.
- Dans une carte : jour, heure et durée, rappel, « chaque semaine », description, checklist, terminée.
- **Rappels** : alerte avec son quand le planning est ouvert, notification si tu l'autorises.
- **Calendrier iPhone** : Réglages → « Ajouter la semaine au Calendrier (.ics) ». Les cartes avec une heure arrivent dans le Calendrier avec leur rappel, même appli fermée.
- **Fond du tableau** au choix dans les Réglages.
- **Installable sur l'iPhone** : Safari → Partager → « Sur l'écran d'accueil ».

## Où sont mes données ?

Dans le navigateur de l'appareil (localStorage). Rien n'est envoyé sur internet.
Pour passer du PC à l'iPhone : Réglages → « Exporter la sauvegarde », puis « Importer… » sur l'autre appareil.

## Fichiers

- `index.html` : toute l'appli (HTML, CSS, JS).
- `manifest.webmanifest`, `icon-*.png` : installation sur l'écran d'accueil.
- `sw.js` : fonctionnement hors connexion et notifications.
