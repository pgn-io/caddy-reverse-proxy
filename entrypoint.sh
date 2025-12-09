#!/bin/sh

set -euo pipefail

# for backwards compatibility, separates host and port from url
export FRONTEND_DOMAIN=${FRONTEND_DOMAIN:-${FRONTEND_HOST%:*}}
export FRONTEND_PORT=${FRONTEND_PORT:-${FRONTEND_HOST##*:}}

export IDENTITY_SERVICE_DOMAIN=${IDENTITY_SERVICE_DOMAIN:-${IDENTITY_SERVICE_HOST%:*}}
export IDENTITY_SERVICE_PORT=${IDENTITY_SERVICE_PORT:-${IDENTITY_SERVICE_HOST##*:}}

export DATA_BRIDGE_DOMAIN=${DATA_BRIDGE_DOMAIN:-${DATA_BRIDGE_HOST%:*}}
export DATA_BRIDGE_PORT=${DATA_BRIDGE_PORT:-${DATA_BRIDGE_HOST##*:}}

# strip https:// or https:// from domain if necessary
FRONTEND_DOMAIN=${FRONTEND_DOMAIN##*://}
IDENTITY_SERVICE_DOMAIN=${IDENTITY_SERVICE_DOMAIN##*://}
DATA_BRIDGE_DOMAIN=${DATA_BRIDGE_DOMAIN##*://}

echo using frontend: ${FRONTEND_DOMAIN} with port: ${FRONTEND_PORT}
echo using identity-service: ${IDENTITY_SERVICE_DOMAIN} with port: ${IDENTITY_SERVICE_PORT}
echo using data-bridge: ${DATA_BRIDGE_DOMAIN} with port: ${DATA_BRIDGE_PORT}

exec caddy run --config Caddyfile --adapter caddyfile 2>&1