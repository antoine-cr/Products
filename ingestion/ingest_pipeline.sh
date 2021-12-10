#Création du pipeline d'ingestion
curl -X PUT localhost:9200/_ingest/pipeline/csv_product -H "Content-Type: application/json" -d '{
    "processors": [
    {
      "csv" : {
        "field" : "csv_line_product",
        "target_fields": ["uniq_id", "product_name", "amazon_category_and_sub_category", "manufacturer", "price", "number_available_in_stock", "number_of_reviews", "number_of_answered_questions", "average_rating"]
      }
    }
  ]
}'

#Création de l'index du document
curl -X PUT "localhost:9200/products" \
-H "Content-Type: application/json" \
-d '{
    "settings": {
        "index.default_pipeline": "csv_product"
    }
}'

