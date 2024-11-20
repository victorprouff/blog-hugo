---
title: "Tools"
date: 2024-11-20T19:14:32+01:00
draft: true
---

Au fur est à mesure des années que je passe à bricoler et utiliser l'informatique, je commence à avoir quelques outils qui me sont bien pratique. J'aurais bien aimé les découvrir plus tôt pour certains donc je les partage pour qu'un autre moi puisse les trouver s'il en a besoin.


## Espanso

https://espanso.org/docs/get-started/

[Installation](https://espanso.org/install/)

Vérifier que Espanso est lancé :
```sh
➜  ~ espanso status
espanso is running
```

Récupérer le path de la config :
```bash
➜  ~ espanso path
Config: /Users/victorprouff/Library/Application Support/espanso
Packages: /Users/victorprouff/Library/Application Support/espanso/match/packages
Runtime: /Users/victorprouff/Library/Caches/espanso
```

Pour modifier la configuration il faut éditer :
```
➜  ~ code /Users/victorprouff/Library/Application\ Support/espanso
```

Arborescence :
```
$CONFIG/
  config/
    default.yml
  match/
    base.yml
```

```yml {linenos=table}
matches:
  # Simple text replacement
  - trigger: ":espanso"
    replace: "Hi there!"

  # NOTE: espanso uses YAML to define matches, so pay attention to the indentation!

  # But matches can also be dynamic:

  # Print the current date
  - trigger: ":date"
    replace: "{{mydate}}"
    vars:
      - name: mydate
        type: date
        params:
          format: "%Y-%m-%d"

  - trigger: ":now"
    replace: "{{mytime}}"
    vars:
      - name: mytime
        type: date
        params:
          format: "%Hh%M"

  - trigger: "!poc"
    replace: "Prouff Of Concept"

  # Print the output of a shell command
  - trigger: ":shell"
    replace: "{{output}}"
    vars:
      - name: output
        type: shell
        params:
          cmd: "echo 'Hello from your shell'"
```

Tous les fichiers .yml du dossier match qui respecte la structure seront interprété.

Dans le dossier, on peut spécifier des snippets spécifique pour une application précise.