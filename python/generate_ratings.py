from pathlib import Path
import pandas as pd
import random

BASE_DIR = Path(__file__).resolve().parent.parent

watch_history = pd.read_csv(
    BASE_DIR / "dataset" / "generated" / "watch_history.csv"
)

# Only 35% of watch history becomes ratings
ratings_source = watch_history.sample(frac=0.35, random_state=42)

ratings = []

rating_choices = [5.0, 4.5, 4.0, 3.5, 3.0, 2.5, 2.0, 1.5, 1.0, 0.5]

rating_weights = [
    0.30,
    0.20,
    0.18,
    0.10,
    0.08,
    0.05,
    0.04,
    0.03,
    0.015,
    0.005
]

rating_id = 1

for _, row in ratings_source.iterrows():

    ratings.append({

        "rating_id": rating_id,

        "user_id": row["user_id"],

        "movie_id": row["movie_id"],

        "rating": random.choices(
            rating_choices,
            weights=rating_weights
        )[0],

        "review_date": row["watch_date"]

    })

    rating_id += 1

ratings_df = pd.DataFrame(ratings)

ratings_df.to_csv(
    BASE_DIR / "dataset" / "generated" / "ratings.csv",
    index=False
)

print(ratings_df.head())
print(f"\nGenerated {len(ratings_df)} ratings")


import pandas as pd

ratings = pd.read_csv("dataset/generated/ratings.csv")

print(ratings.shape)

print(ratings.head())