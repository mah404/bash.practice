#!/bin/bash

# Aufgabe 1: Projektordner erstellen.
# Create the project folder.
mkdir docker-healthcheck-hausaufgabe

# Aufgabe 1: Projektordner erstellen.
# Go into the project folder.
cd docker-healthcheck-hausaufgabe

# Aufgabe 1: Projektordner erstellen.
# Create the Docker Compose file.
touch docker-compose.yml

# Aufgabe 2: Einfachen Webserver starten.
# Start the container in the background.
docker compose up -d

# Aufgabe 2: Einfachen Webserver starten.
# Show the current Compose status.
docker compose ps

# Aufgabe 3: Healthcheck hinzufuegen.
# Stop the old container.
docker compose down

# Aufgabe 3: Healthcheck hinzufuegen.
# Start the project again with the healthcheck.
docker compose up -d

# Aufgabe 3: Healthcheck hinzufuegen.
# Check the status several times.
docker compose ps

# Aufgabe 4: Healthcheck absichtlich kaputt machen.
# Restart after changing the healthcheck to the wrong port.
docker compose down
docker compose up -d
docker compose ps

# Aufgabe 5: Healthcheck Details untersuchen.
# Show all running containers.
docker ps

# Aufgabe 5: Healthcheck Details untersuchen.
# Show detailed information about one container.
# Replace CONTAINER_NAME with the real container name.
docker inspect CONTAINER_NAME

# Aufgabe 5: Healthcheck Details untersuchen.
# Show only the health information.
docker inspect --format='{{json .State.Health}}' CONTAINER_NAME

# Aufgabe 6: Fehler beheben.
# Restart after fixing the healthcheck.
docker compose down
docker compose up -d
docker compose ps

# Aufgabe 7: PostgreSQL Healthcheck.
# Restart with the PostgreSQL Compose file.
docker compose down
docker compose up -d
docker compose ps
