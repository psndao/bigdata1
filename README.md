# MapReduce – most_frequent

Ce projet implémente un job MapReduce en Python avec Hadoop Streaming pour identifier **le mot le plus fréquent** dans un corpus texte.

## 📌 Objectif

- Compter les mots d'un fichier texte (Word Count)
- Trouver le mot le plus fréquent parmi ces mots

## 🛠 Technologies utilisées

- Hadoop HDFS
- Hadoop Streaming
- Python 3
- Cluster Big Data Adaltas

## 🗂 Structure du projet


## 🚀 Étapes de réalisation

### 1. Word Count (TP 1)

```bash
mapred streaming -D mapreduce.job.reduces=2 \
  -files word_count/mapper.py,word_count/reducer.py \
  -input /education/$GROUP/resources/lab3/mapred-input \
  -output /education/$GROUP/$USER/lab3/word-count \
  -mapper "python3 mapper.py" -reducer "python3 reducer.py"


mapred streaming -D stream.non.zero.exit.is.failure=false \
  -files most_frequent_mapper.py,most_frequent_reducer.py \
  -input /education/$GROUP/$USER/lab3/word-count \
  -output /education/$GROUP/$USER/lab3/most-frequent \
  -mapper "python3 most_frequent_mapper.py" -reducer "python3 most_frequent_reducer.py"



hdfs dfs -cat /education/$GROUP/$USER/lab3/most-frequent/part-*
# Résultat : the    13604
