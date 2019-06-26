#!/bin/bash

# -------------------------------------------------------------------------------------
# Laravel workflow
# -------------------------------------------------------------------------------------

alias laravel-dir="cd ~/Sites/www/laravel/ && sls"
alias laracast-dir="cd ~/Sites/www/_dev/Laracast/ && sls"

# preset
devDir=~/Sites/www/laravel/
# mysqlUi="homestead"
# mysqlPw="secret"
vmId="31dbc07"

# artisan alias
alias tinker="php artisan tinker"
alias serv="php artisan serv &"
alias laravel-v="php artisan --version"


# Laravel Homestead
function homestead() {
	( cd ~/Homestead && vagrant $* )
}

#alias vm-id="echo $vmId"
alias vm-up="homestead up $vmId"
alias vm-down="homestead halt $vmId"
alias vm-info="homestead global-status"
alias vm-update="vagrant box update $vmId"
alias vm-ssh="homestead ssh"
alias vm-reload="vagrant reload --provision $vmId"
alias vm-new="subl ~/.homestead/Homestead.yaml & subl /etc/hosts &"

# -------------------------------------------------------------------------------------
# todo: http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO-9.html
# https://askubuntu.com/questions/1705/how-can-i-create-a-select-menu-in-a-shell-script


laravelNewProject()
{
	i=1
	cd "$devDir" || exit
	printf "\nPlease enter the Laravel project name: "
	read projectName

	# dev
	laravel new $projectName --dev

	# stable (LTS)
	# laravel new $projectName

	cd $projectName/

	# Remove Frontend preset
	php artisan preset none

	printf "\n# Step 0$i: Update Laravel.\n\n"
	laravel-v
	composer update
	laravel-v
	i++

	# printf "\n# Step 02 installing npm stuff.\n\n"
	# npm install

	printf "\n# Step 03 Create a Git repository and initialize the project.\n\n"

	git init
	git add .
	git commit -m "Install Laravel: $projectName"
	git log

	printf "\n# Step 04 create todo.txt.\n"
    printf "
	# ** .env file setup **
	APP_URL=http://$projectName.dev

	DB_CONNECTION=mysql
	DB_HOST=$projectName.dev
	DB_PORT=3306
	DB_DATABASE=$projectName
	DB_USERNAME=homestead
	DB_PASSWORD=secret

	# ** SQL copy and paste **
	CREATE DATABASE \`$projectName\` CHARACTER SET `utf8mb4` COLLATE `utf8mb4_unicode_ci`;
	" > todo.txt

	printf "\n# Step 05 launch dev tools.\n"
	subl .
	subl .env
	subl todo.txt
	subl routes/web.php
	subl ~/.homestead/Homestead.yaml
	subl /etc/hosts
}

alias laravel-new=laravelNewProject

# -------------------------------------------------------------------------------------
# https://github.com/mklement0/ttab

function laravelDevDir()
{
	cd "$devDir"
	printf "Select the required project\n"
# --
	select proDir in */;
	do
		test -n "$proDir" && break;
		echo ">>> Invalid Selection";
	done
# --
	cd "$proDir" && clear

	fullPath=$devDir$proDir

	git log && git status
	ttab -d"$fullPath" clear
	ttab -d"$fullPath" vagrant reload $vmId
	#ttab -d"$fullPath" npm run watch

	subl .
}

alias laravel-dev=laravelDevDir

# -------------------------------------------------------------------------------------