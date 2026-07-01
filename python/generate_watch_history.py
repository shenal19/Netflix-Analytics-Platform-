from pathlib import Path
import pandas as pd
import random
from faker import Faker

fake = Faker()

BASE_DIR = Path(__file__).resolve().parent.parent

# ---------- CONFIGURATION ----------
NUM_RECORDS = 100000      # Change to 500000 for final project
MAX_MOVIE_DURATION = 180  # minutes

# ---------- LOAD DATA ----------
users = pd.read_csv(BASE_DIR / "dataset" / "generated" / "users.csv")
movies = pd.read_csv(BASE_DIR / "dataset" / "processed" / "movies_clean.csv")

user_ids = users["user_id"].tolist()
movie_ids = movies["movieId"].tolist()

# Device IDs (must match devices table)
device_ids = [1, 2, 3, 4, 5]

watch_history = []

print("Generating watch history...")

for watch_id in range(1, NUM_RECORDS + 1):

    minutes = random.randint(5, MAX_MOVIE_DURATION)

    completion = round(
        min((minutes / MAX_MOVIE_DURATION) * 100, 100),
        2
    )

    watch_history.append({

        "watch_id": watch_id,

        "user_id": random.choice(user_ids),

        "movie_id": random.choice(movie_ids),

        "device_id": random.choice(device_ids),

        "watch_date": fake.date_time_between(
            start_date="-3y",
            end_date="now"
        ),

        "minutes_watched": minutes,

        "completion_percentage": completion

    })

watch_df = pd.DataFrame(watch_history)

# ---------- SAVE ----------
output_path = BASE_DIR / "dataset" / "generated" / "watch_history.csv"

watch_df.to_csv(output_path, index=False)

print("\nGeneration Complete!")
print(watch_df.head())
print(f"\nRows Generated : {len(watch_df)}")
print("Watch history saved successfully!")