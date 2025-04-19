---
title: "Gestionnaire de mot de passe - Partie 1 - Présentation"
description: "🔒 Vos mots de passe sont-ils vraiment sécurisés ? 🔒
On a tous des dizaines (voire des centaines) de comptes en ligne, mais comment bien les protéger sans se prendre la tête ? Cet article vous explique pourquoi des mots de passe uniques et complexes sont essentiels, comment les pirates les craquent, et surtout, quelle solution simple et efficace adopter pour ne plus jamais en oublier un seul. 🚀 Ne laissez pas votre sécurité au hasard, découvrez le gestionnaire de mots de passe qui va changer votre quotidien ! 🔑💡"
summary: "🔒 Vos mots de passe sont-ils vraiment sécurisés ? 🔒
On a tous des dizaines (voire des centaines) de comptes en ligne, mais comment bien les protéger sans se prendre la tête ? Cet article vous explique pourquoi des mots de passe uniques et complexes sont essentiels, comment les pirates les craquent, et surtout, quelle solution simple et efficace adopter pour ne plus jamais en oublier un seul. 🚀 Ne laissez pas votre sécurité au hasard, découvrez le gestionnaire de mots de passe qui va changer votre quotidien ! 🔑💡"
date: 2025-01-28T08:40:02+01:00
categories: [ "Outils"]
tags: [ "sécurité", "multi os", "outils" ]
draft: false
---

# Le problème des mots de passe

Dès qu'on commence à mettre un pied sur internet, on se retrouve à créer des comptes un peu partout. Boites mail, réseaux sociaux, banques, sites e-commerce etc. Assez rapidement on peut se retrouver avec des dizaines, voire **des centaines de comptes à gérer**. Personnellement, j'en compte plus de 400.

À ce constat simple il faut rajouter le fait qu'on nous rabâche un peu partout, qu'il faudrait avoir des mots de passe **fort**, des mots de passe **unique** pour chaque site et des mots de passe qui **change régulièrement** pour chacun d'entre eux.

Mais pourquoi ? Pourquoi on ne pourrait pas utiliser Gérard1967 partout où on me demande de m'authentifier ? Pourquoi ce mot de passe est considéré comme faible alors qu'il contient quand même 10 caractères ?

Avant de répondre à ces questions, je voudrais revenir sur le pourquoi on utilise des mots de passe. Pourquoi on a besoin de s'authentifier, idéalement, de manière très rigoureuse, lorsqu'on navigue sur internet.

## Pourquoi nos données sont importantes

On ne s'en rend pas compte mais l'authentification des sites que l'on visite cache des données extrêmement sensibles. L'exemple qui vient rapidement à l'esprit est : si un pirate réussi a accédé à votre compte bancaire, il aura accès à votre compte courant, vos différents livrets, comptes Epargne Retraite, PEL etc. En un rien de temps vous pourriez vous retrouver dans de grosses galères financières.

