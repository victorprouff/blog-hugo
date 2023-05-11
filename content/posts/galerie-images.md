---
title: "Galerie Images"
date: 2021-09-16T22:02:31+02:00
tags: [ "hugo" ]
series: ["Hugo"]
draft: false
---

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

> Re-note : Visiblement l'ajout des balises Gallery contenant des figures cassent l'interprétation du markdown. C'est chiant.

A un endroit de la page il faut ajouter le shortcode suivant pour activer le mode gallerie :
```
{ {< load-photoswipe >} }
```

Soit on déclare le répertoire qui contient les images. Mais cette méthode ne marche curieusement qu'en local chez moi. De toute façon, elle ne permet pas d'être précise dans le nommage des images.

```
{ {< gallery dir="/images/galerie-images" hover-effect="grow" caption-position="none" thumb="-thumb" />} }
```

Soit on déclare dans la galerie les images une par une

```
{ {< gallery hover-effect="grow" caption-position="none" >} }
  { {< figure link="/images/galerie-images/img0.jpg" thumb="-small" caption="Mon image 1" >} }
  { {< figure link="/images/galerie-images/img1.jpg" thumb="-small" caption="Mon image 2" >} }
  { {< figure link="/images/galerie-images/img2.jpg" thumb="-small" caption="Mon image 3" >} }
  { {< figure link="/images/galerie-images/img3.jpg" thumb="-small" caption="Mon image 4" >} }
  { {< figure link="/images/galerie-images/img4.jpg" thumb="-small" caption="Mon image 5" >} }
  { {< figure link="/images/galerie-images/img5.jpg" thumb="-small" caption="Mon image 6" >} }
{ {< gallery />} }
```

Les images sont placées dans le répertoire :
```
/static/images/< nom-article >/
```
Pour chaque image il y en a en fait 2. Une taille réel (img0.jpg) et une image de taille réduite qui va constituer la miniature (img0-thumb.jpg).
La balise `thumb="-thumb"` permet de spécifier que l'image de miniature sera la seconde.

La balise `gallery` accepte plusieurs option pour choisir l'effet affecté aux images au survol de la souris ou le positionnement du texte de l'image.
La balise `figure` en plus de thumb permet également de spécifier un texte ou la taille de l'image.

Vous retrouverez plus d'infos dans les liens que j'ai indiqué en début d'article.

## Le style

Malheureusement la galerie n'apparaissait pas comme je le souhaitais. Les carrés d'images promis apparaissaient en rectangle avec de grosse marge.
J'ai modifié la feuille de style `hugo-easy-gallery.css`

```css
.gallery {
  /* ... */
  max-width: 80%;  /* Default value : max-width: 768px;*/
}

/* ... */
figure {
  /* ... */
  margin-left: 20px;  /* Default value : margin-left: 20px; */
  margin-right: 20px; /* Default value : margin-right: 20px; */
}
```


## Exemples 

### Galerie seule

```
{{< gallery dir="/images/galerie-images" hover-effect="grow" caption-position="none" thumb="-thumb" />}}
```
### Galerie avec figure
```
{{< gallery hover-effect="grow" caption-position="none" >}}
  {{< figure link="/images/galerie-images/img0.jpg" thumb="-thumb" caption="Mon image 1" >}}
  {{< figure link="/images/galerie-images/img1.jpg" thumb="-thumb" caption="Mon image 2" >}}
  {{< figure link="/images/galerie-images/img2.jpg" thumb="-thumb" caption="Mon image 3" >}}
  {{< figure link="/images/galerie-images/img3.jpg" thumb="-thumb" caption="Mon image 4" >}}
  {{< figure link="/images/galerie-images/img4.jpg" thumb="-thumb" caption="Mon image 5" >}}
  {{< figure link="/images/galerie-images/img5.jpg" thumb="-thumb" caption="Mon image 6" >}}
{{< gallery />}}

{{< load-photoswipe >}}
```
