import pandas as pd
from db import engine

# Load tables from PostgreSQL
movies = pd.read_sql("SELECT * FROM movies", engine)
ratings = pd.read_sql("SELECT * FROM ratings", engine)

print(f"Movies Loaded : {len(movies)}")
print(f"Ratings Loaded: {len(ratings)}")

# Group ratings by movie
top_movies = (
    ratings.groupby("movie_id")["rating"]
    .agg(
        rating_count="count",
        average_rating="mean"
    )
    .reset_index()
)

# Show top movies BEFORE filtering
print("\nTop 10 Movies by Rating Count:")
print(top_movies.sort_values("rating_count", ascending=False).head(10))

# Keep movies with at least 5 ratings
MIN_RATINGS = 5

top_movies = top_movies[
    top_movies["rating_count"] >= MIN_RATINGS
]

# Sort by average rating
top_movies = top_movies.sort_values(
    by=["average_rating", "rating_count"],
    ascending=[False, False]
)

# Join with movie titles
recommended = top_movies.merge(
    movies,
    on="movie_id"
)

print("\n===============================")
print("Top 10 Recommended Movies")
print("===============================\n")

if recommended.empty:
    print(f"No movies have at least {MIN_RATINGS} ratings.")
    print("Try reducing MIN_RATINGS to 3 or generate more ratings.")
else:
    print(
        recommended[
            [
                "title",
                "average_rating",
                "rating_count"
            ]
        ].head(10)
    )