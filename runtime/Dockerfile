FROM alpine:3.4

ADD wheels.tgz /usr/lib/python2.7/site-packages/

COPY sample.yaml /etc/conn-check/
COPY conn-check /usr/bin/

RUN apk upgrade --no-cache --available && \
    apk add --no-cache \
      ca-certificates \
      openssl \
      python \
    && adduser -D user

USER user
WORKDIR /home/user

ENTRYPOINT ["conn-check"]
