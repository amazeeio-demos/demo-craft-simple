ARG CLI_IMAGE
FROM ${CLI_IMAGE} as cli

FROM uselagoon/nginx:latest

ENV LAGOON=nginx
ENV WEBROOT=web

COPY --from=cli /app /app

COPY /lagoon/nginx-craft.conf /etc/nginx/conf.d/app.conf
COPY /lagoon/craft /etc/nginx/conf.d/craft/

RUN fix-permissions /etc/nginx

