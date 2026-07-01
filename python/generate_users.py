from faker import Faker
import pandas as pd
import random
from pathlib import Path

fake = Faker()

BASE_DIR = Path(__file__).resolve().parent.parent

countries = [1,2,3,4,5]
plans = [1,2,3]

users=[]

for i in range(1,5001):

    users.append({

        "user_id":i,

        "full_name":fake.name(),

        "email":fake.unique.email(),

        "age":random.randint(18,65),

        "gender":random.choice(["Male","Female"]),

        "country_id":random.choice(countries),

        "plan_id":random.choice(plans),

        "join_date":fake.date_between("-5y","today")

    })

users_df=pd.DataFrame(users)

users_df.to_csv(
    BASE_DIR/"dataset/generated/users.csv",
    index=False
)

print(users_df.head())
print(f"Generated {len(users_df)} users")