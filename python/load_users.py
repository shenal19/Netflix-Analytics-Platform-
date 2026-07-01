import pandas as pd
from pathlib import Path
from db import engine

BASE_DIR = Path(__file__).resolve().parent.parent

users=pd.read_csv(
BASE_DIR/"dataset/generated/users.csv"
)

users.to_sql(
    "users",
    engine,
    if_exists="append",
    index=False
)

print("Users Loaded Successfully")