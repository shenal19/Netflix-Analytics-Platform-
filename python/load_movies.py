from pathlib import Path
import pandas as pd
from sqlalchemy import text
from db import engine
import re

BASE_DIR = Path(__file__).resolve().parent.parent

movies = pd.read_csv(BASE_DIR / "dataset" / "processed" / "movies_clean.csv")

print(f"Loaded {len(movies)} movies")

def get_year(title):
    match = re.search(r"\((\d{4})\)", title)
    if match:
        return int(match.group(1))
    return None

movies["release_year"] = movies["title"].apply(get_year)


print(movies[["title","release_year"]].head())

genre_set = set()

for g in movies["genres"]:
    for genre in g.split("|"):
        genre_set.add(genre)

genres = sorted(list(genre_set))

print(genres)

with engine.begin() as conn:

    conn.execute(text("DELETE FROM movie_genres"))
    conn.execute(text("DELETE FROM genres"))

    for genre in genres:

        conn.execute(
            text("""
                INSERT INTO genres(genre_name)
                VALUES (:genre)
            """),
            {"genre": genre}
        )

print("Genres inserted successfully.")

# Keep only required columns
movies_db = movies[["movieId", "title", "release_year"]].copy()

# Rename columns to match PostgreSQL
movies_db.rename(columns={
    "movieId": "movie_id"
}, inplace=True)

# Add missing columns
movies_db["duration_minutes"] = None
movies_db["imdb_rating"] = None

print(movies_db.head())

with engine.begin() as conn:

    conn.execute(text("TRUNCATE TABLE movie_genres RESTART IDENTITY CASCADE"))
    conn.execute(text("TRUNCATE TABLE movies RESTART IDENTITY CASCADE"))

movies_db.to_sql(
    "movies",
    engine,
    if_exists="append",
    index=False
)

print("Movies inserted successfully.")

