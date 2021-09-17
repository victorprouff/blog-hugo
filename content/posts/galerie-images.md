---
title: "Galerie Images"
date: 2021-09-16T22:02:31+02:00
tags: [ "hugo" ]
series: ["Hugo"]
draft: false
---
{{< load-photoswipe >}}



# Galeries d'images avec Hugo
Un problème que j'avais avec Hugo c'était la gestion des images. Pour un blog classique aucun problème. C'est suffisant. Mais pour un site photo ou une galerie en ligne bof ..
Mais en fait, j'avais juste mal lu la doc 😅 Bon faut dire que la doc sur le sujet est bon .. bref, y a pas grand chose. Mais disons que j'avais mal cherché.
Je suis tombé sur plusieurs choses assez intéressantes :
- https://github.com/liwenyip/hugo-easy-gallery
- https://www.liwen.id.au/heg/#gallery-usage
- https://www.xianmin.org/hugo-theme-jane/

C'est encore perfectible mais ça commence à donner quelque chose de plutôt chouette et en creusant un peu ça pourrait me convenir tout à fait 😊 Je vais compléter cet article au fur et à mesure de mes recherches.

## Exemples

> Note : J'ai été obligé de rajouter un espace entre les accolades des exemples suivant autrement ils auraient été interprété.

A un endroit de la page il faut ajouter le shortcode suivant pour activer le mode gallerie :
```
{ {< load-photoswipe >} }
```

Soit on déclare le répertoire qui contient les images

```
{ {< gallery dir="images/galerie-images" thumb="-thumb" />} }
```
{{< gallery dir="images/galerie-images" thumb="-thumb" />}}

Soit on déclare dans la galerie les images une par une
```
{ {< gallery >} }
  { {< figure link="/images/galerie-images/img0.jpg" thumb="-thumb" >} }
  { {< figure link="/images/galerie-images/img1.jpg" thumb="-thumb" >} }
  { {< figure link="/images/galerie-images/img2.jpg" thumb="-thumb" >} }
  { {< figure link="/images/galerie-images/img3.jpg" thumb="-thumb" >} }
  { {< figure link="/images/galerie-images/img4.jpg" thumb="-thumb" >} }
  { {< figure link="/images/galerie-images/img5.jpg" thumb="-thumb" >} }
{ {< gallery />} }
```

{{< gallery >}}
  {{< figure link="/images/galerie-images/img0.jpg" thumb="-thumb" >}}
  {{< figure link="/images/galerie-images/img1.jpg" thumb="-thumb" >}}
  {{< figure link="/images/galerie-images/img2.jpg" thumb="-thumb" >}}
  {{< figure link="/images/galerie-images/img3.jpg" thumb="-thumb" >}}
  {{< figure link="/images/galerie-images/img4.jpg" thumb="-thumb" >}}
  {{< figure link="/images/galerie-images/img5.jpg" thumb="-thumb" >}}
{{< gallery />}}




