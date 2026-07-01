from pathlib import Path
import pandas as pd
import random
from faker import Faker

fake = Faker()

BASE_DIR = Path(__file__).resolve().parent.parent

users = pd.read_csv(BASE_DIR / "dataset/generated/users.csv")

subscriptions = []

for _, row in users.iterrows():

    subscriptions.append({

        "subscription_id": row["user_id"],

        "user_id": row["user_id"],

        "start_date": fake.date_between("-5y", "today"),

        "end_date": None,

        "payment_status": random.choice([
            "Paid",
            "Pending",
            "Failed"
        ]),

        "auto_renew": random.choice([True, False])

    })

subscriptions_df = pd.DataFrame(subscriptions)

subscriptions_df.to_csv(
    BASE_DIR / "dataset/generated/subscriptions.csv",
    index=False
)

print(subscriptions_df.head())
print(f"Generated {len(subscriptions_df)} subscriptions")