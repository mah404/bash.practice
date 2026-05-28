#!/bin/bash

# Aufgabe 6: Branch 2 - Menue ergaenzen
# This script creates a branch and adds a simple menu.

# Create and switch to the menu branch.
git checkout -b feature-menue

# Write the script with greeting and menu.
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
EOF

# Test the script.
./support_tool.sh

# Add the changed script to Git.
git add support_tool.sh

# Commit the menu change.
git commit -m "Einfaches Menue hinzugefuegt"

# Push the menu branch to GitHub.
git push origin feature-menue
