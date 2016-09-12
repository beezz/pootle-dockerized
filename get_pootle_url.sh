#!/bin/sh

NETWORK=$(docker network ls | awk '$2~/pootle/{print $2}')
NAME=$(docker ps --filter name=pootle_nginx --format {{.Names}})
IPADDRESS=$(docker inspect --format "{{ .NetworkSettings.Networks.${NETWORK}.IPAddress }}" ${NAME})

echo "Your Pootle isntance is running at http://${IPADDRESS}"
