FROM alpine:3.8

# Which version of conn-check to install.
# Normally we set this via ci/build.
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
