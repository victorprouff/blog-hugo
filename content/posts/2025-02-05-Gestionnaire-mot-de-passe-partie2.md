---
title: "Gestionnaire de mot de passe - Partie 2 - Installation"
description: "🔐 Pourquoi choisir Bitwarden comme gestionnaire de mots de passe ?
Vous hésitez encore à confier vos mots de passe à un gestionnaire ? Sécurité, simplicité, transparence… Bitwarden coche toutes les cases ! Open source, ultra-complet en version gratuite et abordable en premium, il offre un contrôle total sur vos données, avec même la possibilité de l’héberger vous-même. Découvrez comment l’installer, l’utiliser et sécuriser votre vie numérique sans prise de tête. 🚀🔑"
summary: "🔐 Pourquoi choisir Bitwarden comme gestionnaire de mots de passe ?
Vous hésitez encore à confier vos mots de passe à un gestionnaire ? Sécurité, simplicité, transparence… Bitwarden coche toutes les cases ! Open source, ultra-complet en version gratuite et abordable en premium, il offre un contrôle total sur vos données, avec même la possibilité de l’héberger vous-même. Découvrez comment l’installer, l’utiliser et sécuriser votre vie numérique sans prise de tête. 🚀🔑"
date: 2025-02-05T07:51:05+01:00
categories: [ "Outils"]
tags: [ "sécurité", "multi os", "outils" ]
draft: false
---

<img src="/img/2025-02-05-Gestionnaire-mot-de-passe-partie2/bitwarden.png" alt="bitwarden" style="zoom:70%;" class="center" />

## Pourquoi Bitwarden

Il existe beaucoup de gestionnaires de mot de passe. Mais je ne confierais pas mes mots de passe à n'importe quel acteur, ce sont des données extrêmement sensibles qui protègent la totalité de ma vie numérique. Beaucoup pourraient même argumenter que ce n'est pas souhaitable de confier ces données à une entreprise. Je préfère personnellement choisir la bonne entreprise en utilisant des critères sévères car gérer moi-même mes mots de passe abaisserait drastiquement ma sécurité en plus de créer un stress lié à sa gestion et un risque de perte.

Bitwarden coche tous mes critères :

- Open Source : La base de code de Bitwarden est open source est accessible librement à tout un chacun qui souhaiterait comprendre le code, l'auditer ou proposer une correction ou amélioration. C'est pour moi un gage de confiance et de sécurité. Des chercheurs en cybersécurité peuvent chercher des failles et les remonter. Elles sont ainsi rapidement corrigées.
- La version gratuite est très complète. Contrairement à beaucoup d'autres gestionnaires, la version gratuite permet d'avoir une sécurité complète sur tous nos appareils. Il n'y a pas de limite.
- La version payante est très abordable : à 10€ l’année je pense que c'est l'un des moins cher. Il rajoute quelques petites options. Personnellement je l'ai prise plus pour soutenir le travail des développeurs que pour en avoir un véritable usage.
- Hébergeable : Oui, si l'on veut gérer soi-même Bitwarden sur son propre serveur, c'est complètement possible. Cela permet d'avoir la sécurité d'un outil fiable et solide avec en plus la certitude que les données sont chez nous. Par contre, il faut gérer les accès, les back-up et tout le tralala. Cet article ne s'adresse pas vraiment à cette catégorie d'utilisateur plus expérimenté donc je ne m'étendrais pas là-dessus.

## Installation

C'est très simple il suffit de se créer un compte sur leur [site](https://bitwarden.com/fr-fr/go/start-free/). Téléchargez également l'application sur vos appareils (Android, IOS, IPadOs) et installez l'extension sur votre navigateur préféré.
Dans la suite je vais commencer par prendre l'exemple d'un usage sur Ordinateur via l'extension navigateur parce que c'est l'usage le plus basique. Nous verrons l'usage sur mobile dans un prochain article.

