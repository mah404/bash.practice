#!/bin/bash

# Aufgabe 9: Branch 3 in master uebernehmen
# This script merges feature-case-auswertung into master.

# Switch back to master.
git checkout master

# Merge the case branch into master.
git merge feature-case-auswertung

# Push the updated master branch to GitHub.
git push origin master
