from fastapi import FastAPI, HTTPException
from fastapi.responses import FileResponse
import requests
from datetime import datetime
from elasticsearch import Elasticsearch
from fastapi_elasticsearch import ElasticsearchAPI

es = Elasticsearch([{'host':'localhost', 'port': 9200}])


#Declaration de l'API
api = FastAPI(
  title='API_Products'
)

es_api = ElasticsearchAPI(
    es_client=es,
    index_name='products'
)

# On teste si l'api fonctionne correctement
@api.get('/status')
def get_status():
    return 1
    abort(404)


doc = {
    'product_name': 'Harry Potter',
    'manufacturer': 'LEGO',
    'average_rating': '4.5'
}
#res = es.index(index="products", id=1, document=doc)
#print(res['result'])

#res = es.get(index="products", id=1)
#print(res['_source'])

#es.indices.refresh(index="products")

#res = es.search(index="products", query={"match_all": {}})
#print("Got %d Hits:" % res['hits']['total']['value'])
#for hit in res['hits']['hits']:
    #print("%(product_name)s %(manufacturer)s: %(average_rating)s" % hit["_source"])



 
