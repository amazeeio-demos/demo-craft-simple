# Craft CMS running locally using Pygym and deployed to amazee.io Lagoon

## Run locally 

### Prerequistes
We assume you have Pygmy running locally - see https://github.com/pygmystack/pygmy

### Build and run locally
- Ensure Pygmy is running (pygmy up)
- git clone git@github.com:amazeeio-demos/demo-craft-simple.git
- docker-compose build
- docker-compose run cli bash

In the container running BASH
- composer install
- exit (to log out of the container)

Locally again
- docker-compose up
- browse to http://demo-craft-simple.docker.amazee.io

## Deploy to Lagoon
-- TODO 
