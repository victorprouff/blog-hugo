[![CI](https://github.com/victorprouff/blog-hugo/actions/workflows/deploy.yml/badge.svg)](https://github.com/victorprouff/blog-hugo/actions/workflows/deploy.yml)

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

```csharp
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

## Améliorer le rendu des quotations

J'aime bien comment rende les citations sur github ou Obsidian mais malheureusement, ce n'est pas standard en markdown.
J'ai donc rajouté un peu de css pour avoir un rendu plus sympa 😊

Quand je veux faire une citation (ou plutôt mettre en avant du texte) au lieu de faire comme je faisais avant je fais :

```markdown
> [!info] Ceci est un titre
> Unam incolunt Belgae, aliam Aquitani, tertiam.
> 
> Paullum deliquit, ponderibus modulisque suis ratio utitur. Curabitur est gravida et libero vitae dictum.
```

Je fais :

```markdown
<blockquote class="quote-danger">
<h3>Ceci est un titre</h3>
Unam incolunt Belgae, aliam Aquitani, tertiam.

Paullum deliquit, ponderibus modulisque suis ratio utitur. Curabitur est gravida et libero vitae dictum.
</blockquote>

<blockquote class="quote-warning">
<h3>Ceci est un titre</h3>
Unam incolunt Belgae, aliam Aquitani, tertiam.

Paullum deliquit, ponderibus modulisque suis ratio utitur. Curabitur est gravida et libero vitae dictum.
</blockquote>

<blockquote class="quote-tip">
<h3>Ceci est un titre</h3>
Unam incolunt Belgae, aliam Aquitani, tertiam.

Paullum deliquit, ponderibus modulisque suis ratio utitur. Curabitur est gravida et libero vitae dictum.
</blockquote>

<blockquote class="quote-info">
<h3>Ceci est un titre</h3>
Unam incolunt Belgae, aliam Aquitani, tertiam.

Paullum deliquit, ponderibus modulisque suis ratio utitur. Curabitur est gravida et libero vitae dictum.
</blockquote>
```

Et je rajoute le scss suivant dans `/assets/sass/main.scss` :

```css
.quote-info {
    border-left: 4px solid #3498db;
    border-radius: 5px;
    background-color: #3498db47;
    padding-left: 1em;
    color: black;

    h1, h2, h3, h4 {
        color: #0969da
    }
    
    h1::before, h2::before, h3::before, h4::before {
        content: "🖋️ ";
    }
}

.quote-tip {
    border-left: 4px solid #477e02;
    border-radius: 5px;
    background-color: #477e0247;
    padding-left: 1em;
    color: black;

    h1, h2, h3, h4 {
        color: #477e02
    }
    
    h1::before, h2::before, h3::before, h4::before {
        content: "✅ ";
    }
}

.quote-warning {
    border-left: 4px solid #e9973f;
    border-radius: 5px;
    background-color: #e9973f47;
    padding-left: 1em;
    color: black;

    h1, h2, h3, h4 {
        color: #e9973f
    }
    
    h1::before, h2::before, h3::before, h4::before {
        content: "⚠️ ";
    }
}

.quote-danger {
    border-left: 4px solid #ed4448;
    border-radius: 5px;
    background-color: #ed444847;
    padding-left: 1em;
    color: black;

    h1, h2, h3, h4 {
        color: #ed4448
    }
    
    h1::before, h2::before, h3::before, h4::before {
        content: "❌ ";
    }
}
```

Il y a peut-être moyen de faire plus simple mais je suis une quiche en CSS donc bon, ça fonctionne. Si vous avez mieux, dites-moi ! :)

Et voila le résultat :


![Examples quotation](./doc/quotation-examples.webp)


## Sources :

- https://gohugo.io/getting-started/usage/