Un autre exemple de données sensibles, c'est celles relatives à votre identité. Votre nom, prénom, age, genre, taille, poids, photos, opinions divers et variés, abonnement à tel ou tel revues ou sites, sexualité etc. Ces informations peuvent permettre de faire de l'**usurpation d'identité** ou de la revente d'informations. Elles peuvent également permettre de vous faire chanter si ce sont des données honteuses (je pense par exemple à des vieilles photos oubliées au fond d'un réseau social, ou des images à caractères sexuelles).

Ne pensez pas que les informations que vous laissez traîner sur internet n'existent pas sous prétexte que c'est numérique. **Le virtuel est réel**. Et si nôtre espace virtuel est compromis cela peut avoir de **grave conséquence dans le monde physique**.

**Protégez notre monde numérique est aussi important que de bien fermer la porte de chez soi**.

Revenons donc à nos questions sur les mots de passe.

## La force des mots de passe

### Attaque par force brute

La force d'un mot de passe est définie par sa longueur et sa complexité.

Pour pénétrer dans un espace numérique verrouillé, un pirate peut utiliser plusieurs techniques. L'une d'entre elles est d'essayer t**outes les combinaisons de mot de passe possible** jusqu'à ce que ça marche. Ça paraît très basique et très bourrin mais ça fonctionne. Surtout pour les petits mots de passe. C'est ce qu'on appelle une **attaque par force brute**. Et ça porte très bien son nom.

Les pirates vont utiliser des programmes (oui ils ne vont pas faire ça à la main...) qui vont tester toutes les combinaisons : a, b, c, ..., aa, ab, ac, ..., zjheb, zjhec, zjhed, en augmentant petit à petit la longueur.

Forcément, on se rend compte ici que plus **un mot de passe est long et contient des caractères variés** (minuscules, majuscules, nombres, caractères spéciaux) plus il va **mettre du temps à être craqué**.

Ce tableau montre le nombre de combinaison possible en fonction du nombre de caractères et du type de caractères qu'il contient.

| Type                               | 1 caractère | 3 caractères | 6 caractères  | 9 caractères |
| ---------------------------------- | ----------- | ------------ | ------------- | ------------ |
| lettres minuscules                 | 26          | 17 576       | 308 915 776   | 5,4 × 10^12  |
| lettres minuscules et chiffres     | 36          | 46 656       | 2 176 782 336 | 1,0 × 10^14  |
| minuscules, majuscules et chiffres | 62          | 238 328      | 5,6 × 10^10   | 1,3 × 10^16  |

(Note : 1,0 × 10^14 est un nombre sous forme de puissance. Cela vaut un 1 suivi de 14 '0' derrière soit 100 000 000 000 000)

Dans le tableau ci-dessus, on voit bien que la **complexité augmente** non seulement avec la **longueur** mais surtout avec le **nombre possible de caractères**.

On voit donc bien l'intérêt de la complexité d'un mot de passe.

Je suis tombé sur cette infographie assez explicite sur le site [francenum.gouv.fr](https://www.francenum.gouv.fr/magazine-du-numerique/combien-de-temps-un-pirate-met-il-pour-trouver-votre-mot-de-passe-comment).

<img src="/img/2025-01-28-Gestionnaire-mot-de-passe-partie1/gestionnaireMotDePasse1.webp" alt="Temps pour casser des mots de passe" style="zoom:70%;" class="center" />

Il faut tenir compte de l'évolution rapide des technologies de déchiffrement et prendre une marge. Ainsi une longueur de **14 ou 15 caractères** pour un mot de passe incluant lettre minuscule/majuscules, nombres et caractères spéciaux **est une bonne base**.

### Attaque un peu plus intelligente

Mais un pirate peut faire les choses un peu plus intelligemment. Plutôt que de bêtement tester toutes les combinaisons, il peut se concentrer sur les plus probable. Il peut déjà commencer par tester les 1 000 000 mots de passes les plus courants. Cela ne lui prendra que quelques secondes pour un résultat déjà bien plus efficace.

Cette liste est facilement trouvable sur [internet](https://lucidar.me/fr/security/list-of-1000000-most-common-passwords/) grâce à des fuites de données.

On retrouve par exemple dans les 10 premières positions :

- 123456
- password
- 12345678
- qwerty
- 123456789
- 12345
- 1234
- 111111
- 1234567
- dragon

Mais également un peu plus loin :

- fuckme
- starwars
- coffee
- ...

Allez voir la liste et parcourez-la, vous trouverez de belles pépites ! 😅

Ensuite, il peut tester des combinaisons de mots connus, de nom propre, de date de naissance. Si c'est une **attaque ciblée sur une personne**, récupérer des informations sur la victime peut être très utile et facile. Aujourd'hui on trouve **énormément d'informations personnelles sur les réseaux sociaux**. Si on connaît le nom, le prénom, l'age, des membres de la famille, le nom de l'animal de compagnie d'une victime, on peut facilement générer quelques milliers de mots de passe très probable qu'il suffit d'essayer (de manière automatique). On est loin des milliards de combinaisons.

Là encore, on se rend compte de l'intérêt d'un mot de passe complexe qui n'a aucune cohérence visible. **Plus un mot de passe semble aléatoire et est long, plus il est solide**.

## Réutiliser les mots de passe

Un dernier point avant de passer aux solutions. Pourquoi ne pas avoir un mot de passe super long et fort et le réutiliser partout ?

C'est vrai, si le mot de passe est suffisamment résistant, il a peu de chance de tomber et peut ainsi protéger plusieurs sites !

Eeeeeet non. Très mauvaise idée. Pourquoi ?

Eh bien parce qu'il **ne faut pas sous-estimer les techniques de craquage de demain**. La puissance de calcul des ordinateurs continus d'augmenter et les rend le temps de décryptage de moins en moins long. De plus, des **fuites de données** apparaissent régulièrement et même de grosses entreprises ont des fuites. S'il y a eu une fuite sur un site où vous avez un compte, il faut considéré que le mot de passe utilisez dessus n'est plus sûr.

En parlant de fuite de données, allez faire un tour sur le site [haveibeenpwned](https://haveibeenpwned.com/). Ce site permet de vérifier si votre adresse mail (et donc potentiellement le ou les mots de passe associé aux comptes piratés) s'est retrouvée dans une fuite de données. Bien pratique pour lister les sites où il serait bien de changer de mot de passe.

<img src="/img/2025-01-28-Gestionnaire-mot-de-passe-partie1/gestionnaireMotDePasse2.webp" alt="haveibeenpwned" style="zoom:70%;" class="center" />

Pour mon exemple, je sais que deux de mes adresses mails se sont retrouvés dans 7 fuites.

Cela permet de se rendre compte aussi d'à quel point des **attaques sont fréquences** et que nous ne sommes pas à l’abri d'une perte de données même lorsque nous faisons attention. Et **cela concerne bien tout le monde**. Des plus petits aux plus grands acteurs.

Si nous récapitulons, les attaquants commencent par tester des mots de passes qui ont déjà fuité. S'il s'agit d'une attaque qui vous cible spécifiquement, il est facile de retrouver tous les mots de passes que vous avez déjà utilisés et qui ont fuité à partir de vos autres données personnelles (mails, nom, prénom) et de tester l'identifiant sur différents sites que vous auriez visité.

En ayant un **mot de passe différent** par site que vous utilisez, vous vous **protégez de cette attaque**. Si vous **changez de mot de passe** régulièrement, vous vous **protégez des fuites passées** !

## Solutions

Bon, après avoir exposé à quel point il est important d'avoir des identifiants complexes et qu'il faut renouveler régulièrement, on se retrouve face à deux problèmes auxquels tout le monde est confronté : **la mémoire et la flemme**. Je suis atteint personnellement de ces deux maux et si je devais gérer des centaines de mots de passe différents et suffisamment compliqué, j'abandonnerai avant même d'avoir essayé. 🥲 Et au vu des diverses discussions que j'ai pu avoir ici ou là avec mes proches et collègues, c'est le cas de la plupart des gens.

Il existe plusieurs méthodes plus ou moins bonnes pour gérer plusieurs mots de passe, allant du petit carnet, du post-it collé sur sous l'écran à des trucs plus élaboré ( < mot de passe fort unique> + <le nom de site visité>).

La réalité c'est que nous sommes **humains** et toutes ces méthodes sont **faillibles**. Vous aurez la flemme de changer de mot de passe s'il faut réécrire votre mot de passe à chaque fois que vous le changez. Gérer des centaines de mots de passes n'est pas viable avec un annuaire. Cela pousse à utiliser plusieurs fois le même mot de passe.

Il faut donc trouver mieux...

Et la solution est... oui vous l’avez deviné puisque c'est le titre de l'article et en plus de cette partie, roulement de tambours... Les gestionnaires de mots de passe !

# Les gestionnaires de mots de passe

## Mais qu'est ce que quoi que donc qu'un gestionnaire de mot de passe ?

Il faut les voir comme un **coffre-fort numérique**. Tous les mots de passe sont enfermés à l'intérieur complètement **chiffré (sécurisé et inaccessible)**. Pour y avoir accès il faut un **mot de passe maître**, le seul que vous aurez à retenir.

On peut accéder à notre gestionnaire via une extension sur le navigateur, d'application mobile ou directement sur l'ordinateur. Il en existe des payants et des gratuits, des [Open Source](https://fr.wikipedia.org/wiki/Open_source) et des propriétaires. Chacun ont des avantages et des inconvénients.

Le principe est assez simple. Lorsque l'on crée un compte sur un site, au moment de rentrer nos identifiants, le gestionnaire va proposer de les mémoriser. Il peut également générer des mots de passe fort. Une fois enregistré, lorsque l'on veut se connecter au site, il va **préremplir les champs login et mot de passe**. Il peut également gérer les cas où il y a plusieurs comptes sur site. Ils viennent souvent aussi avec des outils qui peuvent être très intéressants comme des notes sécurisées, une analyse de vos mots de passe pour vérifier qu'il n'y en a pas des communs et qu'ils sont suffisamment complexes etc.

Pour le choix du gestionnaire, ça peut être un peu compliqué puisqu'il en existe pas mal maintenant. En vrai, peu importe. Je vais vous décrire mes critères à moi pour en choisir un, mais libre à vous de choisir celui qui vous convient le mieux. Le tout c'est d'en utiliser un pour **augmenter sa sécurité** et **diminuer sa charge mentale**.

## Les gestionnaires des navigateurs et des systèmes d'exploitations

Avant de vous présenter des gestionnaires que je trouve intéressants, je pense qu'il est intéressant de s'arrêter sur les gestionnaires proposés par les navigateurs web et les systèmes d'exploitations (Android, IOs).

En effet depuis quelques années, ceux-ci proposent d'enregistrer vos identifiants pendant votre navigation.

Les gestionnaires des navigateurs étaient de vraies passoires au début. En effet, ils n'étaient pas du tout chiffrés et il était facile de récupérer la liste complète en clair. Pour un coffre-fort, on repassera...

Cela, c'est bien amélioré depuis mais je vous déconseille néanmoins de les utiliser.

Pourquoi ? Eh bien parce qu'il vous enferme.

Mettons que vous enregistriez vos identifiants dans Firefox ou Chrome. Très bien. Demain vous voulez vous identifier via sur une application comment vous faites ? Si vous voulez changer de navigateur ? Changer d'ordinateur ? Possible mais complexe à base de copier-coller foireux.

Pareil si vous utilisez ceux des OS. J'ai personnellement un téléphone sous Android, un Macbook et un ordinateur sous Windows. Où est ce que j'enregistre mes mots de passe sachant que je dois me connecter sur chacun de ces appareils ?

En utilisant une **application indépendante** du navigateur ou du système d'exploitation, **compatible** avec chacun d'entre eux, je ne me **ferme aucune porte**, je peux changer comme je l'entends d'appareil ou de navigateur, je ne m'enferme pas.

## Le choix

Les gestionnaires sont des éléments, **extrêmement sensibles**, vous vous en doutez et il ne faudrait pas qu'ils soient compromis ou qu'ils aient un problème.

C'est déjà arrivé avec LastPass qui a [subi plusieurs vols de données](https://www.lemonde.fr/pixels/article/2022/12/23/le-gestionnaire-de-mots-de-passe-lastpass-touche-par-une-fuite-de-donnees_6155508_4408996.html). On parle de données personnelles comme nom, prénom, adresse, mail. Je n'ai pas lu que des mots de passe ou données bancaire ont été volés.

Même si en théorie, les mots de passe sont à l’abri derrière un coffre-fort chiffré, et qu'ils sont normalement à l’abri de toutes intrusions, le simple fait qu'ils aient perdu des données clients et surtout la façon dont ils ont géré ça (très peu de communication avec les clients, mensonges etc.), ne me met pas du tout en confiance. Je déconseillerais donc fortement son utilisation.

J'aurais tendance personnellement à choisir un service **connu et reconnu**, d'éviter les petits gestionnaires connus de 3 personnes. Je préférerais aussi un outil **[open source](https://fr.wikipedia.org/wiki/Open_source)** qui peut-être relu et étudié par des ingénieurs sécurités.

Voici quelques-uns des gestionnaires que je connais et à qui je pourrais faire confiance :

- [Bitwarden ](https://bitwarden.com/fr-fr/pricing/)Mon choix actuel
- [Dashlane](https://www.dashlane.com/fr/pricing-personal) À ma connaissance un très bon gestionnaire. Sûrement mon choix si je n'utilisais pas Bitwarden.
- [1Password](https://1password.com/fr/pricing)
- [NordPass](https://nordpass.com/fr/plans/) Gestionnaire de mot de passe du très (trop) connu NordVPN. Si vous avez déjà un abonnement VPN, ce choix peut être judicieux puisque le gestionnaire est je crois inclus dans l'abonnement.

En regardant les différentes offres vous remarquerez que les offres gratuites quand elles existent sont assez ridicules avec la possibilité de ne se connecter qu'avec un seul appareil ou avec une limitation forte sur le nombre de mot de passe. Je pense qu'il peut être judicieux d'investir quelques euros par mois pour sa sécurité mais, j'ai quand même mieux à vous proposer.

J'ai choisi [Bitwarden](https://bitwarden.com/fr-fr/pricing/). L'offre gratuite n'a pas de limitation sur le nombre d'appareils ou de mots de passe et l'offre payante qui rajoute quelques outils pratiques comme le comparateur de mots de passe est de loin la moins cher des offres premium avec 1€ par mois (ou 10€ par an.)

# Conclusion

Voilà ! On a fini ce "petit" tour de présentation des gestionnaires de mots de passe et de la sécurité lié à l'authentification. J'espère que je vous ai convaincu de son utilité (voir de sa nécessité) et que vous y réfléchirez à deux fois avant de mettre 123456 ou SylvieDu17 en mot de passe. 😋

Je me doute qu'utiliser pour la première fois un gestionnaire de mot de passe peut être intimidant et changer un peu nos habitudes n'est jamais très agréable. Mais je vous assure que cela vaut largement le coup de s'approprier cet outil. Cela permet une grande tranquillité d'esprit et une belle simplicité d'usage au quotidien. Je suis beaucoup plus serein lorsque je navigue sur internet 😊

Mais je ne vais pas vous laisser seul face à cette découverte ! Je vous propose de retrouver la semaine prochaine en suite de cet article, un tuto pour prendre en main Bitwarden. Je vous expliquerais l'installation, l'utilisation et quelques réglages intéressants :)

En attendant, prenez soin de vous, restez safe !

Et à la semaine prochaine ! ;)

Des bisous