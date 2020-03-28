#!/usr/bin/env sh

set -e

HOST=${HOST:-localhost}
PORT=${PORT:-8080}

RESPONSE=$(curl "http://$HOST:$PORT/actuator/health" --fail --show-error --silent | jq -r '.status' || exit 1)

if [ "$RESPONSE" == "UP" ]; then
    exit 0
else
    echo "Unexpected response from service: $RESPONSE"
    exit 1
fi