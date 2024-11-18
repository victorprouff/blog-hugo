---
title: "Des commentaires sur site static avec Giscus et Github Discussion"
description: "Rajouter des commentaires sur un site en utilisant Github Discussion avec Giscus en moins de 30 mins"
date: 2023-05-12T13:08:58+02:00
tags: [ "hugo", "outils" ]
series: ["Hugo"]
draft: false
---

![Kaamelott](/img/commentaire_giscus_github_discussion/kaamelott.png)

>Mais vous êtes pas mort espèce de connard ?!

Eh non ! Je suis juste pas inspiré.. Ou je n'ai pas l'temps... ou <insérer une random excuse>.

Bref. Aujourd'hui j'ai rajouté les commentaires avec Giscus. J'ai découvert ça hier et je me suis dit que ça pourrait être bien de rajouter la possibilité de laisser des commentaires.
Je me doute qu'il y a peu de monde qui va en laisser mais déjà je fais ce que je veux, deux ça m'amuse et trois on sait jamais 🙂

Pour le coup, pas besoin de tuto, [la doc](https://giscus.app/fr) est très bien faite et traduite en français.

Je vous mets juste la description :

> Un système de commentaires reposant sur le système de [Discussions GitHub](https://docs.github.com/en/discussions). Permettez aux visiteurs de votre site web de laisser des commentaires et des réactions via GitHub ! Fortement inspiré par [utterances](https://github.com/utterance/utterances).
>
> -   [Open source](https://github.com/giscus/giscus). 🌏
>-   Pas de suivi, pas de publicité, gratuit pour toujours. 📡 🚫
>-   Pas besoin de base de données. Toutes les données sont stockées dans les discussions >GitHub.
>-   [Thèmes personnalisables](https://github.com/giscus/giscus/blob/main/ADVANCED-USAGE.>md#data-theme)! 🌗
>-   [Multilingue](https://github.com/giscus/giscus/blob/main/CONTRIBUTING.>md#adding-localizations). 🌐
>-   [Largement configurable](https://github.com/giscus/giscus/blob/main/ADVANCED-USAGE.md). 🔧
>-   Récupère automatiquement les nouveaux commentaires et modifications depuis GitHub. 🔃
>-   [Peut être auto-hébergé](https://github.com/giscus/giscus/blob/main/SELF-HOSTING.md)! 🤳

Je n'y vois que deux défauts :
- Hébergé par Github. Ça peut en faire chier plus d'un.
- Obligation de se connecter à un compte github pour pouvoir poster un commentaire.. Donc pour un blog principalement tech/dev ça peut aller parce que beaucoup on déjà un compte github mais pour un public plus large c'est restrictif. De plus je comprendrai que l'on ne veuille pas forcément associer un commentaire à son compte github.

Voila j'ai voulu tester et ça a été relativement simple à mettre en place. Giscus ne m'a posé aucun problème. Je n'ai eu des soucis que sur la partie Hugo pour comprendre où placer le script généré par giscus. Il a fallut que je cherche un peu comment fonctionnait mon thème.

Au final je l'ai glissé juste après la balise .Content du fichier single.html.

![Exemple](/img/commentaire_giscus_github_discussion/exemple.png)

Pour rappel, avec hugo on peut surcharger un fichier du thème en le rajoutant dans le dossier layouts et en respectant le dossier. Ici `layouts/_default/single.html`.

Voila on peut officiellement me dire ce qu'on en pense en commentaire ! 😃