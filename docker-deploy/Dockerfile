FROM debian:stable-slim

LABEL "name"="Docker Deploy Action"
LABEL "maintainer"="Luca Feger <luca@lucafeger.de>"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="GitHub Action for deploying Docker images"
LABEL "com.github.actions.description"="Recreates existing docker containers from builced image"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="blue"

COPY LICENSE README.md /

RUN apt-get update && apt-get install -y \
  openssh-client && \
  rm -Rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]