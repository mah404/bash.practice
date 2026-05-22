# Docker Compose Healthcheck Hausaufgabe - Loesung

Dieser Ordner enthaelt eine beginner-freundliche Loesung fuer die Healthcheck-Hausaufgabe.

## Dateien

- `02_docker-compose_webserver.yml` - Aufgabe 2
- `03_docker-compose_webserver_healthcheck.yml` - Aufgabe 3
- `04_docker-compose_broken_healthcheck.yml` - Aufgabe 4
- `06_docker-compose_fixed_healthcheck.yml` - Aufgabe 6
- `07_docker-compose_postgres_healthcheck.yml` - Aufgabe 7
- `08_docker-compose_depends_on_healthy.yml` - Aufgabe 8
- `befehle_mit_aufgaben.sh` - Befehle mit Aufgabe-Nummern und English comments
- `antworten.md` - Antworten fuer Aufgabe 1 bis 10

## Direkt ausfuehrbare Aufgabe-Ordner

Docker Compose findet automatisch nur Dateien mit Namen wie `docker-compose.yml`.
Darum gibt es fuer die praktischen Aufgaben eigene Ordner:

- `aufgabe_2_webserver/docker-compose.yml`
- `aufgabe_3_healthcheck/docker-compose.yml`
- `aufgabe_4_broken_healthcheck/docker-compose.yml`
- `aufgabe_6_fixed_healthcheck/docker-compose.yml`
- `aufgabe_7_postgres/docker-compose.yml`
- `aufgabe_8_depends_on/docker-compose.yml`

Port usage:

- Aufgabe 2: `http://localhost:8080`
- Aufgabe 3: `http://localhost:8081`
- Aufgabe 4: `http://localhost:8082`
- Aufgabe 6: `http://localhost:8083`

Beispiel fuer Aufgabe 2:

```bash
cd aufgabe_2_webserver
docker compose up -d
docker compose ps
docker compose down
```

Wenn du wieder zurueck willst:

```bash
cd ..
```

## Wichtig

Die Docker-Befehle wurden nicht automatisch ausgefuehrt.
Starte sie nur, wenn Docker Desktop oder Docker Engine bereit ist.
