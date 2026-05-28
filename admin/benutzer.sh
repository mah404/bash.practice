#!/bin/bash

echo "Bitte gib deinen Benutzernamen ein:"
read name

if [ "$name" = "admin" ]; then
  echo "Willkommen Admin."
else
  echo "Normaler Benutzer."
fi