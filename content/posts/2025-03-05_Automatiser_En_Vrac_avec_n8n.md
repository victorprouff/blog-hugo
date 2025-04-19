---
title: "Automatiser la publication des En Vrac avec n8n"
description: "Je vous montre comment j'ai automatiser la publication de mes articles En Vracs grâce à n8n"
summary: "Je vous montre comment j'ai automatiser la publication de mes articles En Vracs grâce à n8n"
date: 2025-04-19T13:04:57+02:00
categories: [ "Astuces", "Outils"]
tags: [ "outils", "n8n"]
draft: false
---

# Automatiser En Vrac avec n8n

Si vous lisez mon blog, vous avez du remarqué que tous les mercredi matin, je publie un En Vrac où je partage des articles, vidéos, podcasts, livres et outils que je trouve intéressant plus ou moins en rapport avec la tech.

L'écriture de ces articles a évolué depuis le début d'année pour arriver dans une version totalement automatisé. Je voudrais vous partager les étapes de cette automatisation, comment je l'ai réalisé et avec quels outils.

Au début je faisais tout à la main ce qui était assez chronophage.

## Avant

J'utilise l'appli TodoIst qui permet de gérer des listes de choses à faire. C'est synchronisé sur tous mes appareils et je le trouve vraiment pratique. En plus de la gestion de mes tâches à faire, j'ai un projet nommé en En Vrac où je liste au fur et à mesure de ma semaine les ressources que je trouve pertinentes par catégories.

<img src="/img/2025-03-05_Automatiser_En_Vrac_avec_n8n/TodoIst-EnVracs.webp" alt="TodoIst EnVracs" style="zoom:60%;" class="center" />

Le mercredi matin, je créais un nouvel article sur mon blog et je copiais collait tous les différents titres et liens, catégories par catégorie. Je les normais pour avoir une cohérence entre les différents En Vracs. Je finissais par pusher l'article sur mon blog dont la nouvelle version était mise en ligne 5 mins plus tard.

Une tâche assez longue, pas très intéressante, répétitive et qui m'obligeait à m'en occuper le mercredi matin.

En tant que développeur, je me devais d'améliorer ça.

## Amélioration

Comme tout développeur, j'ai souvent la flemme de faire les choses plusieurs fois. Donc après avoir publié mon deuxième en Vrac, je me suis demandé si je pouvais automatiser un peu tout ça.

J'avais envie de bricoler avec Blazor C#. Donc naturellement, j'ai d'abord commencé par créer un nouvel outil en Blazor C#.

Le workflow est assez simple, j'exporte le projet depuis TodoIst en CSV. J'intègre le fichier dans mon outil qui me retourne le texte en formaté pour le blog et pour le post linkedin.

