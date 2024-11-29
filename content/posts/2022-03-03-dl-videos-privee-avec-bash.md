---
title: "Télécharger des vidéos et sons depuis un site privé avec via youtube-dl et bash"
description: "Télécharger des vidéos et des sons hébergé par Wistia grâce à yt-dlp et ffmpeg via un script bash"
summary: "Télécharger des vidéos et des sons hébergé par Wistia grâce à yt-dlp et ffmpeg via un script bash"
date: 2022-03-03T19:32:32+01:00
categories: ["Astuces"]
tags: [ "bash", "outils", "youtube-dl", "Wistia", "Téléchargement" ]
draft: false
---

Récemment j’ai voulu récupérer les vidéos et audios d’une formation que j’avais payé et qui était limité dans le temps. Si je n’ai pas l’intention de la rediffusé derrière, j’estime qu’ayant déboursé une certaine somme d’argent j’ai envie de pouvoir profiter à nouveau de ce contenu.

Problème, comment récupérer les vingtaines de vidéos et presque autant de fichier audio du site ?

Il y a des extensions de navigateurs mais de 1- ça ne fonctionnait pas dans mon cas et 2- on ne peut pas automatiser le processus.

J’ai donc réfléchi à une autre solution et je me suis penché sur youtube-dl et plus précisément à un de ces forks qui est plus maintenu [yt-dlp](https://github.com/yt-dlp/yt-dlp).

## Installation et usages

Ce petit outil en ligne de commande qui permet de récupérer une vidéo ou un son depuis un très grand nombre de sources (pas seulement Youtube). Il gère différentes façon de s’authentifier, gère plusieurs formats, la qualité, les sous-titres et tout pleins d’autres choses qui ne m’ont pas servi mais qui peuvent être utile. Le soft est libre, multiplateforme, écrit en python et je vous encourage à vous pencher dessus, la doc est très bien faite 🙂

Après installation un petit exemple pour un fonctionnement basique

```bash
python3 /usr/local/bin/yt-dlp https://www.youtube.com/watch?v=weBqsTlQBVc -o "/mnt/c/Users/victo/Videos/%(title)s.%(ext)s"
```

Si on décompose :

- `python3` pour utiliser python suivi du chemin du soft à exécuter.
- `L’URL` de la vidéo à télécharger (ici une vidéo sur Youtube)
- et enfin `-o suivi d’une URL` pour préciser où enregistrer la vidéo. On note les guillemets et le %(title)s.%(ext)s qui permet de récupérer le titre et l’extension de la vidéo original. Il y a pleins d’options possible.

![cliquedroit](/img/dl-videos-privee-avec-bash/execute.png)

C’est tout. C’est basique je vous dis !

## Youtube c’est bien, Wistia c’est mieux

Bon ça c’est déjà cool. Mais je me suis retrouvé face à un petit souci : La formation n’est pas sur Youtube mais sur un site privé accessible via mot de passe et les vidéos sont diffusés avec un lecteur (`Wistia`) que je ne connaissais pas et l’URL de la vidéo ne mène pas à la dite vidéo..

En cherchant un peu j’ai trouvé une solution. Un peu chiante à automatiser puisqu’il faut passer sur chaque vidéo mais ça se fait bien.

Donc quand sur la vidéo on clique droit sur la vidéo puis `Copier le lien et la vignette.`

<img src="/img/dl-videos-privee-avec-bash/cliquedroit.png" alt="Clique droit" class="center">

On récupère l’HTML récupéré pour chopper la clé à la fin de l’url juste après `wvideo=macle`

<img src="/img/dl-videos-privee-avec-bash/lienHtml.png" alt="Lien Html" class="center">

Allez sur cette url en remplaçant les *** par la clé précédemment récupéré.

[https://fast.wistia.net/embed/iframe/***?videoFoam=true](https://fast.wistia.net/embed/iframe/***?videoFoam=true)

Une fois sur la page faites `CTRL + R` ou afficher le code source de la page

Rechercher `.bin` et récupérer le premier lien terminant par `.bin` , il s’agit de la vidéo (ENFIN !) que l’on va pouvoir télécharger.

C’était long et fastidieux mais j’ai pas trouvé mieux pour récupérer une vidéo hébergé sur `Wistia`. On notera que les vidéos bien que planquées sont complétement publiques et accessibles à qui a le bon lien ..

J’ai parlé que la formation contenait aussi des fichiers audios. Pour les récupérer c’est un peu plus simple :

`F12` sur la page qui contient le lancher audio, sur Firefox aller dans `Réseau` et cocher `Média` pour ne voir s’afficher que les sons et images. Rafraîchir la page s’il n’y a rien. Le fichier audio apparaît avec l’URL que l’on peut copier.

<img src="/img/dl-videos-privee-avec-bash/SonReseau.png" alt="SonReseau" class="center">

## Le script bash de téléchargement

Ensuite il “suffit” de répéter l’opération pour chaque vidéo et audios que l’on veut récupérer et d’écrire un petit script qui va télécharger tout ça à la chaîne. Il n’y a pas de différence de traitement entre les vidéos et audios, le soft se débrouille tout seul 🙂

```bash
#!/bin/bash

tabModule1[0]=https:/monurl/nomdefichier1.bin
tabModule1[1]=https:/monurl/nomdefichier2.bin
tabModule1[2]=https:/monurl/nomdefichier3.bin
tabModule1[3]=https:/monurl/nomdefichierAudio1.mp3
tabModule1[4]=https:/monurl/nomdefichierAudio2.mp3

basePath="/mon/path/de/base/Videos"

for i in ${!tabModule1[@]};
do 
    fichierDl=${tabModule1[i]}
    pathDestination="$basePath/Module1/$i-%(title)s.%(ext)s"

    python3 /usr/local/bin/yt-dlp $fichierDl -o $pathDestination
done
```

Bon c’est cool on se retrouve avec toutes les vidéos et audio que l’on voulait. Content. Mais on remarque les vidéos sont au format `.bin`. Je ne savais même pas que ce format pouvait être une vidéos ! Notez tout de même que VLC le lit sans souci.

Mais bon, c’est pas super joli donc on peut écrire un petit script qui va nous convertir tout ça grâce à `[ffmpeg](https://ffmpeg.org/)` encore un petit outil en ligne de commande bien pratique.

```bash
#!/bin/bash

basePath="/mon/path/de/base/Videos"

function convertToMp4(){
    local array=($(find $basePath/$1/ -iname "*.bin"))

    for i in ${!array[@]}; do
        ffmpeg -i ${array[i]} $basePath/$1/video-$i.mp4 -threads 8
    done
}

convertToMp4 "Introduction"
convertToMp4 "Lives"
convertToMp4 "Module1"
convertToMp4 "Module2"
convertToMp4 "Module3"
convertToMp4 "Module4"
convertToMp4 "Module5"
```

On remarque dans mon script que la formation que j’ai récupéré est découpé en module. J’ai réussi à rendre le code un peu plus concis que le premier (que j’ai volontairement tronqué) même si c’est sûrement améliorable. On boucle sur chaque fichier `.bin` de chaque répertoires. Le traitement peut-être un peu long (j’avais des vidéos de plusieurs dizaines de minutes), il faut être patient.

Et voila ! N’hésitez pas à tester yt-dlp, un outil bien pratique ! le le garde dans un coin de ma boite à outils numérique.

A plus, bisous et codez bien !
