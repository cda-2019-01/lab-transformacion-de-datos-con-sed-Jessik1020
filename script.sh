# Escriba su código aquí
#!/bin/bash

#Cambiar separador de la fecha 
sed 's|/|-|g' data.csv > out1.csv

#Organizar fecha en formato YYYY-MM-DD
 awk  '{print gensub(/([0-9][0-9])-([0-9][0-9])-([0-9][0-9])/, "20\\3-\\2-\\1", 1)}' out1.csv > out2.csv

 #Organizar campos nulos
 awk '{sub(/;N/, ";\\N"); print}' out2.csv > out3.csv
 awk '{gsub(/;;/,   ";\\N;"); print}' out3.csv > out4.csv
 awk '{gsub(/;\s/,   ";\\N"); print}' out4.csv > out5.csv

#Cambiar minusculas por mayusculas 
 awk '{print toupper($0)}' out5.csv > out6.csv

#Cambiar separador ; por ,
awk '{gsub(/;/, ","); print}' out6.csv > out7.csv

#Cambiar separador decimal por .
awk  '{print gensub(/,/, ".", 4)}' out7.csv > out8.csv

#Mostrar registros que no tienen campos nulos 
sed '\:\N:d' out8.csv > out9.csv 

#Mostrar lab final
cat out9.csv

#Borrar archivos
rm out*
