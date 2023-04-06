# Craft CMS running locally using Pygym and deployed to amazee.io Lagoon

## Run locally 

### Prerequistes
We assume you have Pygmy running locally - see https://github.com/pygmystack/pygmy

### Build and run locally

- Ensure Pygmy is running (pygmy up)
- git clone git@github.com:amazeeio-demos/demo-craft-simple.git
- cp .env.local.example .env.local
- docker-compose build
- docker-compose run cli bash

_In the container running BASH_
- composer install

_To setup a new DB and Craft (run in the container)_
- ./craft install (if this is a new installation, not copying an existing DB or something)

_To copy the DB and files from the demo project in lagoon (run in the container)_
- lagoon-sync sync mariadb -e main
- lagoon-sync sync files -e main

_Exist the container_
- exit (to log out of the container)

Start up the containers locally
- docker-compose up

Jump back into the container running BASH
- docker-compose run cli bash

In the container running BASH again...
- ./craft install (if this is a new installation, not copying an existing DB or something)
- exit (to log out of the container)

Locally now
- browse to http://demo-craft-simple.docker.amazee.io

## Deploy to Lagoon
Demo project lives at https://dashboard.amazeeio.cloud/projects/demo-craft-simple

The production URL is: https://nginx.main.demo-craft-simple.us2.amazee.io/
