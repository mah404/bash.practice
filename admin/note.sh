#!/bin/bash 
 
note=2 
 
if [ $note -eq 1 ] 
then 
  echo "Sehr gut" 
elif [ $note -eq 2 ] 
then 
  echo "Gut" 
elif [ $note -eq 3 ] 
then 
  echo "Befriedigend" 
else 
  echo "Andere Note" 
fi 