Notez que l'apparence de l'extension et des applications sont sensiblement identiques. Je ne représenterais pas les applications.

## Présentation

Vous devriez retrouver l'extension en haut de votre navigateur (ici sur Firefox)

<img src="/img/2025-02-05-Gestionnaire-mot-de-passe-partie2/bitwarden1.png" alt="Bitwarden Extension" style="zoom:100%;" class="center" />

Cliquez dessus et connectez-vous.

Vous devriez arriver dans votre coffre-fort. Ici vous trouverez listé tous les sites pour lesquels vous avez enregistré un ou plusieurs mots de passe (1). Vous pouvez en rechercher un (2). Notez que Bitwarden détecte l'URL sur lequel vous vous trouvez et si celle-ci match avec une URL d'un mot de passe présent dans votre coffre, il la met en première (3).

<img src="/img/2025-02-05-Gestionnaire-mot-de-passe-partie2/bitwarden2.png" alt="Bitwarden" style="zoom:50%;" class="center" />

Votre coffre à vous devrait être vide. Nous allons voir un peu plus loin comment le remplir.

En bas vous avez 4 onglets. Le premier `Coffre` que l'on vient de voir. Le second `Générateur`est intéressant. Il permet de générer des mots de passe ainsi que des phrases de passe. Le tout avec certains critères :

- S'il contient des lettres majuscules ou minuscules,
- des chiffres,
- des caractères spéciaux,
- une longueur spécifique
- etc.

Bien pratique pour générer un mot de passe sans avoir à réfléchir à sa complexité. Rappelons que l'intérêt d'un gestionnaire est justement de vous décharger de la charge mentale de gérer des mots de passe. Vous n'aurez plus à les retenir ! Vous pouvez donc augmenter drastiquement la complexité de vos mots de passe.

<img src="/img/2025-02-05-Gestionnaire-mot-de-passe-partie2/bitwarden3.png" alt="Bitwarden" style="zoom:50%;" class="center" />

Je passe rapidement sur le 3e onglet. Il permet d'envoyer un texte ou un fichier à un tiers de manière chiffré protégé par un mot de passe. Ça peut être bien pratique pour échanger des données sensibles. Nous ne verrons pas cet usage ici mais sachez que ça existe. Son fonctionnement est très simple et permet de limiter le nombre de lectures ou encore de spécifier une date d'expiration.

<img src="/img/2025-02-05-Gestionnaire-mot-de-passe-partie2/bitwarden4.png" alt="Bitwarden" style="zoom:50%;" class="center" />

Le dernier onglet permet comme son nom l'indique de gérer les paramètres. Allez y faire un tour, c'est classique. On peut modifier son mot de passe, modifier l'apparence de l'extension avec un thème sombre et un thème clair, gérer la sécurité, etc.

Allez y faire un tour, c'est toujours bon à explorer.

<img src="/img/2025-02-05-Gestionnaire-mot-de-passe-partie2/bitwarden5.png" alt="Bitwarden" style="zoom:50%;" class="center" />

### Paramètres de Sécurité

Un petit mot rapide sur les paramètres de sécurité :

<img src="/img/2025-02-05-Gestionnaire-mot-de-passe-partie2/bitwarden6.png" alt="Bitwarden" style="zoom:50%;" class="center" />

Vérifier que le délai d'expiration est bien réglé a minima sûr `Au démarrage du navigateur` . Cela verrouillera votre coffre dès que votre navigateur redémarrera. Vous pouvez également mettre un délai de quelques minutes à quelques heures. Je vous déconseille de cocher `Jamais`. L'intérêt d'un coffre est d'être verrouillé sinon autant écrire vos mots de passe dans un bloc-notes (S’il vous plaît, ne faites pas ça).

Si votre ordinateur ou smartphone le permet, vous pouvez activer le `Dévérouillage par biometrie` . Cela rajoutera du confort à l'utilisation.

## Enregistrement d'un nouveau mot de passe

