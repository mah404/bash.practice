#!/bin/bash

# Aufgabe 1: Projektordner erstellen.
# Create the project folder.
mkdir docker-replicas-uebung

# Aufgabe 1: Projektordner erstellen.
# Go into the project folder.
cd docker-replicas-uebung

# Aufgabe 1: Projektordner erstellen.
# Create the Compose file.
touch docker-compose.yml

# Aufgabe 2: Einfache Compose-Datei erstellen.
# Start the service in the background.
docker compose up -d

# Aufgabe 2: Einfache Compose-Datei erstellen.
# Show running Compose containers.
docker compose ps

# Aufgabe 3: Service mit drei Replicas starten.
# Stop and remove the running Compose containers.
docker compose down

# Aufgabe 3: Service mit drei Replicas starten.
# Start three replicas of the web service.
docker compose up -d --scale web=3

# Aufgabe 3: Service mit drei Replicas starten.
# Check the running replicas.
docker compose ps

# Aufgabe 4: Logs der Replicas anzeigen.
# Show logs from all containers.
docker compose logs

# Aufgabe 4: Logs der Replicas anzeigen.
# Show live logs from all containers.
docker compose logs -f

# Aufgabe 5: Replicas wieder reduzieren.
# Reduce the service to one replica.
docker compose up -d --scale web=1

# Aufgabe 5: Replicas wieder reduzieren.
# Check that only one container is running.
docker compose ps

# Aufgabe 6: Problem mit festen Ports verstehen.
# Stop everything before testing fixed ports.
docker compose down

# Aufgabe 6: Problem mit festen Ports verstehen.
# Start one container with fixed port 8080.
docker compose up -d

# Aufgabe 6: Problem mit festen Ports verstehen.
# Stop everything again.
docker compose down

# Aufgabe 6: Problem mit festen Ports verstehen.
# Try to start three replicas with fixed port 8080.
# This can fail because three containers cannot all use host port 8080.
docker compose up -d --scale web=3

# Aufgabe 7: Compose-Datei wieder vereinfachen.
# Stop everything before using the simple Compose file again.
docker compose down

# Aufgabe 7: Compose-Datei wieder vereinfachen.
# Start three replicas again without fixed port mapping.
docker compose up -d --scale web=3

# Aufgabe 7: Compose-Datei wieder vereinfachen.
# Check the running containers.
docker compose ps

# Aufgabe 8: Container einzeln anschauen.
# Show all Docker containers.
docker ps

# Aufgabe 8: Container einzeln anschauen.
# Open a shell inside one container.
# Replace CONTAINER_NAME with the real container name.
docker exec -it CONTAINER_NAME sh

# Aufgabe 8: Container einzeln anschauen.
# Show the hostname inside the container.
hostname

# Aufgabe 8: Container einzeln anschauen.
# Leave the container shell.
exit

# Aufgabe 10: Mini-Szenario aus der Praxis.
# Increase from 2 to 5 replicas.
docker compose up -d --scale web=5

# Aufgabe 10: Mini-Szenario aus der Praxis.
# Reduce from 5 to 2 replicas.
docker compose up -d --scale web=2

# Aufgabe 10: Mini-Szenario aus der Praxis.
# Check the current state.
docker compose ps

# Aufgabe 10: Mini-Szenario aus der Praxis.
# Stop everything.
docker compose down
