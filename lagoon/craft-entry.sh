#!/bin/sh

# The environment variable
export CRAFT_ENVIRONMENT=$LAGOON_ENVIRONMENT

# Database connection settings
export CRAFT_DB_DRIVER=mysql
export CRAFT_DB_SCHEMA="public"
export CRAFT_DB_TABLE_PREFIX=""

if [ ! -z "$MARIADB_HOST" ]; then
	export CRAFT_DB_SERVER=$MARIADB_HOST
else
	export CRAFT_DB_SERVER=mariadb
fi
echo CRAFT_DB_SERVER: $CRAFT_DB_SERVER

if [ ! -z "$MARIADB_HOST" ]; then
	export CRAFT_DB_PORT=$MARIADB_PORT
else
	export CRAFT_DB_PORT=3306
fi
echo CRAFT_DB_PORT: $CRAFT_DB_PORT

if [ ! -z "$MARIADB_HOST" ]; then
	export CRAFT_DB_DATABASE=$MARIADB_DATABASE
else
	export CRAFT_DB_DATABASE=lagoon
fi
echo CRAFT_DB_DATABASE: $CRAFT_DB_DATABASE

if [ ! -z "$MARIADB_HOST" ]; then
	export CRAFT_DB_USER=$MARIADB_USERNAME
else
	export CRAFT_DB_USER=lagoon
fi
echo CRAFT_DB_USER: $CRAFT_DB_USER

if [ ! -z "$MARIADB_HOST" ]; then
	export CRAFT_DB_PASSWORD=$MARIADB_PASSWORD
else
	export CRAFT_DB_PASSWORD=lagoon
fi
echo CRAFT_DB_PASSWORD: $CRAFT_DB_PASSWORD

# General settings (see config/general.php)
if [ "$LAGOON_ENVIRONMENT_TYPE" == "production" ]; then
	export DEV_MODE=false
	export ALLOW_ADMIN_CHANGES=false
	export DISALLOW_ROBOTS=false
else
	export DEV_MODE=true
	export ALLOW_ADMIN_CHANGES=true
	export DISALLOW_ROBOTS=true
fi

echo DEV_MODE: $DEV_MODE
echo DISALLOW_ROBOTS: $DISALLOW_ROBOTS
echo ALLOW_ADMIN_CHANGES: $ALLOW_ADMIN_CHANGES

if [ ! -d "/app/storage/cpresources" ]; then
	echo Creating /app/storage/cpresources
	mkdir /app/storage/cpresources
	chmod -R 777 /app/storage
	chmod -R 777 /app/web/cpresources
else
	echo Found /app/storage/cpresources
	chmod 777 /app/storage
	chmod 777 /app/web/cpresources
fi
