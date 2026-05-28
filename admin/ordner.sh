#!/bin/bash 
 
ordner="$HOME/backup" 
 
if [ -d "$ordner" ] 
then 
  echo "Der Backup-Ordner existiert bereits." 
else 
  echo "Backup-Ordner wird erstellt." 
  mkdir "$ordner" 
fi 