#!/bin/bash

# Ask for container ID
read -p "Enter your container ID: " container_id

# Ask for database name
read -p "Enter database name: " db_name

# Run psql inside the container and list tables
docker exec -it $container_id psql -U postgres -d $db_name -c "\dt"
