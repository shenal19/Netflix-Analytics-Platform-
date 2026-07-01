import pandas as pd
from db import engine
from sklearn.metrics.pairwise import cosine_similarity

ratings = pd.read_sql(
    "SELECT user_id, movie_id, rating FROM ratings",
    engine
)

movies = pd.read_sql(
    "SELECT movie_id, title FROM movies",
    engine
)

print(ratings.head())

user_movie_matrix = ratings.pivot_table(
    index="user_id",
    columns="movie_id",
    values="rating"
).fillna(0)

print(user_movie_matrix.shape)

user_similarity = cosine_similarity(user_movie_matrix)

user_similarity_df = pd.DataFrame(
    user_similarity,
    index=user_movie_matrix.index,
    columns=user_movie_matrix.index
)

print(user_similarity_df.head())


def recommend_for_user(user_id, top_n=10):

    if user_id not in user_similarity_df.index:
        print("User not found!")
        return

    similar_users = (
        user_similarity_df[user_id]
        .sort_values(ascending=False)
        .iloc[1:6]
    )

    watched = ratings[
        ratings["user_id"] == user_id
    ]["movie_id"]

    recommendations = ratings[
        ratings["user_id"].isin(similar_users.index)
    ]

    recommendations = recommendations[
        ~recommendations["movie_id"].isin(watched)
    ]

    recommendations = (
        recommendations.groupby("movie_id")["rating"]
        .mean()
        .sort_values(ascending=False)
        .head(top_n)
        .reset_index()
    )

    recommendations = recommendations.merge(
        movies,
        on="movie_id"
    )

    print(f"\nRecommendations for User {user_id}\n")

    print(
        recommendations[
            ["title", "rating"]
        ]
    )



user = int(input("Enter User ID: "))

recommend_for_user(user)