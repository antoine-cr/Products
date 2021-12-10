#!/bin/bash
curl -X GET "localhost:9200/_cat/nodes?v=true&pretty"
# Validation de l'accès à l'index et de tous les documents
curl -X GET 'localhost:9200/products/_doc/_search' -H 'Content-Type: application/json' -d '
{
    "query":{
        "match_all":{}
    }
}' | jq

# Recherche catégorie + vendeur
curl -XGET "localhost:9200/products/_doc/_search" -H 'Content-Type: application/json' -d '{
     "query": {
      "bool" : {
       "must" : [
        {
         "match":{"amazon_category_and_sub_category":"Harry Potter"}
         },
         {
         "match":{"manufacturer":"LEGO"}
         }
        ]
       }
     }
   }' | jq

   curl -XGET "localhost:9200/products/_doc/_search" -H 'Content-Type: application/json' -d '{
    "query":{
        "range":{
            "average_rating":{
                "gt": 4.6,
                "lt": 5.0}
        }
    }
}' | jq


curl -XGET "localhost:9200/products/_doc/_search" -H 'Content-Type: application/json' -d '{
     "query": {
      "bool" : {
       "must" : [
       {
       "range":{
           "average_rating":{
               "gt": 4.6,
               "lt": 5.0}
       }
       },
       {
       "range":{
           "price":{
               "gte": 50}
       }
       }
        ]
       }
     }
   }' | jq