Il existe deux manières d'ajouter des mots de passe à notre coffre.

- Manuellement
- Automatiquement

Nous allons voir les deux méthodes.

### Manuellement

Dans votre coffre cliquez sur `Nouveau` puis `Identifiants`. Notez qu'il est également possible d'enregistrer des CB, des identités ou bien des notes.

<img src="/img/2025-02-05-Gestionnaire-mot-de-passe-partie2/bitwarden7.png" alt="Bitwarden" style="zoom:100%;" class="center" />

Commençons par donner un nom à notre identifiant (1), cela permet de le rechercher. Si vous avez plusieurs identifiants pour un même site cela permet de les reconnaître (un compte admin, un compte user par exemple).

Ensuite on peut choisir un dossier (2) pour ranger nos identifiants en fonction de son caractère personnel, professionnel ou autre selon notre envie.

Viennent ensuite les identifiants de connexion (3 et 4), un nom d'utilisateur et un mot de passe. Notez qu'il est possible d'en générer un via la petite roue à droite du champ de saisi. Pratique si vous ne voulez pas utiliser votre nom et si vous voulez générer un mot de passe résistant.

Si vous n'êtes pas encore à l'aise à l'idée d'utiliser un gestionnaire de mot de passe, vous pouvez commencer par enregistrer un mot de passe que vous connaissez. Vous pourrez toujours le modifier plus tard en le remplaçant par un mot de passe plus complexe.

<img src="/img/2025-02-05-Gestionnaire-mot-de-passe-partie2/bitwarden8.png" alt="Bitwarden" style="zoom:100%;" class="center" />

On retrouve en (6) l'URL de saisie automatique. C'est cette url qui si elle est détectée permettra de remplir les champs de connexion automatiquement. Notez qu'il est possible d'en remplir plusieurs. On trouve ensuite un champ de note (7) pratique pour noter des informations complémentaires sur ce compte que l'on voudrait protéger. Enfin, une case à cocher (8) permet de saisir l'option de demander le mot de passe principal pour cet identifiant spécifiquement. Cela rajoute une couche de sécurité au besoin.

Notez qu'il est possible de rajouter des champs spécifiques à cet identifiant au besoin.

Cliquez sur `Enregistrer` et ça y est, félicitation, vous avez créé votre premier identifiant !

Bon, c'est un peu long et on peut faire plus simple avec la saisie automatiquement !

### **Automatique**

Ce cas est très pratique lorsque vous vous créez un nouveau compte sur un site internet. Allez sur le site en question et remplissez simplement les champs demandés.

Au moment de la saisie du mot de passe, allez sur Bitwarden sur l'onglet Générateur pour en créer un.

<img src="/img/2025-02-05-Gestionnaire-mot-de-passe-partie2/bitwarden9.png" alt="Bitwarden" style="zoom:100%;" class="center" />

Choisissez bien Mot de passe (1). Dans les options, réglez la longueur (2). Et là, pas de chichi ! On peut se laisser aller en longueur, ce n'est pas nous qui allons le mémoriser de toute façon !

Juste en dessous vous pouvez régler les types de caractères et leur nombre à inclure. Idéalement incluez tout. Plus il y en a, mieux c'est.

Notez que certains sites un peu anciens ou ayant une notion de la sécurité assez vague vous empêcheront de mettre certains caractères ou de créer un mot de passe trop long. Adapter les réglages en fonction de la situation mais sauf pour ce cas spécifique, plus le mot de passe sera long et complexe mieux ça sera !

Enfin vous pouvez régénérer votre mot de passe s'il ne vous convient pas (4) enfin vous pouvez le copier dans votre presse papier (5) pour le coller directement dans le champ mot de passe de votre formulaire.

Il ne vous reste plus qu'à valider la création de votre compte.

Une pop-up devrait apparaître comme ceci :

<img src="/img/2025-02-05-Gestionnaire-mot-de-passe-partie2/bitwarden10.png" alt="Bitwarden" style="zoom:100%;" class="center" />

