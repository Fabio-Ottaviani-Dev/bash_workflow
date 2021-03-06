#!/bin/bash

# ------------------------------------------------------------------------------
# flask workflow
# ------------------------------------------------------------------------------
# Docs / Links:
# 1. https://www.gitignore.io/
# 2. https://www.computerhope.com/issues/ch000773.htm
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# flask new website
# ------------------------------------------------------------------------------
# todo: db, bootstrap

flaskNewSite()
{
	# change it with your basic path
	# cd ~/Sites/ || exit
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
	pip3 install flask-debugtoolbar # https://flask-debugtoolbar.readthedocs.io/en/latest/

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
	#flask run --reload
}

alias flask-nws=flaskNewSite


# ------------------------------------------------------------------------------
# flask new Api
# ------------------------------------------------------------------------------

flaskNewApi()
{
	# flask-boilerplate

	# change it with your basic path
	# cd ~/Sites/ || exit
	cd ~/Sites/Full-Stack-Web-Developer-Nanodegree/FSWD/projects/  || exit
	printf "\n# Please enter the Flask project name: "
	read projectName
	mkdir $projectName && cd $projectName/

	printf "\n# Create and activate a python3 virtual environment.\n\n"

	python3 -m pip install --user --upgrade pip
	python3 -m pip install --user virtualenv
	python3 -m venv env
	source env/bin/activate

	printf "\n# python3 virtual environment ready, update pip, install flask stuff.\n\n"

	pip install --upgrade pip
	pip3 install flask
	pip3 install -U flask-cors
# db
	pip3 install flask-sqlalchemy
	#pip3 install psycopg2
	pip3 install Flask-Migrate
	pip3 install Flask-Script

# gitignore and README.md files

	curl https://raw.githubusercontent.com/github/gitignore/master/Python.gitignore -o .gitignore
	touch "README.md" && echo "# $projectName" > "README.md"

	mkdir -p backend/src/{auth,database,utilities}

# db
# sqlite3
# database.db;
# .quit

	cd backend/src/

# __init__.py
	touch "__init__.py"


# api.py
	touch "api.py"
	echo "from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
@app.route('/index')
def hello_dude():
	return jsonify({'message':'Hello, Dude!'})" > "api.py"

	cd ..
	cd ..
	printf "\n# Create a Git repository and initialize the project.\n\n"

	git init
	git add .
	git commit -m "Install flask Api, project: $projectName Start."
	git log

	printf "\n# Open Editor.\n\n"
	atom .

	printf "\n# Run flask Api.\n\n"
	cd backend/src
	export FLASK_APP=api.py && export FLASK_ENV=development && flask run --reload

}

alias flask-napi=flaskNewApi

# -------------------------------------------------------------------------------------
# Create a Virutal Enviornment
# -------------------------------------------------------------------------------------
# Docs / Links:
# 1. https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/

make_python_virtualenv()
{
	echo "Do you wish to install a python3 virtual environments in the current folder ?"
	select yn in "Yes" "No"; do
		case $yn in
			Yes)
				python3 -m pip install --user --upgrade pip
				python3 -m pip install --user virtualenv
				python3 -m venv env
				source env/bin/activate
				pip install --upgrade pip
				echo 'python3 virtual environment ready'
				break;;
			No)
				echo 'OK see ya! \(@_@)/'
				break;;
				#exit;;
		esac
	done
}

alias flask-venv=make_python_virtualenv
