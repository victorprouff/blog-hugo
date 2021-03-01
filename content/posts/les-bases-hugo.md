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

## Installation

La [documentation](https://gohugo.io/documentation/) est très bien faite d'Hugo, je vous laisse la lire pour les détails.

Installation sous linux :

```
sudo apt-get install hugo
```

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

 Dans l'en-tête vous pouvez rajouter tout un tas de chose comme par exemple une description, des tags, des catégories etc.

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

Par exemple, j'ai voulu que la slidebar à gauche ne prenne que 20% de la largeur de l'écran. J'ai donc créé un fichier assets/css/custum.css dans lequel j'ai placé les classes CSS qui vont remplacer celles du style.css par défaut du thème. On surcharge le thème.

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

@media screen and (max-width: 960px),
print {
    .sidebar {
        width: 100%;
        position: absolute;
        border-right: none;
        z-index: 1;
    }
    .content {
        margin-top: 420px;
        width: 100%;
        z-index: 2;
        position: absolute;
    }
    .page-top {
        width: 100%;
    }
}
```

J'ai eu une petite surprise à ma première tentative : l'effet était nickel sauf quand je redimensionnais la page au format téléphone. Là, c'était le bordel ! Après quelques tests, j'ai compris qu'il fallait rajouter les classes du média `@media screen and (max-width: 960px)`. Vu que le code contenu dans custom.css surcharge le style par défaut APRES celui ci, il vient le remplacer et donc annuler l'effet du @media.

Une fois votre modification ajouté, il faut spécifier la surcharge dans le fichier `config.toml`.

```  
customCss = ["css/style.css", "css/custom.css"]
customJs = []
```

## Automatiser le déploiement avec une belle CI 

Bon là normalement, on en est à avoir un joli site qui nous va bien. C'est cool. Mais il est en local sur notre ordi. C'est pas dingo. Nous on veut que le monde (ou notre mamie) puisse admirer nos articles !

Alors là il y a deux méthodes. Soit on fait la commande `hugo` qui nous génère dans `/public` notre site statique qu'ensuite on le copie et on le colle sur le serveur soit à la main soit (un peu mieux) via FTP. C'est cool .. Mais c'est chiant.

Soit on fait ça bien et on automatise.

J'ai choisi d'héberger mon code sur Github. Gitlab fait la même chose donc aucun souci mais par contre, il me semble que la méthode est un peu différente. Donc la suite pourrait donc être à adapter selon la solution que vous avez choisi.

L'idée est que Github et Gitlab ont mis en place gratuitement le déploiement continue. Ca en général les développeurs connaissent et aiment bien ça.
Pour faire simple, on va pouvoir exécuter une ou plusieurs actions si un ou plusieurs événements survient.

Dans notre cas nous allons lorsque l'on pousse une modification sur la branche main, lancer une VM avec la dernière version d'Ubuntu dessus, récupérer notre thème, installer hugo, builder et minifier le code, et enfin le déployer sur l'hébergement de notre choix via FTP. Autant d'action qui vont se faire automatiquement sans que l'on ait à intervenir.

En gros on pousse une nouvelle version du code sur la branche main, on a 2 mins et notre site est mis à jour. Point. Je trouve ça puissant, pas vous ? :P 

Pour commencer, dans Github, cliquez sur Actions puis `set up a workflow yourself`.

![Github Actions](/img/github-actions.png)

On nous propose alors de créer un fichier `.github/workflows/deploy.yml`. Le nom importe peu mais le chemin lui oui. A gauche on a le contenu du fichier et à droite les différents services que nous pouvons utiliser. C'est plutôt bien foutu, on peut faire une recherche et avoir la doc directement dans la page.

![CI](/img/CI.png)

Vous pouvez nommer le fichier comme vous voulez. A l'intérieur, j'ai rajouté le paramétrage de la CI :

```yml
name: CI

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
        # J'ai choisi de faire un fork du thème que j'utilise. Ca me permet d'avoir une version stable et de choisir quand je fais la 
        # mise à jour. Vous pouvez très bien mettre directement le repos de votre thème
        run: git clone https://github.com/victorprouff/anatole themes/anatole

      - name: Setup hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: 'latest'

      - name: Build
        # remove --minify tag if you do not need it
        # docs: https://gohugo.io/hugo-pipes/minification/
        run: hugo --minify
        
      - name: SFTP Deploy
        #uses: SamKirkland/FTP-Deploy-Action@3.1.1
        uses: airvzxf/ftp-deployment-action@latest
        with:
          server: ${{ secrets.FTP_SERVER }}
          user: ${{ secrets.FTP_USER }}
          password: ${{ secrets.FTP_PASSWORD }}
          local_dir: ./public
```

Petite précision : Dans un précédent projet j'avais utilisé `SamKirkland/FTP-Deploy-Action@3.1.1` pour gérer l'envoie FTP. Je n'avais eu aucun problème. Quand j'ai voulu utiliser le même service avec le blog, impossible. La connexion se faisait bien mais il me copiait tout le répertoires de la racine SANS `public` et j'y ait passé une soirée complète. J'ai finit par tester un autre service à tout hasard, et ça a marché du premier coup... 

Voila note à moi même, parfois essayer autre chose, bas c'est mieux.

Une fois que vous avez modifié votre fichier, faite un commit. Dans Actions, vous devriez voir l'avancement de votre CI. Pouvez voir les détails de chaques étapes et en cas d'erreur c'est ici qu'elle s'affichera.

Si tout ce passe bien, au bout d'une ou deux minutes vous pourrez constater à l'url de votre site qu'il a bien été déployé. Youpi :)

## Conclusion

Voila, on un site statique fonctionnel et un petit workflow qui va bien pour le déployer automatiquement.
J'ai écrit cet article en apprenant moi même à me servir d'Hugo donc il y a surement des trous, des manques, des erreurs etc. N'hésitez pas à m'en faire par par mail en attendant les commentaires ;) Je pense que je mettrai à jour l'article en fonction de l'amélioration que je pourrai faire plus tard.

Je pense aussi faire d'autres articles sur Hugo à l'avenir au fur et à mesure de mes recherches sur le sujet. Le principe des sites statiques me bottes bien et j'ai vraiment envie de creuser la question. Je pense notamment à la mise en place des commentaires mais également à la personnalisation plus poussé d'un thème. 
L'outil a l'air très puissant et je n'ai fait qu'effleurer ces possibilités.

Aller, des bisous