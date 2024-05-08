#!/bin/bash

echo "Creating and setting permissions for the MySQL data directory..."
mkdir -p $HOME/ShinobiSQL
sudo chown -R 999:999 $HOME/ShinobiSQL
mkdir -p $HOME/Shinobi
sudo chown -R 999:999 $HOME/Shinobi

echo "Building the Docker image for Shinobi CCTV..."
docker compose build

echo "Running the Shinobi CCTV system..."
docker compose up -d

echo "Shinobi CCTV should now be accessible on port 8080."
