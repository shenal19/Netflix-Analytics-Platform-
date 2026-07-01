from pathlib import Path
import pandas as pd
from db import engine

BASE_DIR = Path(__file__).resolve().parent.parent


import pandas as pd

subscriptions = pd.read_csv("dataset/generated/subscriptions.csv")

print(subscriptions.head())
print(subscriptions.shape)

subscriptions.to_sql(
    "subscriptions",
    engine,
    if_exists="append",
    index=False
)

print("Subscriptions Loaded Successfully")
