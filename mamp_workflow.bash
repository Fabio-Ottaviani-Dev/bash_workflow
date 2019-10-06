#!/bin/bash

# -------------------------------------------------------------------------------------
# MAMP server conf and maintain
# -------------------------------------------------------------------------------------

phpV="php7.3.7"
editor="atom"

# -------------------------------------------------------------------------------------
# ** Apache / php **
# -------------------------------------------------------------------------------------

# php shell
export PATH=/Applications/MAMP/bin/php/"$phpV"/bin:"$PATH"

# Edit httpd.conf
alias httpd-conf=$editor" /Applications/MAMP/conf/apache/httpd.conf"

# Edit httpd-vhosts.conf
alias vhosts-conf=$editor" /Applications/MAMP/conf/apache/extra/httpd-vhosts.conf"

# Edit php.ini
alias php-conf=$editor" /Applications/MAMP/bin/php/"$phpV"/conf/php.ini"

# php_error.log
alias php-err-log="less /Applications/MAMP/logs/php_error.log"

# apache_error.log
alias apache-err-log="less /Applications/MAMP/logs/apache_error.log"

# -------------------------------------------------------------------------------------
# ** MySql **
# -------------------------------------------------------------------------------------

# MAMP MySql
alias mysql="/Applications/MAMP/Library/bin/mysql"

alias mysqldump="/Applications/MAMP/Library/bin/mysqldump"

# MySql Error log
alias mysql-err-log="less /Applications/MAMP/logs/mysql_error_log.err"

# MySql sql log
alias sql-log="cat /dev/null > /Applications/MAMP/logs/mysql_sql.log && tail -f /Applications/MAMP/logs/mysql_sql.log"


function dbBackup()
{

# References:
	# https://unix.stackexchange.com/questions/293966/suppress-warning-messages-from-mysql-in-shell-script-but-allow-errors
	# https://stackoverflow.com/questions/1636977/bash-script-select-from-database-into-variable
	# mysql -u root -proot

# preset
	backupDir=~/Sites/www/
	export MYSQL_PWD=root

	sql="SELECT GROUP_CONCAT(schema_name SEPARATOR ' ') AS db_list FROM information_schema.schemata WHERE schema_name NOT IN ('information_schema', 'mysql', 'performance_schema', 'phpmyadmin', 'sys')"
	dbList=$(mysql -u root -se "$sql")
	printf "db backup in progress ... \\n"
	cd "$backupDir" || exit;
	mysqldump -hlocalhost -uroot --opt --databases "$dbList" > db_dump.sql
	printf "Done\\n"
	ls
}


# todo
# Restore all databases
# alias db-restore="cd $dbDir && /Applications/MAMP/Library/bin/mysql -u root -p < db_dump.sql"

# -------------------------------------------------------------------------------------
