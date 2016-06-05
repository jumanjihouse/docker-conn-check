FROM alpine:3.4

# Which version of conn-check to install.
# If you change this, you must also change circle.yml
ENV VERSION 1.3.1

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
