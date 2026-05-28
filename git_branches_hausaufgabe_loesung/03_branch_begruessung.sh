#!/bin/bash

# Aufgabe 4: Branch 1 - Begruessung erweitern
# This script creates a branch and adds a name greeting.

# Create and switch to the new branch.
git checkout -b feature-begruessung

# Write the updated script with greeting.
cat > support_tool.sh <<'EOF'
#!/bin/bash

echo "IT Support Tool"
echo "==============="
echo "Bitte geben Sie Ihren Namen ein:"
read name
echo "Hallo $name, willkommen im IT Support Tool."
echo "Dieses Skript hilft bei einfachen Support-Aufgaben."
EOF

# Test the script.
./support_tool.sh

# Add the changed file to Git.
git add support_tool.sh

# Commit the greeting change.
git commit -m "Begruessung mit Namen hinzugefuegt"

# Push the branch to GitHub.
git push origin feature-begruessung
