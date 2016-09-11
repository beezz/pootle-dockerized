#!/bin/sh

docker-compose run pootle pootle migrate && \
docker-compose run pootle pootle initdb && \
docker-compose run pootle pootle collectstatic --clear --noinput && \
docker-compose run pootle pootle assets build
