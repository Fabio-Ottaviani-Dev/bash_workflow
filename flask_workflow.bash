#!/bin/bash

# ------------------------------------------------------------------------------
# flask workflow
# ------------------------------------------------------------------------------
# Docs / Links:
# 1. https://www.gitignore.io/
# 2. https://www.computerhope.com/issues/ch000773.htm
# ------------------------------------------------------------------------------
# todo: db, bootstrap

flaskNewProject()
{
	# change it with your basic path
	cd ~/Sites/FSWD/ || exit
	printf "\n# Please enter the Flask project name: "
	read projectName
	mkdir $projectName && cd $projectName/

	printf "\n# Create and activate a virtual environment, update pip, install flask stuff.\n\n"

	python3 -m venv venv
	virtualenv -p python3 venv

	source venv/bin/activate
	pip3 install --upgrade pip
	pip3 install flask
	pip3 install python-dotenv
	pip3 install flask-sqlalchemy
	pip3 install psycopg2
	pip3 install Flask-Migrate

	mkdir app
	mkdir app/templates
	mkdir app/templates/partials

	touch "$projectName.py"
	echo "from app import app" > "$projectName.py"

	touch ".flaskenv"
	echo "FLASK_APP=$projectName.py
FLASK_ENV=development
FLASK_DEBUG=true" > ".flaskenv"

	curl https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore -o .gitignore

	cd app

# routes.py

	touch "routes.py"
	echo "from app import app

@app.route('/')
@app.route('/index')
def index():
	return \"Hello, World!\n From: $projectName\"" > "routes.py"

# __init__.py

	touch "__init__.py"
	echo "from flask import Flask

app = Flask(__name__)

from app import routes" > "__init__.py"

	cd ..
	printf "\n# Create a Git repository and initialize the project.\n\n"

	git init
	git add .
	git commit -m "Install flask, project: $projectName Start."
	git log

	# todo ttab -d "~/Sites/FSWD/$projectName" && clear

	printf "\n# run flask App.\n\n"
	#flask run
}

alias flask-np=flaskNewProject

# tmp wip app
# alias app="cd ~/Sites/FSWD/<app>/ && source venv/bin/activate"
#source venv/bin/activate && flask run
# -------------------------------------------------------------------------------------
