year:=$(shell date +"%Y")
date:=$(shell date +"%Y-%m-%d")
name?=default-title

SLUG:=$(shell printf "%s" "$(name)" | tr ' ' '-')

# La cible 'help' est placée en premier pour être exécutée par défaut
help:
	@echo "Usage: make [commande] [options]"
	@echo ""
	@echo "Commandes disponibles :"
	@echo "  make              			Affiche cette aide"
	@echo "  make version      			Affiche la version de Hugo"
	@echo "  make build        			Compile le site (production)"
	@echo "  make run          			Lance le serveur de développement"
	@echo "  make post name=\"titre\"  	Crée un nouvel article dans posts/"
	@echo "  make envrac       			Crée un nouvel article 'En Vrac' daté"
	@echo ""
	@echo "Exemple :"
	@echo "  make post name=\"mon super article\""

version:
	hugo version

v: version

build: pull
	hugo

run: pull
	hugo server

envrac: pull
	hugo new content "en-vracs/$(year)/$(date)-EnVrac.md"

post: pull
	hugo new content "posts/$(date)-$(SLUG).md"

pull:
	git pull