---
title: "Transferts Pictures"
date: 2020-10-24T19:06:48+02:00
description: Petit projet de transfert de photo d'une carte SD à un répertoire spécifique avec trie par dates
tags: [ "python", "photo" ]
categories: [ "projet" ]
series: ["Hugo"]
draft: false
---

# Transfert de photos via Python


## Problématique

J'ai toujours essayé de développer des petits projets persos mais au final, ils n'aboutissaient que très rarement. J'ai lu un article de [Je suis un Dev](https://www.jesuisundev.com/projet-perso/) qui était fort intéressant. 
Je vous encourage à le lire et surtout à le suivre. Mais en gros il dit que pour faire un projet perso, découvrir une techno ou un concept, bref, pour coder après notre journée de taf, il fallait trouver un projet qui nous bottait vraiment. Trouver un truc en lien avec une passion. Qui sois utile, pratique, qui nous rende service. Un truc pas trop gros mais intéressant.

Je galère à trouver la plus part du temps. Mais, l'autre jour je me suis trouvé un petit projet tout con .. mais qui aurait une vrai utilité !

En tant que photographe (amateur) une opération que je fais à chaque fin de shoot c'est le déchargement de mes photos sur l'ordi puis sur mon NAS. La gestion et la sauvegarde des photos et primordiale et demande une certaine organisation si on ne veut pas perdre des photos ou se retrouvé noté dans un bordel sans nom avec des photos éparpillé partout...

## Détails de mon process de déchargement photos

Après un shoot quand je rentre chez moi, je procède comme suit : 
- Je branche la carte SD au PC
- Je copie les photos prises dans un répertoire par date de prise de vue
- Une fois que je me suis assuré du transfert, je supprime la carte (en général, j'attends plusieurs jours histoire d'avoir un backup)

L'étape "un peu" complexe et la plus chiante c'est la 2e étape. Il faut rassembler les photos par dates (il m'arrive de décharger mes photos qu'après 2-3 shoot quand je pars en weekend ou en vacances) et les mettre dans un répertorie nommé par la date au minimum (2020-10-14). Si je le sens, je peux rajouter un titre qui décris la session (2020-10-14 Chat).
C'est chiant parce que je dois attendre le transfert du groupe de photo, c'est répétitif...

## Solution

Et .. et si je pouvais pas automatiser tout ça ? De quoi ai je besoin ? 

- Un programme qui lise les fichiers
- Récupérer la date de prise de vue
- Les rassembler par date
- Déplacer des fichiers groupe par groupe et les placer dans un répertoire avec comme nom la date

Bref. Rien de bien foufou.

Etant développeur back, j'utilise au quotidien du C# .net... ça fait un peu sortir la grosse artillerie pour pas grand chose. Par contre, m'essayer au python me tente depuis un petit moment. Je n'avais jamais trop prit le temps de me lancer et je me dis que c'est l'occasion.

J'ai commencer par faire plusieurs tests pour comprendre le langage et tester individuellement les différentes briques de mon projet.

Voila le résultat. Soyez indulgent, je maitrise par encore le langage ^^ D'ailleurs, si vous avez des suggestions ou remarques constructives, je suis preneur :)

Fichier `DeletePictures.py` :
```python
import datetime
import os.path
import shutil
import sys
from os import scandir
from pathlib import Path
from modeles.File import File

# originRepository = "G:/DCIM/100CANON"
originRepository = "G:/DCIM/test"
destinationRepository = "C:/Users/victor/Desktop/photos"
# destinationRepository = "//NAS/Photos/2020"
lstFiles = []

def CopyFiles(files):
    currentDate = ""
    nbDirectoryCreated = 0

    for file in files:
        if file.date != currentDate:
            currentDate = file.date

        directoryPath = destinationRepository + "/" + currentDate.strftime("%Y-%m-%d")

        fileObj = Path(directoryPath)
        
        if fileObj.is_dir() == False:
            os.mkdir(directoryPath)
            print("Dossier créé : %s" %(directoryPath)) 
            nbDirectoryCreated += 1
            pass

        shutil.copy(file.path, directoryPath)

        pass
    return nbDirectoryCreated

def ListAndSortedFilesByPath(path):
    for entry in scandir(path):
        if entry.is_file() :
            lstFiles.append(File(entry.name, entry.path,datetime.date.fromtimestamp(os.path.getmtime(entry.path))))
            pass
    
    return sorted(lstFiles, key=lambda file: file.date, reverse=True)

filesSortedByDate = ListAndSortedFilesByPath(originRepository)

print("Le répertoire contient %s fichiers \n" %(len(filesSortedByDate)))
result = CopyFiles(filesSortedByDate)
input("\n%s dossiers ont été créé." %(result))
```

Fichier `File.py` :
```python
class File:
    filesCount = 0
    def __init__(self, name, path, date):
        self.name = name
        self.path = path
        self.date = date
        self.filesCount += 1
```

Actuellement, deux problèmes me chagrinent avec ce script :
- Il est en un bloc. J'aimerai bien déplacer mes deux fonctions dans un fichier séparé comme j'ai pu le faire avec File.
- J'aimerai bien mettre mes paths dans un fichier de configuration mais là pareil, c'est la merde. Jusqu'à présent pas moyen.

Faut que je creuse.