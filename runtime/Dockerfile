FROM alpine:3.7

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

LABEL \
    org.label-schema.name="jumanjiman/conn-check" \
    org.label-schema.description="Test various network connections and output in Nagios check standard output" \
    org.label-schema.url="https://github.com/jumanjihouse/docker-conn-check" \
    org.label-schema.vcs-url="https://github.com/jumanjihouse/docker-conn-check.git" \
    org.label-schema.docker.dockerfile="/runtime/Dockerfile" \
    org.label-schema.vcs-type="Git" \
    org.label-schema.license="GPLv3" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.vcs-ref=${VCS_REF} \
    org.label-schema.version=${VERSION}

ADD wheels.tgz /usr/lib/python2.7/site-packages/

COPY sample.yaml /etc/conn-check/
COPY conn-check /usr/bin/

RUN apk upgrade --no-cache --available && \
    apk add --no-cache \
      ca-certificates \
      python \
    && adduser -D user

USER user
WORKDIR /home/user

ENTRYPOINT ["conn-check"]
