#!/usr/bin/env bash

###################################################################
# Main
###################################################################

if [[ ! -f .env ]]; then
  export DB_PASSWORD=$(openssl rand -base64 24)  
  envsubst < .env.example > .env
fi

docker compose down
docker compose pull
docker compose build
docker compose up -d