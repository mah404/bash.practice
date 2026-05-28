# Hausaufgabe Healthchecks mit Docker Compose - Antworten

## Aufgabe 1: Projektordner erstellen

### Loesung

```bash
mkdir docker-healthcheck-hausaufgabe
cd docker-healthcheck-hausaufgabe
touch docker-compose.yml
```

Diese Aufgabe hat im Arbeitsblatt keine extra Fragen.

## Aufgabe 2: Einfachen Webserver starten

### Loesung

```yaml
services:
  web:
    image: nginx
    ports:
      - "8080:80"
```

```bash
docker compose up -d
docker compose ps
```

### Fragen und Antworten

1. Wie heisst der Service in der Compose-Datei?

   Der Service heisst `web`.

2. Welches Image wird verwendet?

   Das Image ist `nginx`.

3. Was bedeutet die Port-Zuweisung `"8080:80"`?

   Port `8080` auf dem Computer wird mit Port `80` im Container verbunden.

4. Was zeigt `docker compose ps` aktuell als Status an?

   Es zeigt, dass der Container laeuft.

5. Kannst du die Webseite im Browser ueber `http://localhost:8080` oeffnen?

   Ja, die Webseite sollte ueber `http://localhost:8080` erreichbar sein.

## Aufgabe 3: Healthcheck hinzufuegen

### Loesung

```yaml
services:
  web:
    image: nginx
    ports:
      - "8080:80"
    healthcheck:
      test: ["CMD-SHELL", "wget --spider -q http://localhost || exit 1"]
      interval: 10s
      timeout: 5s
      retries: 3
      start_period: 10s
```

```bash
docker compose down
docker compose up -d
docker compose ps
```

Hinweis: In der geloesten Datei fuer Aufgabe 3 wird lokal `8081:80` benutzt, damit Aufgabe 2 auf `8080` bleiben kann.

### Fragen und Antworten

1. Was bedeutet `starting`?

   Docker prueft den Healthcheck noch oder der Container startet noch.

2. Was bedeutet `healthy`?

   Der Healthcheck ist erfolgreich und die Anwendung ist erreichbar.

3. Welcher Befehl wird im Healthcheck ausgefuehrt?

   `wget --spider -q http://localhost || exit 1`

4. Warum wird hier `localhost` verwendet?

   Der Healthcheck laeuft im Container selbst. Darum zeigt `localhost` auf den Container.

5. Was macht `start_period`?

   `start_period` gibt dem Container Zeit zum Starten, bevor Fehler gezaehlt werden.

## Aufgabe 4: Healthcheck absichtlich kaputt machen

### Loesung

```yaml
healthcheck:
  test: ["CMD-SHELL", "wget --spider -q http://localhost:9999 || exit 1"]
  interval: 10s
  timeout: 5s
  retries: 3
  start_period: 10s
```

```bash
docker compose down
docker compose up -d
docker compose ps
```

Hinweis: In der geloesten Datei fuer Aufgabe 4 wird lokal `8082:80` benutzt, damit es keinen Port-Konflikt gibt.

### Fragen und Antworten

1. Welcher Status wird nach einiger Zeit angezeigt?

   Nach einiger Zeit wird wahrscheinlich `unhealthy` angezeigt.

2. Warum wird der Container als `unhealthy` angezeigt?

   Der Healthcheck prueft den falschen Port `9999`.

3. Laeuft der Container trotzdem noch?

   Ja, der Container kann trotzdem noch laufen.

4. Was zeigt diese Aufgabe ueber den Unterschied zwischen `running` und `healthy`?

   `running` bedeutet nur, dass der Containerprozess laeuft. `healthy` bedeutet, dass die Anwendung wirklich funktioniert.

## Aufgabe 5: Healthcheck Details untersuchen

### Loesung

```bash
docker ps
docker inspect CONTAINER_NAME
docker inspect --format='{{json .State.Health}}' CONTAINER_NAME
```

### Fragen und Antworten

1. Welche Informationen findest du im Bereich `Health`?

   Man findet Status, Fehlversuche, Startzeit und Ausgaben der Healthchecks.

2. Welche Fehlermeldung oder Ausgabe findest du zum fehlgeschlagenen Healthcheck?

   Man sieht, dass der Healthcheck-Befehl nicht erfolgreich war.

3. Warum ist `docker inspect` bei der Fehlersuche hilfreich?

   `docker inspect` zeigt genaue technische Details zum Container.

## Aufgabe 6: Fehler beheben

