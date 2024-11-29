---
title: "Se connecter en SSH à un serveur distant avec Visual Studio Code"
description: Je partage une astuce pour se connecter via SSH à un serveur distant grâce à Visual Studio Code
summary: Je partage une astuce pour se connecter via SSH à un serveur distant grâce à Visual Studio Code
categories: ["Astuces"]
tags: [ "Visual Studio Code" ]
date: 2021-05-05T19:33:31+02:00
draft: false
---

Un petit article pour partager une astuce bien pratique pour se connecter à un serveur distant en SSH ou développer à distance sur un Raspberry pi.

J'utilise quotidiennement Visual Studio Code. Bien pratique, léger, je m'en sers dès que je bricole un script, fait un peu de front, veut lire, manipuler ou comparer toutes sorte de fichiers.

Depuis peu je me suis remis à bricoler avec des Raspberry Pi pour plusieurs petits projets. Je les utilise en tant que serveur branché à ma box et j'y accède en ligne de commande via SSH. Moi qui voulais me remettre à bidouiller sous linux, je suis bien content.

Mais j'ai découvert une extension VSC bien pratique pour se connecter en SSH à un serveur distant. Il s'agit de `Remote - SSH`.

<img src="/img/se-connecter-ssh-serveur-distant-vsc/ssh-vsc-list-connexion.png" alt="Liste des connexions" class="center">

Une fois installé, on peut ajouter des connexions local ou distante. Il suffit de rentrer la ligne de commande `ssh user@addresse-serveur` puis rentrer le mot de passe et c'est good. On peut ensuite choisir un répertoire à ouvrir et là c'est comme si on développait à la maison, on voit tous les fichiers et dossiers du répertoire que l'on peut éditer, supprimer selon les droits du user.

Mieux ! On peut ouvrir la console du serveur distant directement dans VSC. On peut donc exécuter directement les scripts que l'on écrit dans l'ide !

<img src="/img/se-connecter-ssh-serveur-distant-vsc/ssh-vsc-presentation.png" alt="Présentation" class="center">

Je m'en sers pour coder en python sur mon Raspberry pi, modifier les fichiers de config de mon serveur minecraft et voir les logs de celui ci ou encore se connecter au serveur qui héberge mon site : tout est possible 🙂

A propos de script, l'extension Python permettant d'exécuter du code python fonctionne aussi parfaitement.

Il faut noter que le fait de se connecter avec VSC demande de la ressource au serveur distant. Cela tourne parfaitement bien pour un Raspberry pi 3 avec ces 1Go de RAM.

Bon aller, je retourne bricoler 🙂