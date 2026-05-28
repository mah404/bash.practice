#!/bin/bash

# Aufgabe 10, 11 und 12: README ergaenzen
# This script writes the project description and theory answers into README.md.

# Write the README content.
cat > README.md <<'EOF'
# Git Shell Hausaufgabe

Dieses Repository enthält ein kleines Bash-Skript für einfache IT-Support-Aufgaben.

## Geübte Git-Themen

- git add
- git commit
- git push
- git branch
- git checkout
- git merge
- git rebase

## Theoriefragen: Merge-Konflikt

### Was ist ein Merge-Konflikt?

Ein Merge-Konflikt entsteht, wenn Git Änderungen nicht automatisch zusammenführen kann.
Das passiert oft, wenn zwei Branches dieselbe Stelle in derselben Datei verändert haben.

### Warum entsteht ein Merge-Konflikt meistens dann, wenn zwei Branches dieselbe Stelle verändern?

Git weiß dann nicht, welche Änderung richtig ist.
Darum muss ein Mensch entscheiden, welche Version behalten wird.

### Warum gab es in dieser Aufgabe keinen Merge-Konflikt?

Die Branches wurden nacheinander erstellt und gemergt.
Dadurch baut jede neue Änderung auf dem aktuellen Stand von master auf.

### Was zeigt Git in einer Datei bei einem Merge-Konflikt?

Git zeigt Markierungen wie <<<<<<<, ======= und >>>>>>>.
Zwischen diesen Markierungen stehen die verschiedenen Versionen.

### Wie löst man einen Merge-Konflikt sauber?

Man öffnet die betroffene Datei, entscheidet sich für die richtige Version und entfernt die Konfliktmarkierungen.
Danach testet man das Programm, macht git add und erstellt einen Commit.

### Warum sollte man nach einem Merge-Konflikt noch einmal testen?

Nach dem manuellen Bearbeiten kann leicht ein Fehler entstehen.
Durch Testen prüft man, ob das Skript wieder korrekt funktioniert.

## Theoriefragen: Merge und Rebase

### Was macht git merge?

git merge übernimmt Änderungen aus einem Branch in einen anderen Branch.
Die Historie zeigt dabei, dass ein Branch zusammengeführt wurde.

### Was macht git rebase?

git rebase setzt die eigenen Commits auf einen neuen Ausgangspunkt.
Dadurch sieht die Historie oft geradliniger aus.

### Was ist der wichtigste Unterschied zwischen merge und rebase?

merge führt Branches zusammen und erhält die Verzweigung sichtbar.
rebase schreibt die Reihenfolge der Commits um.

### Warum bleibt bei merge sichtbar, wann ein Branch zusammengeführt wurde?

Bei merge kann ein Merge-Commit entstehen.
Dieser Commit zeigt, wann die Zusammenführung passiert ist.

### Warum kann rebase die Git-Historie sauberer aussehen lassen?

Bei rebase wirkt es so, als wären die Änderungen nacheinander entstanden.
Dadurch gibt es weniger sichtbare Verzweigungen.

### Warum sollte man mit rebase vorsichtig sein, wenn ein Branch bereits geteilt wurde?

rebase verändert die Commit-Historie.
Wenn andere Personen denselben Branch benutzen, kann das Probleme verursachen.

### Wann würde man eher merge verwenden?

merge ist gut, wenn man Branches sicher zusammenführen und die Historie behalten möchte.
Das ist besonders sinnvoll bei Teamarbeit.

### Wann könnte rebase sinnvoll sein?

rebase ist sinnvoll, wenn man lokale eigene Commits vor dem Push sauber auf den neuesten Stand bringen möchte.
EOF

# Add README.md to Git.
git add README.md

# Commit the README changes.
git commit -m "README zur Hausaufgabe ergaenzt"

# Push master to GitHub.
git push origin master
