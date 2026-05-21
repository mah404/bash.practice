# Aufgabenblatt Replicas Docker Compose - Loesungen

## Aufgabe 1

Projektordner erstellen:

```bash
mkdir docker-replicas-uebung
cd docker-replicas-uebung
touch docker-compose.yml
```

## Aufgabe 2

Compose-Datei:

```yaml
services:
  web:
    image: nginx
```

Antworten:

1. Der gestartete Service heisst `web`.
2. Das Image ist `nginx`.
3. Am Anfang laeuft ein Container.
4. `localhost:8080` funktioniert noch nicht, weil kein Port in der Compose-Datei freigegeben wurde.

## Aufgabe 3

Befehle:

```bash
docker compose down
docker compose up -d --scale web=3
docker compose ps
```

Antworten:

1. Jetzt laufen drei Container.
2. Die Namen sehen ungefaehr so aus: `projekt-web-1`, `projekt-web-2`, `projekt-web-3`.
3. Die Container haben unterschiedliche Namen, weil Docker jede Replica eindeutig unterscheiden muss.
4. Ja, alle nutzen dasselbe Image `nginx`.
5. Es sind drei Kopien derselben Anwendung.

## Aufgabe 4

Befehle:

```bash
docker compose logs
docker compose logs -f
```

Antworten:

1. Logs sind wichtig, weil man darin Fehler und Aktivitaeten sehen kann.
2. Man kann zum Beispiel Starts, Anfragen, Fehler oder Warnungen erkennen.
3. Bei mehreren Replicas werden Logs unuebersichtlicher, weil Ausgaben von mehreren Containern zusammenkommen.

## Aufgabe 5

Befehl:

```bash
docker compose up -d --scale web=1
docker compose ps
```

Antworten:

1. Danach laeuft nur noch ein Container.
2. Die anderen Container wurden gestoppt und entfernt.
3. Es ist praktisch, weil man bei mehr Last mehr Container starten und spaeter wieder reduzieren kann.

## Aufgabe 6

Compose-Datei mit festem Port:

```yaml
services:
  web:
    image: nginx
    ports:
      - "8080:80"
```

Antworten:

1. Mit drei Replicas funktioniert es meistens nicht sauber.
2. Die Fehlermeldung sagt ungefaehr, dass der Port schon belegt ist.
3. Host-Port `8080` kann nicht von drei Containern gleichzeitig genutzt werden.
4. `8080:80` bedeutet: Port `8080` auf dem Computer geht zu Port `80` im Container.
5. Das ist bei Replicas problematisch, weil jede Replica denselben Host-Port verwenden will.

## Aufgabe 7

Port-Zuweisung wieder entfernen:

```yaml
services:
  web:
    image: nginx
```

Befehle:

```bash
docker compose down
docker compose up -d --scale web=3
docker compose ps
```

## Aufgabe 8

Befehle:

```bash
docker ps
docker exec -it CONTAINER_NAME sh
hostname
exit
```

Antworten:

1. Ja, die Container haben unterschiedliche Hostnamen.
2. Jeder Container ist eine eigene laufende Instanz.
3. `hostname` zeigt den internen Namen des Containers.
4. Jeder Container ist trotz gleichem Image eigenstaendig, weil jeder einen eigenen laufenden Prozess und eine eigene Container-ID hat.

## Aufgabe 9

Image: Eine Vorlage fuer Container, zum Beispiel `nginx`.

Container: Eine laufende Instanz von einem Image.

Service: Ein Eintrag in Docker Compose, der beschreibt, was gestartet werden soll.

Replica: Eine weitere Kopie desselben Services als eigener Container.

## Aufgabe 10

Von 2 auf 5 Replicas erhoehen:

```bash
docker compose up -d --scale web=5
```

Von 5 auf 2 Replicas reduzieren:

```bash
docker compose up -d --scale web=2
```

Aktuellen Zustand pruefen:

```bash
docker compose ps
```

Alles stoppen:

```bash
docker compose down
```

## Aufgabe 11

1. Mehrere Replicas koennen mehr Anfragen bearbeiten und machen die Anwendung stabiler.
2. Wenn nur ein Container laeuft und er abstuerzt, ist die Anwendung nicht mehr erreichbar.
3. Ein Load Balancer verteilt Anfragen auf mehrere Replicas.
4. Eine Datenbank sollte man nicht einfach mehrfach starten, weil Daten sonst unterschiedlich oder kaputt werden koennen.
5. Vertikale Skalierung bedeutet: ein Server bekommt mehr Leistung. Horizontale Skalierung bedeutet: mehrere Instanzen werden gestartet.

