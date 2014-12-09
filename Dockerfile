FROM ubuntu:latest

RUN apt-get update; DEBIAN_FRONTEND=noninteractive apt-get install -qq \
  libffi-dev \
  libssl-dev \
  libyaml-dev \
  python-dev \
  python-pip \
  python-virtualenv \
  ; apt-get clean

RUN cd /opt; virtualenv conn-check; cd conn-check; bin/pip install conn-check | tee /tmp/install.log

ENTRYPOINT ["/opt/conn-check/bin/conn-check"]
