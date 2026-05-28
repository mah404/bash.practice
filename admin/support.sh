#!/bin/bash 
 
rolle="support" 
 
if [ "$rolle" = "admin" ] || [ "$rolle" = "support" ] 
then 
  echo "Zugriff auf Support-Bereich erlaubt." 
else 
  echo "Kein Zugriff." 
fi 