Plusieurs options s'offrent à vous. Vous pouvez choisir de ne jamais enregistrer de mot de passe (1) cela est pratique dans certains cas pour éviter de subir la pop-up quand vous savez que vous ne sauvegarderez jamais votre mot de passe sur un site spécifique.

Vous pouvez ensuite sélectionner un dossier (2), modifier l'identifiant (3) si vous voulez rajouter une note, une autre URL. Enfin vous pouvez enregistrer votre identifiant.

Une fois fait, vous le retrouverez dans la liste des identifiants suggérés pour ce site dans Bitwarden.

Et c'est tout ! :)

Notez que dans de rares cas, il arrive que la pop-up n'apparaisse pas. Cela a dû m'arriver une ou deux fois en plusieurs années d'utilisation donc je me permets de le préciser. Si cela arrive, pas de panique ! Enregistrez simplement vos identifiants à la main comme vue un peu plus haut.

## Utilisation

Maintenant que nous avons enregistré un identifiant nous allons voir comment se connecter au site sans avoir à mémoriser le mot de passe.

Allez sur la page d'authentification d'un site dont vous avez mémorisé l'identifiant. Cliquez simplement sur un champ du formulaire, l'icône de Bitwarden devrait apparaître et la liste des identifiants enregistrée pour ce site devrait apparaître.

<img src="/img/2025-02-05-Gestionnaire-mot-de-passe-partie2/bitwarden11.png" alt="Bitwarden" style="zoom:100%;" class="center" />

Vous n'avez plus qu'à cliquer sur l'identifiant de votre choix pour que le formulaire se remplisse tout seul, magique !

Si la liste n'apparaît pas, cela peut arriver, cette option est encore assez récente dans Bitwarden et n'est pas forcément activée partout.

Pour l'activer, allez dans les paramètres, dans `Saisie automatique`.

<img src="/img/2025-02-05-Gestionnaire-mot-de-passe-partie2/bitwarden12.png" alt="Bitwarden" style="zoom:100%;" class="center" />

