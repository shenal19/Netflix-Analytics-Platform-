from pathlib import Path
import pandas as pd

BASE_DIR = Path(__file__).resolve().parent.parent

movies = pd.read_csv(BASE_DIR / "dataset" / "raw" / "movies.csv")
ratings = pd.read_csv(BASE_DIR / "dataset" / "raw" / "ratings.csv")

# Remove duplicates
movies = movies.drop_duplicates()
ratings = ratings.drop_duplicates()

# Remove spaces from column names
movies.columns = movies.columns.str.strip()
ratings.columns = ratings.columns.str.strip()

# Handle missing values
movies = movies.fillna("Unknown")
ratings = ratings.fillna(0)

# Save cleaned datasets
processed_path = BASE_DIR / "dataset" / "processed"

movies.to_csv(processed_path / "movies_clean.csv", index=False)
ratings.to_csv(processed_path / "ratings_clean.csv", index=False)

print("Movies cleaned successfully")
print("Ratings cleaned successfully")