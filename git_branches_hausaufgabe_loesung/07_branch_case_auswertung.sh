#!/bin/bash

# Aufgabe 8: Branch 3 - Auswahl mit case auswerten
# This script creates a branch and adds case logic for the menu.

# Create and switch to the case branch.
git checkout -b feature-case-auswertung

# Write the final script with greeting, menu, and case evaluation.
cat > support_tool.sh <<'EOF'
#!/bin/bash

echo "IT Support Tool"
echo "==============="
echo "Bitte geben Sie Ihren Namen ein:"
read name
echo "Hallo $name, willkommen im IT Support Tool."
echo "Dieses Skript hilft bei einfachen Support-Aufgaben."

echo ""
echo "Bitte wählen Sie eine Aufgabe:"
echo "1) Systeminformationen anzeigen"
echo "2) Speicherplatz prüfen"
echo "3) Programm beenden"

read auswahl

case $auswahl in
  1)
    echo "Systeminformationen:"
    uname -a
    ;;
  2)
    echo "Speicherplatz:"
    df -h
    ;;
  3)
    echo "Programm wird beendet."
    ;;
  *)
    echo "Ungültige Auswahl."
    ;;
esac
EOF

# Test the script manually with 1, 2, 3, and a wrong input like 9.
./support_tool.sh

# Add the changed script to Git.
git add support_tool.sh

# Commit the case evaluation.
git commit -m "Menueauswahl mit case ausgewertet"

# Push the case branch to GitHub.
git push origin feature-case-auswertung
