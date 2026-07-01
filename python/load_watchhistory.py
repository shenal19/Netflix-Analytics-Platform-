from pathlib import Path
import pandas as pd
from sqlalchemy import text
from db import engine

BASE_DIR = Path(__file__).resolve().parent.parent

# Read generated CSV
watch_history = pd.read_csv(
    BASE_DIR / "dataset" / "generated" / "watch_history.csv"
)

print("Rows Found:", len(watch_history))

# Clear existing data
with engine.begin() as conn:
    conn.execute(text("TRUNCATE TABLE watch_history RESTART IDENTITY CASCADE"))

# Load into PostgreSQL
watch_history.to_sql(
    "watch_history",
    engine,
    if_exists="append",
    index=False,
    chunksize=5000
)

print("Watch History Loaded Successfully!")