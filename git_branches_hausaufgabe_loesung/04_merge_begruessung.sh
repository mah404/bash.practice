#!/bin/bash

# Aufgabe 5: Branch 1 in master uebernehmen
# This script merges feature-begruessung into master.

# Switch back to master.
git checkout master

# Merge the greeting branch into master.
git merge feature-begruessung

# Push the updated master branch to GitHub.
git push origin master
