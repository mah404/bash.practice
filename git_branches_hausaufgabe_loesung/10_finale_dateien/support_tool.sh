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
