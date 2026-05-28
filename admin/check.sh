datei="prufen.sh" 
 
if [ -f "$datei" ] 
then 
  echo "Die Datei existiert." 
else 
  echo "Die Datei existiert nicht." 
fi
