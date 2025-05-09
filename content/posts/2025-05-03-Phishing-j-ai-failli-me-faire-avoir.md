---
title: "J'ai failli me faire avoir par mail de phishing"
description: ""
summary: ""
date: 2025-05-09T07:00:55+02:00
categories: [ "Reflexion" ]
tags: [ "Phishing" ]
draft: false
---

Je suis fatigué, mauvaise nuit, le boulot, bref, je pourrais trouver pleins d'excuses, mais le fait est que j'ai failli me faire avoir.

Je reviens de faire 3 courses et je m'installe à mon mon bureau pour checker mes mails et je constate que j'en ai un des impôts. Il est dans mes spams et ce qui m'intrigue.

<img src="/img/2025-05-03-Phishing-j-ai-failli-me-faire-avoir/phishing8-0.webp" alt="Phishing" style="zoom:60%;" class="center" />

Malgré qu'il soit tombé dans mes spams, le contenu du mail est soigné, le mail a l'air OK et l'URL du lien correspond à l'email :

```txt
https://service.multiservice-connect.fr/service
```

Cela ne correspond pas au nom de domaine du gouvernement que je connais, mais ressemble à quelque chose comme FranceConnect. Je baisse ma garde (la fatigue, tout ça, tout ça ...).

Je clique sur le lien.

J'ai une petite page de chargement m'indiquant la préparation de mon espace sécurisé. Histoire de me mettre en confiance... C'est propre. Puis le site apparait.

<img src="/img/2025-05-03-Phishing-j-ai-failli-me-faire-avoir/phishing8-1.webp" alt="Phishing" style="zoom:60%;" class="center" />

Le site a l'air clean et je ne tique pas tout de suite. Je commence à vouloir rentrer mes identifiants, mais Bitwarden ne reconnait pas l'URL et donc ne me propose pas d'identifiant associé. Merci à lui.

Là ça me fait tiquer. Je prends le temps d'analyser un peu plus la page.

Elle est presque identique à celle des impôts, mais ce n'est pas elle. L'URL ne correspond pas même si elle reste cohérente avec le mail reçu.

```txt
https://connection-securise-france-gouv.connect-france-mail.fr/connect-espace/oauth2-2614557
```

Curieusement, à ce moment-là, même si j'ai un doute, je persiste à penser que j'ai peut-être reçu un message important. Pour éviter d'utiliser mes identifiants, je clique sur l'icône pour m'identifier via FranceConnect et .. Surprise, c'est une image ! Je constate en fait qu'à part les champs d'authentification, tout n'est qu'images !

<img src="/img/2025-05-03-Phishing-j-ai-failli-me-faire-avoir/phishing8-2.webp" alt="Phishing" style="zoom:60%;" class="center" />

Je constate aussi que le site que je visite n'a pas d'icône et que le footer de la page se retrouve en plein milieu de mon écran... Désoler les pirates, mais mon écran est trop grand pour vous !

En tout cas, bravo pour la tentative, c'est le plus beau que j'ai pu voir jusqu'à présent.

Et ça me rappelle qu'il faut rester vigilant même quand on pense être alerte sur le sujet, un moment de fatigue et n'importe qui peut se faire avoir.