Le code est disponible sur [Github](https://github.com/victorprouff/VTools/blob/main/VTools/Components/Pages/EnVracHelper.razor) au milieu d'autres petites outils que j'ai développé. Clairement, ça pourrait être améliorer et je ne suis pas franchement un pro de Blazor. Si vous avez des conseils ou idées d'améliorations, je suis toujours preneur :) 

Avec ça, j'ai pu gagner pas mal de temps. Le formatage étant automatique, je n'ai plus qu'à copier coller deux fois et publier mon articles sur le blog et créer le post sur Linkedin. L'opération me prends 15 mins max le lundi matin.

C'était pas mal et mais il restait une contrainte très importante : le fait que je sois obligé de m'en occuper tous les mercredi matin. On peut mieux faire.

## Full automatisation

Je suis tombé il y a quelques jours sur la très intéressante vidéo de [Micode](https://www.youtube.com/watch?v=dS01AoUF1xo) qui a fait un super reportage sur l'utilisation des téléphones chiffrés par les criminelles et sur comment le FBI et les services de police du monde entier les ont utilisés pour les faire tomber.

Ce qui m'a intéressé ici, c'était la sponso pour hostinger et surtout la vidéo qu'il a fait pour montrer comment héberger n8n sur un serveur.

[N8n](https://n8n.io/) est une plateforme d’automatisation de workflows en open source. Elle permet de lier des services entre eux et d'automatiser des tâches. On peut par exemple créer une automatisation qui quand on reçoit un email d'un certain expéditeur, enregistrer le contenu dans une table sql ou Notion, puis executer un script codé en Javascript pour faire une action, ou envoyer l'eventuelle pièce jointe dans un drive quelconque. Les possibilités sont quasiment infini et n'ont de limite que notre imagination.

Ce qui est bien c'est qu'il est possible de créer ces propres noeuds mais également de ne pas se contenter des applications existantes qui sont déjà très nombreuse mais de rajouter des morceaux de code fait mains pour répondre exactement à notre besoin. Exactement ce qui m'intéresse aujourd'hui.

Je connaissais son existence depuis un moment mais je n'avais pas trouvé d'utilité pour mon usage. Mais là c'était parfait pour résoudre mon problème !

Un petit tour sur mon Coolify hébergé à la maison pour l'installé et je me retrouve en 5 mins devant l'interface de création de workflow.

Le principe est simple, on connecte des noeuds, qui représentent une action pour faire un ensemble d'action. Chaque action peut être l'exécution d'un morceau de code, un déclencheur, le traitement d'un fichier ou l'appel à un service tiers. Pour ces derniers il faut au préalable s'y connecter.

Voici le workflow complet que j'ai créé.

<img src="/img/2025-03-05_Automatiser_En_Vrac_avec_n8n/n8n-workflow.webp" alt="n8n Workflow" style="zoom:60%;" class="center" />

De gauche à droite :

- Le trigger : C'est l'entrée du workflow, tous les mercredi à 9h il déclenche la suite.
<img src="/img/2025-03-05_Automatiser_En_Vrac_avec_n8n/trigger.webp" alt="trigger" style="zoom:80%;" class="center" />

Deux actions sont déclenchés.

- D'un coté :
  - On récupère dans le repos github de mon blog tous les articles en vracs
<img src="/img/2025-03-05_Automatiser_En_Vrac_avec_n8n/GitHub-Get-EnVracs.webp" alt="GitHub-Get-EnVracs" style="zoom:60%;" class="center" />

  - Un morceau de code récupère les noms et dates des deux derniers en vracs et le renvoie sous forme de json
<img src="/img/2025-03-05_Automatiser_En_Vrac_avec_n8n/CodeNameDateEnvracs.webp" alt="CodeNameDateEnvracs" style="zoom:70%;" class="center" />

- Et en même temps :
  - On récupère dans le projet En Vracs de TodoIst tous les articles que j'ai mis de coté pour la semaine
<img src="/img/2025-03-05_Automatiser_En_Vrac_avec_n8n/todoist-GetEnvracs.webp" alt="todoist-GetEnvracs" style="zoom:80%;" class="center" />

  - On en extrait les informations intéressantes (sectionId, content, description)
<img src="/img/2025-03-05_Automatiser_En_Vrac_avec_n8n/FormatInfos.webp" alt="FormatInfos" style="zoom:60%;" class="center" />

  - Un morceau de code extrait les urls et déduit le types d'article (Article, vidéos, podcast, livres, tools, ...) en fonction de la section
<img src="/img/2025-03-05_Automatiser_En_Vrac_avec_n8n/CodeNormeArticle.webp" alt="CodeNormeArticle" style="zoom:60%;" class="center" />

- On merge dans un unique json les deux résultats précédents
<img src="/img/2025-03-05_Automatiser_En_Vrac_avec_n8n/MergeCode.webp" alt="MergeCode" style="zoom:80%;" class="center" />

- Un morceau de code Javascript un peu dégueu pour formater l'article en Vracs
<img src="/img/2025-03-05_Automatiser_En_Vrac_avec_n8n/CodeMiseEnForme.webp" alt="CodeMiseEnForme" style="zoom:60%;" class="center" />

- Puis on split, en haut :
  - On converti le résultat en fichier (ça me permet de faire des tests et de voir le résultat simplement), désactivé
<img src="/img/2025-03-05_Automatiser_En_Vrac_avec_n8n/ConvertToFile.webp" alt="ConvertToFile" style="zoom:80%;" class="center" />

- En bas :
  - On commit un nouveau fichier sur le repos github du blog à partir de l'article créé avant
<img src="/img/2025-03-05_Automatiser_En_Vrac_avec_n8n/PublishEnVrac.webp" alt="PublishEnVrac" style="zoom:60%;" class="center" />

  - La CI est déclenché automatiquement lors d'un push d'un nouveau commit sur la branche main. Cela prends environ 5 mins.
  - On fait une pause de 5 mins
<img src="/img/2025-03-05_Automatiser_En_Vrac_avec_n8n/Wait5mins.webp" alt="Wait5mins" style="zoom:80%;" class="center" />

  - Une notification est envoyé sur mon portable via l'application PushOver
<img src="/img/2025-03-05_Automatiser_En_Vrac_avec_n8n/PushOver.webp" alt="PushOver" style="zoom:80%;" class="center" />

## Conclusion

Et voila :) Le process est assez simple. Ce qui m'a posé le plus de problème c'est la partie code. L'IDE intégré n'est vraiment pas dingue et coder en javascript me donne de l'urticaire... Notez que j'aurais pu le faire en python mais j'ai assez peu l'habitude de ce langage.

J'espère que ce petit article vous aura intéressé. En tout cas, j'aurai aimé tomber dessus quand j'ai commencé à manipuler n8n. Si vous avez des questions, n'hésitez pas à me laisser un commentaire ou m'envoyer un mail, j'y répondrai avec plaisir :)
