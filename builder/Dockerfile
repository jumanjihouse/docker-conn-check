FROM alpine:3.5

# Which version of conn-check to install.
# This should be an env var available to script/build.
# Normally we set this via circle.yml
ARG VERSION

RUN apk add --no-cache \
      ca-certificates \
      bzr \
      python \
      py-setuptools \
      py-virtualenv \
      postgresql-dev \
      findutils \
      alpine-sdk \
      libffi-dev \
      libressl-dev \
      python-dev \
      py-pip \
      yaml-dev \
      unzip \
    && adduser -D user

USER user
WORKDIR /home/user

COPY build.sh /
RUN /build.sh

VOLUME ["/home/user/conn-check/"]
