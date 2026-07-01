import pandas as pd
from db import engine

movies = pd.read_sql("SELECT * FROM movies", engine)
ratings = pd.read_sql("SELECT * FROM ratings", engine)
watch_history = pd.read_sql("SELECT * FROM watch_history", engine)

print(movies.head())
print(ratings.head())
print(watch_history.head())