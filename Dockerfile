# syntax=docker/dockerfile:1

FROM ghcr.io/linuxserver/baseimage-selkies:ubuntunoble

# set version label
ARG BUILD_DATE
ARG VERSION
ARG OPENSCAD_VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"

# title
ENV TITLE=OpenSCAD \
    SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt \
    NO_GAMEPAD=true

RUN \
  echo "**** add icon ****" && \
  curl -k -o \
    /usr/share/selkies/www/icon.png \
    https://raw.githubusercontent.com/openscad/openscad/master/icons/512x512/openscad.png && \
  echo "**** install packages ****" && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
  apt-get install --no-install-recommends -y \
    firefox \
    openscad && \
  localedef -i en_GB -f UTF-8 en_GB.UTF-8 && \
  printf "Linuxserver.io version: ${VERSION}\nBuild-date: ${BUILD_DATE}" > /build_version && \
  echo "**** cleanup ****" && \
  apt-get autoclean && \
  rm -rf \
    /config/.cache \
    /config/.launchpadlib \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/*

# add local files
COPY /root /

# ports and volumes
EXPOSE 3001
VOLUME /config
