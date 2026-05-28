#!/bin/bash 
 
alter=25 
rolle="admin" 
 
if [ $alter -ge 18 ] && [ "$rolle" = "admin" ] 
then 
  echo "Zugriff erlaubt." 
else 
  echo "Zugriff verweigert." 
fi 