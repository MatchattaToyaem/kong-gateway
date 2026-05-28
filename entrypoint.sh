#!/bin/sh
set -e

# JWT_SECRET is stored base64-encoded in Key Vault.
# JwtTokenProvider calls Base64.getDecoder().decode() before signing, so Kong
# must verify with the same decoded bytes. Decode here before substitution.
JWT_SECRET=$(printf '%s' "$JWT_SECRET" | base64 -d)
export JWT_SECRET

envsubst '${JWT_SECRET} ${JWT_ISSUER_URI}' \
  < /etc/kong/kong.yaml.template \
  > /tmp/kong.yaml

exec /docker-entrypoint.sh "$@"
