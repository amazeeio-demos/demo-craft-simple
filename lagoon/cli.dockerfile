FROM uselagoon/lagoon-cli:latest as LAGOONCLI
FROM uselagoon/php-8.2-cli:latest

COPY composer.* /app/
# COPY assets /app/assets

COPY --from=LAGOONCLI /lagoon /usr/local/bin/lagoon
RUN DOWNLOAD_PATH=$(curl -sL "https://api.github.com/repos/uselagoon/lagoon-sync/releases/latest" | grep "browser_download_url" | cut -d \" -f 4 | grep linux_386) && wget -O /usr/local/bin/lagoon-sync $DOWNLOAD_PATH && chmod +x /usr/local/bin/lagoon-sync

RUN COMPOSER_MEMORY_LIMIT=-1 composer install --no-dev
COPY . /app
# RUN mkdir -p -v -m775 /app/web/sites/default/files

# Craft Entrypoint for required variables
COPY /lagoon/craft-entry.sh /lagoon/entrypoints/99-craft-entrypoint

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
