#!/bin/sh
set -e

# Render declarative config from template, substituting JWT_SECRET and JWT_ISSUER_URI
# from environment variables (injected from Azure Key Vault at container startup).
envsubst '${JWT_SECRET} ${JWT_ISSUER_URI}' \
  < /etc/kong/kong.yaml.template \
  > /tmp/kong.yaml

exec /docker-entrypoint.sh "$@"
