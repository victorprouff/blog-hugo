---
title: "Les Bases Hugo"
date: 2020-10-23T00:10:10+02:00
draft: true
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

## Ajouter un thème

Choisir un [thème](https://themes.gohugo.io/) puis aller chercher son repos github.

```
git submodule add <Url-de-mon-repos-git> themes/<nom-de-mon-thème>
```

Dans le fichier config.toml indiquez quel thème on utilise :

```
theme = "<nom-de-mon-thème>"
```
