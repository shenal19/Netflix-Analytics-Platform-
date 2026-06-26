from pathlib import Path
import pandas as pd
from sqlalchemy import create_engine

# Project root
BASE_DIR = Path(__file__).resolve().parent.parent

# Read cleaned datasets
movies = pd.read_csv(BASE_DIR / "dataset" / "processed" / "movies_clean.csv")
ratings = pd.read_csv(BASE_DIR / "dataset" / "processed" / "ratings_clean.csv")

# PostgreSQL connection
engine = create_engine(
    "postgresql://postgres:balaji@localhost:5432/netflix_analytics"
)

print("Connected to PostgreSQL successfully!")

movies.to_sql(
    "movies",
    engine,
    if_exists="append",
    index=False
)

print("Movies Loaded")