#!/bin/bash

# Aufgabe 7: Branch 2 in master uebernehmen
# This script merges feature-menue into master.

# Switch back to master.
git checkout master

# Merge the menu branch into master.
git merge feature-menue

# Push the updated master branch to GitHub.
git push origin master
