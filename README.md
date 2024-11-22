# Description

Code source de mon [blog](https://blog.victorprouff.fr/) perso.

# Voir version Hugo

```
hugo version
```

# Build le site

```
hugo
```

## Lancer serveur local

```
hugo server
```

## Ajouter un article 

```
 hugo new posts/nom-de-mon-article.md
```

## Mettre à jour le template

Aller dans le repos du fork du template.

Synchroniser le fork.

faire un git pull dans le thème en local
(themes/anatole)

## Ajouter un bloc de code

Il suffit d'ajouter :

```csharp {linenos=true}
public class MaClass
{
    public MaClass()
    {
        // Constructor
    }

    public void Function()
    {
        // Function
    }
}
```
L'option linenos permet de rajouter les lignes.

[Doc](https://gohugo.io/content-management/syntax-highlighting/#example-highlight-shortcode)

## Modifier le style du code

```
hugo gen chromastyles --style=monokai > syntax.css
```

Liste de tous les styles : [lien](https://xyproto.github.io/splash/docs/all.html#abap)

## Activer l'interprétation HTML dans les fichiers md

Activer l'option en ajoutant le paramètre dans le fichier `config.toml`
```toml
[markup.goldmark.renderer]
  unsafe = true # Allow HTML in md files
```

Permet d'utiliser des balises html dans les articles et pages .md.
Comme centrer une image :
```html
<img src="/img/espanso/espanso-example.gif" alt="Exemple" class="center">
```

et rajouter la class dans le fichier `custom.css`.

```css
.center {
    display: block;
    margin-left: auto;
    margin-right: auto;
}
```



## Sources :
- https://gohugo.io/getting-started/usage/
