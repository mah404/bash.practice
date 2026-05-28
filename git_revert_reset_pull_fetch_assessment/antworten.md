# Hausaufgabe: Git Revert, Reset, Pull und Fetch

## Teil A: Fragen zu `git revert`

### 1. Was macht der Befehl `git revert` grundsaetzlich?

`git revert` macht die Aenderung eines alten Commits rueckgaengig.
Dabei wird aber nicht die Historie geloescht.
Git erstellt stattdessen einen neuen Commit, der die alte Aenderung umkehrt.

### 2. Warum erstellt `git revert` einen neuen Commit, anstatt die Historie einfach zu loeschen?

`git revert` erstellt einen neuen Commit, damit die Git-Historie nachvollziehbar bleibt.
Alle sehen weiterhin, was passiert ist und wann es rueckgaengig gemacht wurde.
Das ist besonders wichtig, wenn der alte Commit schon gepusht wurde.

### 3. In welcher Situation ist `git revert` meistens sicherer als `git reset`?

`git revert` ist sicherer, wenn der fehlerhafte Commit schon auf GitHub gepusht wurde.
Dann haben andere Personen diesen Commit vielleicht schon gesehen oder heruntergeladen.
Mit `revert` wird nichts aus der gemeinsamen Historie entfernt.

Beispiel:

```bash
git revert <commit-id>
```

## Teil B: Fragen zu `git reset`

### 4. Was bedeutet es, wenn man mit `git reset` auf einen frueheren Commit zurueckgeht?

Der Branch wird auf einen frueheren Stand gesetzt.
Commits nach diesem Punkt werden aus der aktuellen Branch-Historie entfernt oder ausgeblendet.
Je nach Reset-Art bleiben die Aenderungen noch im Arbeitsbereich oder werden geloescht.

### 5. Was ist der Unterschied zwischen `git reset --soft` und `git reset --hard`?

`git reset --soft` setzt nur den Commit-Zeiger zurueck.
Die Aenderungen bleiben erhalten und sind noch staged.

`git reset --hard` setzt den Commit-Zeiger zurueck und loescht auch die Aenderungen im Arbeitsbereich.
Das ist viel gefaehrlicher.

### 6. Warum kann `git reset --hard` gefaehrlich sein?

`git reset --hard` kann lokale Aenderungen komplett loeschen.
Wenn diese Aenderungen noch nicht gesichert oder gepusht wurden, kann man sie leicht verlieren.
Darum sollte man vorher immer genau pruefen, was man macht.

### 7. Warum sollte man `git reset` bei bereits gepushten Commits nur sehr vorsichtig benutzen?

Wenn Commits schon gepusht wurden, koennen andere Personen darauf arbeiten.
Ein Reset veraendert die Historie und kann dadurch Probleme fuer andere verursachen.
In gemeinsamen Branches ist deshalb meistens `git revert` besser.

Beispiele:

```bash
git reset --soft <commit-id>
git reset --hard <commit-id>
```

## Teil C: Unterschied zwischen `revert` und `reset`

### 8. Erklaere den wichtigsten Unterschied zwischen `git revert` und `git reset`.

`git revert` erstellt einen neuen Commit, der eine alte Aenderung rueckgaengig macht.
Die Historie bleibt dabei erhalten.

`git reset` setzt den Branch auf einen frueheren Stand zurueck.
Dabei kann Historie entfernt oder umgeschrieben werden.

### 9. Ein fehlerhafter Commit wurde bereits zu GitHub gepusht. Was wuerdest du verwenden?

Ich wuerde `git revert` verwenden.
Der Grund ist, dass der Commit schon auf GitHub liegt und vielleicht von anderen Personen genutzt wird.
Mit `revert` bleibt die gemeinsame Historie sauber und nachvollziehbar.

## Teil D: Fragen zu `git pull`

### 10. Was macht `git pull`?

`git pull` holt neue Aenderungen vom Remote-Repository und integriert sie direkt in den aktuellen lokalen Branch.
Es ist im Grunde `git fetch` plus anschliessendes Zusammenfuehren.

### 11. Warum sollte man vor der Arbeit an einem Projekt haeufig `git pull` ausfuehren?

Man sollte `git pull` ausfuehren, damit der lokale Stand aktuell ist.
So arbeitet man mit den neuesten Aenderungen von GitHub.
Das verringert die Gefahr von Konflikten.

### 12. Was kann passieren, wenn man lange nicht pullt?

Wenn man lange nicht pullt, kann der eigene Stand stark veraltet sein.
Andere Personen haben vielleicht viele Aenderungen gepusht.
Beim spaeteren Zusammenfuehren koennen dann mehr Konflikte entstehen.

Beispiel:

```bash
git pull origin master
```

## Teil E: Fragen zu `git fetch`

### 13. Was macht `git fetch`?

`git fetch` holt neue Informationen vom Remote-Repository.
Es aktualisiert zum Beispiel, welche Commits auf GitHub neu sind.
Der eigene Arbeitsstand wird dabei nicht direkt geaendert.

### 14. Warum veraendert `git fetch` den aktuellen Arbeitsstand nicht direkt?

`git fetch` soll erst einmal nur Informationen abholen.
So kann man anschauen, was neu ist, bevor man die Aenderungen uebernimmt.
Das ist vorsichtiger als direkt `git pull`.

Beispiel:

```bash
git fetch origin
```

## Teil F: Unterschied zwischen `pull` und `fetch`

### 15. Erklaere den Unterschied zwischen `git pull` und `git fetch`.

`git fetch` holt neue Informationen vom Remote, veraendert aber den aktuellen Arbeitsstand nicht direkt.
`git pull` holt die Aenderungen und integriert sie sofort in den aktuellen Branch.

Kurz gesagt:

- `fetch` = nur abholen und anschauen
- `pull` = abholen und direkt uebernehmen

### 16. Du willst erst sehen, ob es neue Aenderungen gibt, ohne deinen Arbeitsstand zu veraendern. Welchen Befehl verwendest du?

Ich verwende `git fetch`.
Damit kann ich neue Commits von GitHub holen, ohne meinen aktuellen Branch direkt zu veraendern.
Danach kann ich entscheiden, ob und wann ich die Aenderungen uebernehmen moechte.

## Abschlussfrage

### 17. Szenario: Erst pruefen, was neu ist, dann entscheiden.

Zuerst wuerde ich `git fetch origin` ausfuehren.
Damit hole ich die neuen Informationen von GitHub, ohne meinen Arbeitsstand direkt zu veraendern.

Danach wuerde ich mir die Unterschiede anschauen, zum Beispiel mit:

```bash
git log HEAD..origin/master
```

oder:

```bash
git diff HEAD origin/master
```

Wenn ich die Aenderungen uebernehmen moechte, kann ich danach `git pull origin master` ausfuehren.
So entscheide ich bewusst, wann die neuen Aenderungen in meinen lokalen Branch integriert werden.

