ARG CLI_IMAGE
FROM ${CLI_IMAGE} as cli

FROM uselagoon/php-8.2-fpm:latest

# Craft Entrypoint for required variables
COPY /lagoon/craft-entry.sh /lagoon/entrypoints/99-craft-entrypoint

COPY --from=cli /app /app

# Default CRAFT environment variables 
# See also lagoon/craft-entry.sh
ENV WEBROOT=web
ENV CRAFT_DB_DRIVER=mysql
ENV CRAFT_DB_SERVER=maridab
ENV CRAFT_DB_PORT=3306
ENV CRAFT_DB_DATABASE=lagoon
ENV CRAFT_DB_USER=lagoon
ENV CRAFT_DB_PASSWORD=lagoon
ENV CRAFT_DB_SCHEMA=public
ENV CRAFT_DB_TABLE_PREFIX=
