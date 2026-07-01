import pandas as pd
from db import engine
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity

movies = pd.read_sql("SELECT * FROM movies", engine)
genres = pd.read_sql("SELECT * FROM genres", engine)
movie_genres = pd.read_sql("SELECT * FROM movie_genres", engine)

print("Movies:", len(movies))
print("Genres:", len(genres))
print("Movie Genres:", len(movie_genres))

movie_data = (
    movie_genres
    .merge(genres, on="genre_id")
    .merge(movies, on="movie_id")
)

print(movie_data.head())

movie_features = (
    movie_data
    .groupby(["movie_id", "title"])["genre_name"]
    .apply(lambda x: " ".join(x))
    .reset_index()
)

print(movie_features.head())

tfidf = TfidfVectorizer()

tfidf_matrix = tfidf.fit_transform(
    movie_features["genre_name"]
)

cosine_sim = cosine_similarity(tfidf_matrix)

def recommend(movie_title, top_n=10):

    indices = pd.Series(
        movie_features.index,
        index=movie_features["title"]
    )

    if movie_title not in indices:
        print("Movie not found!")
        return

    idx = indices[movie_title]

    scores = list(
        enumerate(cosine_sim[idx])
    )

    scores = sorted(
        scores,
        key=lambda x: x[1],
        reverse=True
    )

    scores = scores[1:top_n+1]

    movie_indices = [i[0] for i in scores]

    print(f"\nRecommendations for {movie_title}\n")

    print(
        movie_features.iloc[movie_indices][
            ["title", "genre_name"]
        ]
    )




recommend("Toy Story (1995)")