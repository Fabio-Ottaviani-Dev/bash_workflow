#!/bin/bash

# ------------------------------------------------------------------------------
# flask workflow
# ------------------------------------------------------------------------------
# Docs / Links:
# 1. https://www.gitignore.io/
# ------------------------------------------------------------------------------
# todo: db, bootstrap


flaskNewProject()
{
	cd ~/Sites/flask/ || exit
	printf "\n# Please enter the Flask project name: "
	read projectName
	mkdir $projectName && cd $projectName/

	printf "\n# Create and activate a virtual environment, update pip, install flask.\n\n"

	python3 -m venv venv
	virtualenv -p python3 venv
	source venv/bin/activate
	pip3 install --upgrade pip3 && pip3 install flask
	pip3 install python-dotenv

	mkdir app
	mkdir app/templates
	mkdir app/templates/partials

	printf "\n# Create a Git repository and initialize the project.\n\n"

	curl https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore -o .gitignore
	git init
	git add .
	git commit -m "Install flask, project: $projectName Start."
	git log
}

alias flask-np=flaskNewProject

# -------------------------------------------------------------------------------------
