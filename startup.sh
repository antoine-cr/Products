#!/bin/bash
#docker pull docker.elastic.co/elasticsearch/elasticsearch:7.15.2
#Création du fichier de données nettoyées
python3 data.py

#Création du pipeline d'ingestion de données
./ingest_pipeline.sh

#Ingestion des données sur l'index de recherche "products"
./insert_product.sh
