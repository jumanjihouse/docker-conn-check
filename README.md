## Overview

Docker-based application container to provide
[conn-check](http://conn-check.org/) via
[PIP](https://pypi.python.org/pypi/conn-check).

[![Image Size](https://img.shields.io/imagelayers/image-size/jumanjiman/conn-check/latest.svg)](https://imagelayers.io/?images=jumanjiman/conn-check:latest)&nbsp;
[![Docker Registry](https://img.shields.io/docker/pulls/jumanjiman/conn-check.svg)](https://registry.hub.docker.com/u/jumanjiman/conn-check)&nbsp;

Project URL: [https://github.com/jumanjihouse/docker-conn-check](https://github.com/jumanjihouse/docker-conn-check)
<br />
Docker hub: [https://registry.hub.docker.com/u/jumanjiman/conn-check/](https://registry.hub.docker.com/u/jumanjiman/conn-check/)


### The Problem

http://1stvamp.org/verifying-post-deploy-connections-with-conn-check

Deployments of a service have a number of different network
dependencies that require verification:

* Connections between services (e.g. app <-> postgresql, are
  ports unblocked at the firewall(s)? If talking to a data centre
  instance do we have a route?)

* External services (e.g. webservices such as S3)

* Verification that the services on the other end are real
  (you're actually talking to MongoDB or rabbitmq via AMQP, not
  just another TCP service running on those ports)

* Verification of authentication

Although many of these can be solved with smoke tests, it's not
always immediately obvious that there is a problem, or what the
problem is.

conn-check takes a [simple YAML config](http://bazaar.launchpad.net/~ubuntuone-hackers/conn-check/trunk/view/head:/demo.yaml)
defining a list of checks to perform (udp, tcp, tls,
http, amqp, postgres, mongodb, redis, memcache), and
performs those checks asynchronously using Twisted's thread
pool, and outputs the results in a [Nagios check standard
output](https://nagios-plugins.org/doc/guidelines.html#AEN33), so
conn-check can be run regulary as a Nagios check to continually
verify network status between services (and alert on change,
e.g. out of band firewall changes).


### Usage

Run the docker container as if it were an application:

    docker run --rm -it jumanjiman/conn-check -h

Details about the options and its YAML config are at
http://bazaar.launchpad.net/~ubuntuone-hackers/conn-check/trunk/view/head:/README.rst


### License

GNU GPLv3
