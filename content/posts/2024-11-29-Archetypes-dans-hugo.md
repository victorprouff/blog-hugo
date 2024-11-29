---
title: "Archetypes dans Hugo"
description: ""
summary: ""
date: 2024-11-29T15:05:29+01:00
categories: ["Hugo"]
tags: [ "Hugo"]
draft: false
---

## Contexte

À force de créer des articles pour le blog je me retrouve un peu à faire toujours la même chose. `hugo new posts/mon-article.md` pour créer l'article, écrire l'article, préparer l'entête à savoir mettre les bons tags/catégories, la description, le summary.

Problème, par défaut l'en-tête est un peu pauvre en informations.

```yml
---
title: "Mon Article"
date: 2024-11-29T15:05:29+01:00
draft: true
---
```

J'ai une petite tête et je ne me souviens plus exactement de tout ce qu'il faut remplir et surtout pour les tags et catégories, je n'ai pas envie de rechercher dans mes anciens articles la liste de ceux déjà existants.

## Solution: les Archetypes

Pour résoudre ce souci, on va éditer le modèle des articles. Dans Hugo ce modèle s'appelle un [Archetype](https://gohugo.io/content-management/archetypes/) et on le trouve dans le dossier `archetypes` avec un fichier par défaut `default.md`.

Notez que l'on peut créer plusieurs Archetypes. Si sur notre site on a plusieurs types de page comme par exemple des tutos, des articles, des recettes de cuisines. Ainsi nous aurions plusieurs Archetypes comme suis :

```
archetypes /
│   ├── tutos.md
│   ├── articles.md
│   ├── recettes.md
│   └── default.md
```

Si on crée un article avec la commande `hugo new articles/mon-bel-article.md` il utilisera automatiquement me modèle articles grâce au sous-répertoire `articles`.

## Mon usage

### L'entête

Selon votre thème, `default.md` peut être plus ou moins complet. Le mien a cette forme :

```yml
---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
draft: true
---
```

On retrouve le `titre`, la `date` ainsi que `draft` qui indique si l'article est un brouillon ou non.

Je vais pour commencer rajouter quelques petites informations.

```yml
---
title: "{{ replace .Name "-" " " | title }}"
description: ""
summary: ""
date: {{ .Date }}
categories: [ ]
tags: [ ]
draft: false
---
```

C'est mieux et ça me permet déjà de n'oublier aucune informations mais on peut aller un peu plus loin.

J'aimerais rajouter la liste de tous les tags et catégories déjà existants dans mes articles pour éviter d'en recréer un similaire à un déjà existant et de pouvoir choisir le plus adapté.

Pour ce que j'ai rajouté :

```yml
categories: [ {{ range $key, $value := .Site.Taxonomies.categories }}"{{ $key | humanize }}", {{ end }} ]
tags: [{{range $name, $taxonomy := .Site.Taxonomies.tags}}"{{$name}}", {{end}}]
```

Ce qui nous donne :

```yml
---
title: "Test"
description: ""
summary: ""
date: 2024-11-29T17:17:59+01:00
categories: [ "Astuces", "Hugo", "Outils", "Projet", "Reflexion",  ]
tags: ["bash", "fluxrss", "hugo", "index", "multi os", "outils", "photo", "publicité", "python", "téléchargement", "unix", "veille", "visual studio code", "windows", "wistia", "youtube", "youtube-dl", "zsh", ]
draft: false
---
```

### Le corps

On a modifié l'entête mais on peut tout à fait modifier le corps de l'article. On peut par exemple rajouter un bloc que l'on veut toujours voir apparaître à un endroit, une structure, un footer, des liens, une image, tout est possible. 🙂

Pour ma part, je vais rajouter la liste de me tags et catégories dans un tableau avec le nombre d'articles associés. Histoire de me donner une idée de l'existant et de penser à faire le ménage et m'aider à faire le bon choix pour taguer mon article.

Cela est uniquement informatif pour moi et je le supprimerais avant de publier l'article.

Pour cela, il suffit de rajouter le code suivant :

```md
## Tags

| Tags | Count |
| :--: | :---: |{{range $name, $taxonomy := .Site.Taxonomies.tags}}{{ $cnt := .Count }}
| {{$name}} | {{$cnt}} | {{end}}

## Categories

| Categories | Count |
| :--------: | :---: | {{ range $key, $value := .Site.Taxonomies.categories }}
| {{ $key | humanize }} | {{ len $value }} | {{ end }}
```

Je rajouterais peut-être d'autres choses plus tard pour le moment ça me convient bien. 😊

Voilà, c'est tout pour aujourd'hui. À plus pour de nouvelles réflexions et astuces ! 😃