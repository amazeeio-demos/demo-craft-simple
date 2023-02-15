#!/bin/sh

# The environment variable
export CRAFT_ENVIRONMENT=${LAGOON_ENVIRONMENT:-local}

# Database connection settings
export CRAFT_DB_DRIVER=mysql
export CRAFT_DB_SERVER=${MARIADB_HOST:-mariadb}
export CRAFT_DB_PORT=${MARIADB_PORT:-3306}
export CRAFT_DB_DATABASE=${MARIADB_DATABASE:-lagoon}
export CRAFT_DB_USER=${MARIADB_USERNAME:-lagoon}
export CRAFT_DB_PASSWORD=${MARIADB_PASSWORD:-lagoon}
export CRAFT_DB_SCHEMA="public"
export CRAFT_DB_TABLE_PREFIX=""

# General settings (see config/general.php)
if [ "$LAGOON_ENVIRONMENT_TYP" == "production" ]; then
	export DEV_MODE=false
	export ALLOW_ADMIN_CHANGES=false
	export DISALLOW_ROBOTS=false
else
	export DEV_MODE=true
	export ALLOW_ADMIN_CHANGES=true
	export DISALLOW_ROBOTS=true
fi
