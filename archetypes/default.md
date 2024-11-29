---
title: "{{ replace .Name "-" " " | title }}"
description: ""
summary: ""
date: {{ .Date }}
categories: [ {{ range $key, $value := .Site.Taxonomies.categories }}"{{ $key | humanize }}", {{ end }} ]
tags: [{{range $name, $taxonomy := .Site.Taxonomies.tags}}"{{$name}}", {{end}}]
draft: false
---

## Tags

| Tags            | Count |
|:---------------:| :----:| {{range $name, $taxonomy := .Site.Taxonomies.tags}}{{ $cnt := .Count }}
| {{$name}} | {{$cnt}} | {{end}}

## Categories

| Categories      | Count |
|:---------------:| :----:| {{ range $key, $value := .Site.Taxonomies.categories }}
| {{ $key | humanize }} | {{ len $value }} | {{ end }}
