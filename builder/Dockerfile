FROM alpine:3.4

# Which version of conn-check to install.
# This should be an env var available to script/build.
# Normally we set this via circle.yml
ARG VERSION

RUN apk add --no-cache \
      ca-certificates \
      bzr \
      openssl \
      python \
      py-setuptools \
      py-virtualenv \
      postgresql-dev \
      findutils \
      alpine-sdk \
      libffi-dev \
      openssl-dev \
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
