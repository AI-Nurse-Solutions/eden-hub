#!/bin/bash

# Usage: ./spawn.sh <incubator_name> <port_prefix>
# Example: ./spawn.sh incubator-01 8001

NAME=$1
PORT_EXT=$2
PORT_INT=8000

if [ -z "$NAME" ] || [ -z "$PORT_EXT" ]; then
    echo "Usage: ./spawn.sh <name> <port>"
    exit 1
fi

# Get absolute path to the project root
ROOT_DIR=$(pwd)
INCUBATOR_DIR="$ROOT_DIR/eden_hub/incubator"
DEPLOY_DIR="$ROOT_DIR/eden_hub/deployments/$NAME"

mkdir -p "$DEPLOY_DIR"

# Create a customized docker-compose for this instance
cat <<EOF > "$DEPLOY_DIR/docker-compose.yml"
services:
  $NAME:
    build: 
      context: $INCUBATOR_DIR
    container_name: $NAME
    ports:
      - "$PORT_EXT:$PORT_INT"
    environment:
      - APP_NAME=$NAME
      - PORT=$PORT_INT
    restart: always
EOF

# Spin it up
cd "$DEPLOY_DIR"
docker compose up -d --build

echo "✅ Incubator '$NAME' spawned at http://localhost:$PORT_EXT"
