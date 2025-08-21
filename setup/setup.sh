#!/bin/bash
set -e

CONTAINER_NAME="my_postgres"

if [ "$(docker ps -q -f name=$CONTAINER_NAME)" ]; then
  echo "✅ Postgres container '$CONTAINER_NAME' already running."
else
  if [ "$(docker ps -aq -f name=$CONTAINER_NAME)" ]; then
    echo "⚠️ Container '$CONTAINER_NAME' exists but is stopped. Starting it..."
    docker start $CONTAINER_NAME
  else
    echo "🚀 Starting fresh Postgres container..."
    docker run -d --name $CONTAINER_NAME -p 5432:5432 -e POSTGRES_PASSWORD=postgres postgres
    sleep 5
  fi
fi

echo "📦 Ensuring databases exist..."
docker exec -it $CONTAINER_NAME psql -U postgres -tc "SELECT 1 FROM pg_database WHERE datname = 'ts_app';" | grep -q 1 || \
  docker exec -it $CONTAINER_NAME psql -U postgres -c "CREATE DATABASE ts_app;"

docker exec -it $CONTAINER_NAME psql -U postgres -tc "SELECT 1 FROM pg_database WHERE datname = 'rust_app';" | grep -q 1 || \
  docker exec -it $CONTAINER_NAME psql -U postgres -c "CREATE DATABASE rust_app;"

echo "✅ Databases ready: ts_app, rust_app"
