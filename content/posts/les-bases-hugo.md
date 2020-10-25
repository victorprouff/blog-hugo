---
title: Les Bases d'Hugo
date: 2020-10-23T00:10:10+02:00
description: Un petit article de rappel pour inialiser un site statique avec Hugo
tags: [ "hugo", "themes" ]
categories: [ "themes" ]
series: ["Hugo"]
draft: false
---

En voulant créer un blog, j'ai réfléchi à une solution la plus légère possible et facilement versionable. J'ai donc rapidement mis de coté Wordpress et son usine à gaz (c'est sympa hein .. mais un peu trop lourd pour un simple blog). Après quelques recherche j'ai découvert le renouveau des sites statiques et générateur de site statique tel que [Hugo](https://gohugo.io/), [Jekyll](https://jekyllrb.com/). Il en existe bien d'autre mais ce sont globalement les plus connu.

Le principe des générateurs de site statique est de pouvoir créer, localement sur notre ordinateur, la structure du site à la main ou via des thèmes créé par la communauté. On peut alors ajouter du contenu en markdown ce qui permet une édition simple et rapide. Le tout étant versionné avec Git avec Github ou Gitlab. On peut alors grâce à un peu de CI, déployer automatiquement le site, gérer plusieurs branches pour faire des tests.

Franchement, ça m'a pas mal emballé. La solution présente de très nombreux avantages et bien qu'un site statique ne puisse pas remplacer la plus part des gros sites, elle suffit pour bon nombre de cas plus basique. Les restrictions dû à l'essence même des sites statiques peuvent être facilement contourné, je pense notamment à la gestion des commentaires, ou de formulaire de mail.

J'ai commencé par tester [Publii](https://getpublii.com/) qui a l'avantage d'être extrêmement simple d'utilisation avec sa belle interface graphique. J'ai créé la première version de mon site photo avec mais présente de gros défaut pour le déploiement automatique. Les besoins de mon blog et de mon site photo sont différents et je n'ai pas encore résolu les problèmes de ce dernier...

Pour mon blog j'ai adopté Hugo car assez populaire, léger et bien qu'un peu plus complexe que Publii il reste tout à fait abordable et est bien plus puissant. Je testerai peut-être un jour Jekyll ou un autre à l'occasion.

Le but de cet article est d'expliquer ma démarche dans la création de ce blog en fonction de mon besoin. Je vais expliquer également mon workflow de création.

Je vais détailler chaque commande que je fais à l'intension des plus néophytes. Si vous ne comprenait pas certaines commandes je vous recommande de vous renseigner sur Git ou de me laisser un commentaire (quand se sera possible :P).

## Création d'un projet

Je vous laisse le soin d'aller lire la [documentation](https://gohugo.io/documentation/) très bien faite d'Hugo. L'installation est basique.

Pour créer un projet il suffit d'entrer les commandes suivantes :

```
hugo new site <nom-de-mon-site>
cd <nom-de-mon-site>
```

Ensuite on créé le fichier`.gitignore`  tout en précisant à l'intérieur que Git ne va pas versionner le répertoire `public` . Ce répertoire sera généré par Hugo et il contiendra le site statique généré.

``` 
echo "/public" >> .gitignore
```

On initialise notre repos Git puis on fait notre commit initial :

```
git init
git add .
git commit -m "Init project"
```

Voila notre site est initialisé et versionné ! :D

## Ajouter un thème

Bien qu'il soit tout à fait possible de créer son propre thème de A à Z, étant une vraie quiche en front et en CSS, j'ai opté pour l'utilisation d'un thème déjà tout fait fournis par la communauté. En plus comme nous le verront plus loin, il est tout à fait possible de s'approprier le thème choisi en le modifiant ou plus simplement en le surchargeant.

Dans un premier temps, je vous laisse choisir votre [thème](https://themes.gohugo.io/). Vous allez voir, il y a du choix ! Une fois cela fait récupérez l'adresse de son repos Git. Petite précision, il est tout à fait possible d'installer plusieurs thèmes. Vous pourrez les tester assez facilement localement. Par contre une fois que vous en aurez choisi un et que vous l'aurez bien tout paramétré, si vous voulez en changer ou simplement en tester un autre, je vous conseil de créer une nouvelle branche sur Git. Ainsi, pas d'inquiétude sur votre beau paramétrage tout beau tout propre. Rien n'est perdu !

A la racine de votre projet entrez la commande :

```
git submodule add <Url-de-mon-repos-git> themes/<nom-de-mon-thème>
```

On va alors activer notre thème. Quand je vous disais qu'on pouvait avoir plusieurs thèmes d'installer et bien c'est ici que l'on va choisir celui que l'on active. Dans le fichier `config.toml` indiquez quel thème on utilise :

```
theme = "<nom-de-mon-thème>"
```

## Lancer le serveur

Afin de visualiser directement notre site et ainsi voir simplement les modification qu'on y apporte, Hugo est sympa, il nous permet de déployer localement notre site via la commande :

```
hugo server
```

On obtient alors :

```
PS C:\Users\victor\Documents\Developpement\hugo\blog> hugo server
Start building sites … 

                   | FR
-------------------+-----
  Pages            | 26
  Paginator pages  |  0
  Non-page files   |  1
  Static files     |  2
  Processed images |  0
  Aliases          |  6
  Sitemaps         |  1
  Cleaned          |  0

Built in 52 ms
Watching for changes in C:\Users\victor\Documents\Developpement\hugo\blog\{archetypes,assets,content,data,layouts,static,themes}
Watching for config changes in C:\Users\victor\Documents\Developpement\hugo\blog\config.toml
Environment: "development"
Serving pages from memory
Running in Fast Render Mode. For full rebuilds on change: hugo server --disableFastRender
Web Server is available at http://localhost:1313/ (bind address 127.0.0.1)
Press Ctrl+C to stop
```

Hugo va d'abord builder le projet et afficher dans un tableau un résumé de ce qu'il a généré. Il va ensuite lancer le serveur et indique à quel adresse le site est accessible. Ici http://localhost:1313. Vous pouvez alors visualiser votre beau site ! Joie.

Au passage, une fois le serveur lancé, il rebuild à chaque modification que vous faites. Vous pouvez visualiser ce que vous faites en temps réel.

Si on souhaite simplement builder le projet il suffit d'entrer : `hugo` et si l'on souhaite au passage minifier les fichiers on peut rajouter `hugo --minify`.

## Paramétrer notre thème

Le souci c'est que là pour le moment, le thème est un peu brute .. il y a de bonnes chances qu'il y ait des choses que vous ne voulez pas qui apparaisse, des liens, des photos, des onglets, bref, il faudrait le personnaliser un peu.

Pour ça, on va rajouter deux trois petites choses dans le fichier `config.toml`.

De base il n'y a pas grande chose.

```
baseURL = "http://example.org/"
languageCode = "en-us"
title = "My New Hugo Site"
```

La baseURL vous l'aurez compris c'est l'adresse de votre site. Pendant la phase de développement, vous pouvez laisser "/".
Le languageCode est la langue par défaut. Hugo supporte le multi-lingue mais je ne l'ai pas mis en place. Si vous êtes francophone comme moi, indiquez simplement "fr-fr".
Enfin pour title, là pas de surprise, préciser comment vous voulez appeler votre site.

Pour la suite, ça dépend de votre thème. Avec celui ci vous trouverez un exemple de config que vous pourrez trouver `/themes\anatole\exampleSite\config.toml`. Vous y trouverez tout pleins d'infos pour paramétrer votre thème. Auteur, adresse mail, lien, photo etc. Vous n'avez qu'à copier les paramètres que vous voulez personnaliser et les coller dans votre propre fichier `config.toml`.

## Ajouter un article

Là c'est cool, vous commencez à avoir un site qui vous ressemble. Mais ça serez pas mal d'ajouter des articles non ? Si.
Pour cela il suffit d'entrer la commande :

```
hugo new posts/nom-de-mon-article.md
```

 En fait, ça créé un fichier ` nom-de-mon-article.md` dans le répertoire `content/posts`. Ouvrez le fichier. Vous y trouverez l'en-tête suivant :

```
---
title: "MonArticle"
date: 2020-10-25T13:01:47+01:00
draft: true
---
```

Les "---" permettent de spécifier l'en-tête. A l'intérieur, on retrouve le titre, la date de création. Vous pouvez modifier les valeurs.
Ensuite on trouve le paramètre `draf=true`. Ca vous allez le voir, c'est plutôt cool. Ca permet de dire à Hugo que l'on veut publier cet article. Si ce n'est pas le cas parce que nous sommes en train de travailler sur cet article vous pouvez mettre la valeur à false. Ainsi, il ne sera pas publier et donc non visiblement sur le site.

 Dans l'en-tête vous pouvez rajouter tout un tas de chose comme par exemple une description, des tags, des catégories etc..

```
description: Un exemple de description
tags: [ "hugo", "themes" ]
categories: [ "themes" ]
series: ["Hugo"]
```

Ensuite en dehors de l'en-tête vous pouvez écrire votre article en markdown comme on en a l'habitude. Une fois que vous êtes satisfait, vous pouvez le visualiser sur le site (n'oubliez pas la variable draft à true ;) )

## Customiser le thème choisi

Votre thème est chouette mais il ne vous plait pas complétement ? Vous souhaitez changer la couleur de fond, modifier la taille de la navbar ou du menu ? Rajouter du JS ? C'est possible en surchargeant le thème.

Afin de surcharger votre thème, rajoutez un répertoire assets à la racine du projet. A l'intérieur, placez le code que vous voulez remplacer.
On obtient l'architecture suivante :

```
.
└── assets
    └── css
        └── custom.css
    └── js
        └── custom.js
```

Par exemple, j'ai voulu que la slidebar à gauche ne prenne que 20% de la largeur de l'écran. J'ai donc créé un fichier assets/css/custum.css dans lequel j'ai placé les classes css qui vont remplacer celles du style.css par défaut du thème. On surcharge le thème.

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

## CI 

Nous pouvons maintenant déployer notre site via Github.

Créons un fichier deploy.yml

```yml
# This is a basic workflow to help you get started with Actions

name: CI

# Controls when the action will run. Triggers the workflow on push or pull request
# events but only for the main branch
on:
  push:
    branches: main
    
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Git checkout
        uses: actions/checkout@v2

      - name: Update theme
        # (Optional)If you have the theme added as submodule, you can pull it and use the most updated version
        run: git clone https://github.com/victorprouff/anatole themes/anatole

      - name: Setup hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: 'latest'

      - name: Build
        # remove --minify tag if you do not need it
        # docs: https://gohugo.io/hugo-pipes/minification/
        run: hugo --minify -d "public"
        
      - name: SFTP Deploy
        uses: SamKirkland/FTP-Deploy-Action@3.1.1
        with:
          ftp-server: ${{ secrets.FTP_SERVER }}
          ftp-username: ${{ secrets.FTP_USER }}
          ftp-password: ${{ secrets.FTP_PASSWORD }}
          local-dir: public/
```