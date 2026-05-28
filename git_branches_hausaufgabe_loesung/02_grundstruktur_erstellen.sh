#!/bin/bash

# Aufgabe 3: Grundstruktur erstellen
# This script creates the first version of support_tool.sh.

# Create the script file.
touch support_tool.sh

# Make the script executable.
chmod +x support_tool.sh

# Write the basic content into support_tool.sh.
cat > support_tool.sh <<'EOF'
#!/bin/bash

echo "IT Support Tool"
echo "==============="
echo "Dieses Skript hilft bei einfachen Support-Aufgaben."
EOF

# Test the script.
./support_tool.sh

# Show changed files.
git status

# Add the script to Git.
git add support_tool.sh

# Create the first commit.
git commit -m "Grundversion des Support Tools erstellt"

# Push master to GitHub.
git push origin master
