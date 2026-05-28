#!/bin/sh
set -e

cp /etc/kong/kong.yaml.template /tmp/kong.yaml

exec /docker-entrypoint.sh "$@"
