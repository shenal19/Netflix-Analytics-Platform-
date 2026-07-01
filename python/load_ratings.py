from pathlib import Path
import pandas as pd
from sqlalchemy import text
from db import engine

BASE_DIR = Path(__file__).resolve().parent.parent

ratings = pd.read_csv(
    BASE_DIR / "dataset" / "generated" / "ratings.csv"
)

print("Rows:", len(ratings))

with engine.begin() as conn:
    conn.execute(
        text("TRUNCATE TABLE ratings RESTART IDENTITY CASCADE")
    )

ratings.to_sql(
    "ratings",
    engine,
    if_exists="append",
    index=False,
    chunksize=5000
)

print("Ratings Loaded Successfully")