### Loesung

```yaml
healthcheck:
  test: ["CMD-SHELL", "wget --spider -q http://localhost || exit 1"]
  interval: 10s
  timeout: 5s
  retries: 3
  start_period: 10s
```

```bash
docker compose down
docker compose up -d
docker compose ps
```

Hinweis: In der geloesten Datei fuer Aufgabe 6 wird lokal `8083:80` benutzt, damit es keinen Port-Konflikt gibt.

### Fragen und Antworten

1. Ist der Container jetzt wieder `healthy`?

   Ja, nach der Korrektur sollte der Container wieder `healthy` werden.

2. Was hast du korrigiert?

   Die falsche URL mit Port `9999` wurde entfernt.

3. Warum war die Korrektur notwendig?

   nginx ist intern auf Port `80` erreichbar, nicht auf Port `9999`.

## Aufgabe 7: Healthcheck bei einer Datenbank verstehen

### Loesung

```yaml
services:
  db:
    image: postgres:16
    environment:
      POSTGRES_USER: appuser
      POSTGRES_PASSWORD: geheim
      POSTGRES_DB: appdb
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U appuser -d appdb"]
      interval: 10s
      timeout: 5s
      retries: 5
      start_period: 10s
```

### Fragen und Antworten

1. Warum nutzt man bei PostgreSQL nicht `wget` oder `curl`?

   PostgreSQL ist keine Webseite. Darum prueft man es nicht mit HTTP.

2. Was prueft `pg_isready`?

   `pg_isready` prueft, ob PostgreSQL bereit fuer Verbindungen ist.

3. Warum ist ein Datenbank-Healthcheck besonders wichtig?

   Eine App soll oft erst starten, wenn die Datenbank wirklich bereit ist.

4. Warum kann eine Datenbank `running` sein, aber noch nicht bereit fuer Verbindungen?

   Die Datenbank kann noch starten oder interne Initialisierung ausfuehren.

## Aufgabe 8: depends_on mit service_healthy erklaeren

### Loesung

```yaml
services:
  app:
    image: nginx
    depends_on:
      db:
        condition: service_healthy

  db:
    image: postgres:16
    environment:
      POSTGRES_USER: appuser
      POSTGRES_PASSWORD: geheim
      POSTGRES_DB: appdb
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U appuser -d appdb"]
      interval: 10s
      timeout: 5s
      retries: 5
```

### Fragen und Antworten

1. Was bedeutet `depends_on` normalerweise?

   Ein Service haengt von einem anderen Service ab.

2. Was bedeutet `condition: service_healthy`?

  Function 

3. Warum ist das besser als nur `depends_on` ohne Healthcheck?

   Es wird nicht nur der Start , sondern die echte Bereitschaft.

4. In welchem Praxisfall waere das besonders hilfreich?

   Wenn eine App erst starten soll, nachdem die Datenbank bereit ist.

## Aufgabe 9: Begriffe erklaeren

### Loesung und Antworten

- `running`: Der Container-Prozess laeuft.
- `healthy`: Der Container laeuft und der Healthcheck ist erfolgreich.
- `unhealthy`: Der Container laeuft vielleicht, aber der Healthcheck schlaegt fehl.
- `starting`: Docker wartet noch auf das Ergebnis vom Healthcheck.
- `interval`: Abstand zwischen den Healthcheck-Pruefungen.
- `timeout`: Maximale Zeit, die ein einzelner Healthcheck dauern darf.
- `retries`: Anzahl der Fehlversuche, bevor der Container unhealthy wird.
- `start_period`: Startzeit, in der Fehler noch nicht direkt schlimm sind.

## Aufgabe 10: Kurze Reflexion

### Loesung

In professionellen Umgebungen reicht es nicht aus, nur zu pruefen, ob ein Container laeuft.
Ein Container kann laufen, obwohl die Anwendung im Container nicht richtig funktioniert.
Zum Beispiel kann ein Webserver-Prozess gestartet sein, aber keine Anfragen beantworten.
Eine Datenbank kann ebenfalls laufen, aber noch nicht bereit fuer Verbindungen sein.
Healthchecks pruefen deshalb den echten Zustand der Anwendung.
Sie helfen dabei, Fehler frueher zu erkennen.
Sie sind auch wichtig, wenn andere Services auf diesen Container warten.
Mit `condition: service_healthy` kann ein Service warten, bis ein anderer wirklich bereit ist.
Dadurch werden Startprobleme und Folgefehler reduziert.
