#!/bin/bash 
 
if systemctl is-active --quiet ssh 
then 
  echo "SSH läuft." 
else 
  echo "SSH läuft nicht." 
fi 
