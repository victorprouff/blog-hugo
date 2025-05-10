---
title: "Convertir des images en format webp sur macOS"
description: ""
summary: ""
date: 2025-05-10T17:34:44+02:00
categories: [ "Astuces", "Outils" ]
tags: [ "bash", "outils", "macos" ]
draft: false
---

## cwebp en ligne de commande

J'ai récemment converti toutes les images de mon blog au format webp histoire de gagner un peu de place.

Webp est un format d'image web assez récent développé par Google, dont la compression se veut plus efficace que le JPG et le PNG classique.

Le problème c'est que les outils classiques ne le proposent pas forcément. J'ai donc utilisé `cwebp` un outil en ligne de commande qui permet de faire de la conversion d'image.

Pour l'installer (sous macOS) :

```
brew install webp
```

Puis pour s'en servir, dans le dossier contenant l'image à convertir :

```bash
 cwebp <mon-fichier>.png -o <mon-fichier>.webp
```

C'est assez basique :

- On précise le fichier à convertir
- puis `-o <<mon-fichier>>.webp` pour indiquer le nom et le format du fichier de sortie.

Il existe tout un tas d'options possible, comme par exemple `-q 85` le taux de compression mais je n'en ai pas l'usage.

Bon c'est pas mal et ça marche très bien !

Mais ce n'est pas forcément pratique, car, en général, quand je convertis des images, j'en ai rarement une seule et je n'ai pas forcément un terminal d'ouvert.

J'ai donc créé une automatisation.

## Raccourcis de macOS

Cette partie ne fonctionne que pour macOS. Il est possible que des systèmes similaires existent pour Linux ou Windows, mais je n'en ai pas connaissance.
`Raccourcis` est un soft qui permet de créer de lier des applications entre elles pour en faire des automatisations. Je n'en ai pas une utilisation très poussée, mais l'outil peut-être extrêmement puissant ! Ici je vais m'en servir pour créer un raccourci qui va exécuter le script vu plus haut pour toutes les images sélectionnées.

Ouvrez `Raccourcis`. Allez dans Action rapide et cliquez que le +.

<img src="/img/2025-05-10-Convertir-img-en-webp-macos/cwebp-raccourci2.webp" alt="Convert to webp with raccourci" style="zoom:60%;" class="center" />

Vous pouvez alors renommer votre raccourci, puis rechercher `Executer le script Shell`. 

Coller le script suivant :

```
for f in "$@"
do
	/opt/homebrew/bin//cwebp "$f" -o "${f%.*}.webp"
done
```

Dans un terminal, tapez la commande `which cwebp` pour connaitre l'emplacement du binaire de `cwebp` et adaptez le script précédent.

Il va boucler sur la liste de fichiers sectionnée et les convertir au fur et à mesure. Précisez le Shell que vous voulez utiliser, ici `zsh`.

<img src="/img/2025-05-10-Convertir-img-en-webp-macos/cwebp-raccourci1.webp" alt="Convert to webp with raccourci" style="zoom:60%;" class="center" />

Pour convertir une ou plusieurs images, il vous suffit de les sélectionner, clic droit, `Actions rapides`. Vous retrouverez votre raccourci.

<img src="/img/2025-05-10-Convertir-img-en-webp-macos/cwebp-raccourci0.webp" alt="Convert to webp with raccourci" style="zoom:60%;" class="center" />

La première fois, il ne devrait pas être présent dans la liste. Cliquez sur `Personnaliser...` et activez-le dans la liste.

<img src="/img/2025-05-10-Convertir-img-en-webp-macos/cwebp-raccourci3.webp" alt="Convert to webp with raccourci" style="zoom:40%;" class="center" />

Et voilà, ça me fait gagner pas mal de temps tout en économisant de la place et de la bande passante 😃

Si vous avez d'autres astuces dans le genre, n'hésitez pas à les partager en commentaire, je suis toujours très friand de ce genre de choses. 😊
