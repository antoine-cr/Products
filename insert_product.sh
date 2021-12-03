#Création du job d'ingestion des données

i=1
sp="/-\|"
echo -n ' '

while read f1
do
   printf "\b${sp:i++%${#sp}:1}"
   f1=$( echo "$f1" | tr -d "\r")
   curl -s -X POST "localhost:9200/products/_doc" -H "Content-Type: application/json" -d "{ \"csv_line_product\": \"$f1\" }" > /tmp/output.html
done < amazon_co-ecommerce_sample.csv