Assurez-vous que l'option `Afficher les suggesions de saisie automatique dans les champs d'un formulaire` soit cochée.

Si vraiment malgré le fait que l'option soit cochée, la liste ne s'affiche pas, on peut remplir le formulaire à l'ancienne :)

<img src="/img/2025-02-05-Gestionnaire-mot-de-passe-partie2/bitwarden13.png" alt="Bitwarden" style="zoom:100%;" class="center" />



Cliquez simplement sur l'icône (1) de l'extension du gestionnaire (un nombre devrait être à côté, ici 1. Il représente le nombre d'identifiant enregistré pour ce site).

Vous retrouvez la liste des suggestions pour ce site et vous pouvez remplir l'identifiant (2).

Vous pouvez également rechercher un identifiant spécifique dans la barre de recherche.

## **Modification**

La manipulation pour modifier un mot de passe est sensiblement la même que pour enregistrer un mot de passe. Elle peut changer d'un site mais la logique globale reste la même. Je vais prendre l'exemple d'un changement de mot de passe sur Facebook.

Allez dans les paramètres au niveau de la sécurité et demandez de changer de mot de passe.

Saisissez votre mot de passe actuel (vous pouvez pour cela utilisez la même méthode qu'une saisie manuelle pour se connecter à un site vu dans précédemment).

Générer un mot de passe dans Bitwarden et collez-le dans les champs prévus à cet effet.

<img src="/img/2025-02-05-Gestionnaire-mot-de-passe-partie2/bitwarden14.png" alt="Bitwarden" style="zoom:80%;" class="center" />

Validez (dans mon cas, cliquez sur Changer le mot de passe).

Selon les cas, il vous sera proposé de modifier votre mot de passe via une pop-up qui apparaîtra comme à la création d'un nouveau compte. C'est le cas le plus simple.

Rassurez-vous si ce n'est pas le cas, allez dans Bitwarden, et cliquez sur votre identifiant (1).

<img src="/img/2025-02-05-Gestionnaire-mot-de-passe-partie2/bitwarden15.png" alt="Bitwarden" style="zoom:100%;" class="center" />

Vous retrouvez alors toutes les infos de votre identifiant. Cliquez sur Modifier. Vous pouvez alors modifier votre mot de passe (en collant celui que vous aviez copié plus tôt).

<img src="/img/2025-02-05-Gestionnaire-mot-de-passe-partie2/bitwarden16.png" alt="Bitwarden" style="zoom:100%;" class="center" />

N'oubliez pas d'enregistrer !

Et c'est tout bon :)

## **Import/Export**

Avant de vous laisser, je voudrais vous montrer comment exporter et importer votre coffre. En effet, l'idée n'étant pas de vous enfermer, il vous est tout à fait possible de changer de crémerie en changeant de gestionnaire de mot de passe.

Je l'ai moi-même fait il y a quelques années en passant de Keepass à LastPass puis à Bitwarden.

C'est très simple. Dans les paramètres de Bitwarden allez dans `Coffre`

<img src="/img/2025-02-05-Gestionnaire-mot-de-passe-partie2/bitwarden17.png" alt="Bitwarden" style="zoom:100%;" class="center" />

#### Exporter le coffre

Allez dans `Exporter le coffre`.

<img src="/img/2025-02-05-Gestionnaire-mot-de-passe-partie2/bitwarden18.png" alt="Bitwarden" style="zoom:80%;" class="center" />

On vous demande alors de choisir un format de fichier. Vous pouvez le laisser par défaut à moins que vous choisissiez de chiffrer votre coffre. Cela peut être une bonne idée afin de le protéger. En effet, tous vos identifiants, mots de passe et Carte bancaires enregistré seront lisibles dans un simple fichier texte. Ce document est critique.

Choisissez `json (Encrypted)` et cochez `Protégé par un mot de passe` pour utiliser un mot de passe ou `Compte restreint` pour que le coffre soit associé à votre compte Bitwarden.

<img src="/img/2025-02-05-Gestionnaire-mot-de-passe-partie2/bitwarden19.png" alt="Bitwarden" style="zoom:80%;" class="center" />

Cliquez sur `Exporter le coffre`.

Encore une fois, faite très attention à comment vous stockez et transmettez ce fichier. Détruisez-le, une fois qu'il n'est plus utile après un import par exemple.

#### **Import**

Ici vous pourrez ajouter, supprimer ou modifier vos dossiers, importer des mots de passe ou bien exporter votre coffre. Allez dans `Importer des données`.

<img src="/img/2025-02-05-Gestionnaire-mot-de-passe-partie2/bitwarden20.png" alt="Bitwarden" style="zoom:80%;" class="center" />

Vous pouvez choisir un dossier spécifique. Choisissez le format de fichier en fonction de l'origine du coffre que vous voulez importer. Choisissez le fichier à importer puis cliquez sur `Importer des données`.

Et voilou ! :)

## **Conseils**

Je vous conseille d'y aller petit à petit. Ajoutez vos mots de passe au fur et à mesure de votre navigation internet sans les modifier. Prenez le temps d'appréhender l'outil. Au bout de quelques jours à quelques semaines vous devriez être relativement habitués et rassuré quant à l'utilisation du gestionnaire. À ce moment-là, commencez à remplacer les mots de passe des sites critiques comme vos adresses mails. Puis vous pourrez étendre aux restes. Chaque modification de vos anciens mots de passe vous sécurisera un peu plus.

Personnellement, ça m'a enlevé d'un poids lorsque je suis passé aux gestionnaires de mots de passe. Je savais que mon usage n'était pas très sécurisant et cela me stressait et créé de la charge mentale. Maintenant c’est fini. :)

Et vous ? Est-ce que ça vous à aider à sauter le pas ?

