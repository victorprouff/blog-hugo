---
title: "Problème d'insertion de nouvelle ligne dans une table NocoDb et sa résolution."
description: "Je me suis cassé les dents quelques jours avec un problème d'insertion impossible sur mon instance Nocodb. Vu que je n'ai pas trouvé la solution rapidement, je me dis que ça peut servir à d'autres, donc je partage."
summary: "Je me suis cassé les dents quelques jours avec un problème d'insertion impossible sur mon instance Nocodb. Vu que je n'ai pas trouvé la solution rapidement, je me dis que ça peut servir à d'autres, donc je partage."
date: 2025-10-31T09:45:32+01:00
categories: [ "Astuces", "Outils" ]
tags: [ "nocodb", "outils" ]
draft: false
---

# **Problème d'insertion de nouvelle ligne dans une table NocoDb et sa résolution.**

Je me suis cassé les dents quelques jours avec un problème d'insertion impossible sur mon instance Nocodb. Vu que je n'ai pas trouvé la solution rapidement, je me dis que ça peut servir à d'autres, donc je partage.

Alors que je voulais enregistrer une nouvelle ligne dans une table, je me suis retrouvé avec l'erreur suivante :

```
Failed to insert row: This record already exists.
```



Je ne sais pas trop ce qui a provoqué le problème, mais à partir de ce moment-là, impossible de faire une nouvelle insertion.

J'ai testé sur les autres tables et aucun problème. Je suis allé voir les logs.

NocoDb tourne sur un VPS et est déployé grâce à Dokploy. Je suis allé voir les logs de la db et je tombe là-dessus :

```sh
2025-10-30 16:09:16.330 UTC [82486] ERROR:  duplicate key value violates unique constraint "Comptes_pkey"
2025-10-30 16:09:16.330 UTC [82486] DETAIL:  Key (id)=(56) already exists.
2025-10-30 16:09:16.330 UTC [82486] STATEMENT:  insert into "pavgrgcz688d83c"."Comptes" ("Mail_en__chec", "Premier_mail_envoy_s", "created_at", "created_by", "nc_order", "updated_at", "updated_by") values ('false', 'false', '2025-10-30 16:09:16+00:00', 'usknfdzefveb98761rx', '136', NULL, NULL) returning "id" as "cvk34maxo5cee1a"
```



Après quelques recherches (et quelques questions posées à Mistral, je l'avoue, il m'a bien aidé), je me suis rendu compte que NocoDB utilise un auto-incrément pour générer les id. La séquence était désynchronisée. Elle utilise un id déjà présent dans la table.

J'ai essayé de créer une nouvelle ligne en passant par n8n branché dessus. Ça a parfaitement fonctionné en indiquant la valeur de l'Id dans les paramètres.



## Solution

Pour résoudre le problème, il faut se connecter au serveur sur lequel tourne la base de données (pour moi PostgreSQL) et exécuter une commande pour réinitialiser l'index.

On se connecte au serveur :

```bash
ssh utilisateur@adresse_ip_du_serveur
```

On accéde à PostgreSQL :

```bash
psql -U nom_utilisateur_postgres -d nom_base_de_données
```



Puis on exécute la commande pour réinitialiser l'index à partir de l'id le plus grand + 1 :

```bash
SELECT setval(pg_get_serial_sequence('"pavgrgcz688d83c"."Comptes"', 'id'), COALESCE(MAX("id"), 0) + 1, false) FROM "pavgrgcz688d83c"."Comptes";
```



On quitte PostgreSQL :

```bash
\q
```



Et on redémarre le serveur en cas de cache pour appliquer les changements :

```bash
sudo systemctl restart nocodb # (ou manuellement si vous utilisez dokploy)
```



Et voila, cela devrait résoudre le problème 😊