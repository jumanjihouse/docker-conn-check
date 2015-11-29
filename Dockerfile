FROM alpine:3.2

# Which version of conn-check to install.
ENV VERSION 1.3.1

RUN apk upgrade --update --available && \
    apk add \
      ca-certificates \
      openssl \
      python \
    && apk add -t devtools \
      alpine-sdk \
      libffi-dev \
      openssl-dev \
      python-dev \
      py-pip \
      yaml-dev \
    && pip install -Iv conn-check==${VERSION} \
    && apk del --purge devtools \
    && rm -f /var/cache/apk/* \
    && adduser -D user

USER user
WORKDIR /home/user

ENTRYPOINT ["conn-check"]
