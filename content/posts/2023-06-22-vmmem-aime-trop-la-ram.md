---
title: "Vmmem Aime Trop La Ram"
description: Résolution du problème de RAM de vmmem
date: 2023-06-22T16:58:55+02:00
tags: [ "windows" ]
categories: [ "Astuces" ]
draft: false
---

**Vmmem, 11Go de ram .. sérieusement ?**

En mission je travaille sur un HP 13" qui tourne sous windows et en plus t'entendre en permanence son ventilo, il chauffe et se retrouve souvent limite en CPU et en RAM.

En règle général je m'en sors à peu prêt mais l'autre jour la machine était au bout de sa vie. Je vais faire un tour dans les processus pour voir ce qui le mets à genoux et je tombe sur un processus dont le nom me dit quelque chose mais dont je ne me souviens pas l'utilité : Vmmem.

![Miam](https://media1.giphy.com/media/d2ItDZZumUI6Y/giphy.gif?cid=ecf05e47oq80we72v2tsakqc4wadyhw4799az0q81i66lffo&ep=v1_gifs_search&rid=giphy.gif&ct=g)

Problème le p'tit bonhomme me bouffe 11Go de ram ce qui est un poil beaucoup c'est presque la moitié de ce dont dispose la machine.

Je vais faire un tour sur internet pour voir qui que c'est que ça et de ce que j'ai compris il rassemble toute la ram des machines virtuelles de la machine.
VMMEM pour VM Memory sans doute. Bien trouvé le nom.

Ok. Soit.

Mais dans mes souvenir je n'ai pas beaucoup de VM qui tourne en vérifiant dans docker, je n'en ai qu'une et qui me prends 500 Mo ce qui est déjà pas mal.

Là ça m'agace un poil donc je cherche une solution.

Je tente de le redémarrer avec un dans un terminal en administrateur :

```
Restart-Service LxssManager
```

Mais cela ne change pas grand chose. Aussitôt relancé que la ram du p'tit père crève à nouveau le plafond.

Une autre solution que j'ai trouvé est de limiter la ram et les coeurs de CPU qu'il peut utiliser.

Pour cela il faut éditer le fichier de conf de WSL (Pour ma part j'ai dû le créer).

Dans un terminal taper :
```powershell
wsl --shutdown

code "$env:USERPROFILE/.wslconfig"
```

Cela ouvre le fichier de conf dans un vsc.

On va pouvoir limiter ces capacités :
```bash
[wsl2]

memory=3GB   # Limits VM memory in WSL 2 up to 3GB

processors=2 # Makes the WSL 2 VM use two virtual processors
```
Je me dis que 3Go et deux coeurs CPU seront suffisant. J'adapterais si besoin.

On enregistre, on referme et on relance la machine.

Et .. oooh soulagement ! ça fonctionne !
