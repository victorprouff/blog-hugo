---
title: Les Bases d'Hugo
date: 2020-10-23T00:10:10+02:00
description: Un petit article de rappel pour inialiser un site statique avec Hugo
tags: [ "hugo", "themes" ]
categories: [ "themes" ]
series: ["Hugo"]
draft: false
---

## Initialiser projet

```
hugo new site <nom-de-mon-site>
cd <nom-de-mon-site>
```

Ensuite pour initialiser git :

```
echo "/public" >> .gitignore
git init
git add .
git commit -m "Init project"
```

## Lancer le serveur

```
hugo server
```

Pour juste générer les fichiers il suffit d'entrer la commande : hugo
Si on veut au passage minimifier les fichiers il suffit de rajouter : hugo --minify

## Ajouter un thème

Choisir un [thème](https://themes.gohugo.io/) puis aller chercher son repos github.

```
git submodule add <Url-de-mon-repos-git> themes/<nom-de-mon-thème>
```

Dans le fichier config.toml indiquez quel thème on utilise :

```
theme = "<nom-de-mon-thème>"
```

## Customer le thème choisi

Afin de surcharger votre thème, rajoutez un répertoire assets à la racine du projet. A l'intérieur, placer le code que vous voulez remplacer.
On obtient l'harchitecture suivante :
```
.
└── assets
    └── css
        └── custom.css
    └── js
        └── custom.js
```

Par exemple, j'ai voulu que la slidebar à gauche ne prenne que 20% de la largeur de l'écran. J'ai donc créé un fichier assets/css/custum.css dans lequel j'ai placé les classes css qui vont remplacer celles du style.css par defaut du thème. On surcharge le thème.

```css
.sidebar {
    width: 20%;
    -webkit-background-size: cover;
    background-size: cover;
    background-color: var(--bg-color);
    height: 100%;
    top: 0;
    left: 0;
    position: fixed;
    z-index: 4;
    border-right: 1px solid var(--border-color);
}

.content {
    height: auto;
    float: right;
    width: 80%;
    margin-top: 60px;
}

.page-top {
    width: 80%;
    position: fixed;
    right: 0;
    z-index: 3;
    background-color: var(--bg-color);
    height: 60px;
    border-bottom: 1px solid var(--border-color);
}
```

Ensuite il faut spécifier la surcharge dans le fichier config.toml

```  
customCss = ["css/style.css", "css/custom.css"]
customJs = []
```