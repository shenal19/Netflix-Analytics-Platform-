import pandas as pd

movies = pd.read_csv(
    r"C:/Users/Shenbaga Balaji/OneDrive/문서/PLACEMENT/Netflix-Analytics-Recommendation-Platform/dataset/raw/movies.csv"
)

ratings = pd.read_csv(
    r"C:/Users/Shenbaga Balaji/OneDrive/문서/PLACEMENT/Netflix-Analytics-Recommendation-Platform/dataset/raw/ratings.csv"
)
print("="*50)
print("MOVIES DATASET")
print("="*50)

print(movies.head())

print("\nShape:", movies.shape)

print("\nColumns:")
print(movies.columns)

print("\nData Types:")
print(movies.dtypes)

print("\nMissing Values:")
print(movies.isnull().sum())

print("\nDuplicate Rows:")
print(movies.duplicated().sum())

print("\n" + "="*50)
print("RATINGS DATASET")
print("="*50)

print(ratings.head())

print("\nShape:", ratings.shape)

print("\nColumns:")
print(ratings.columns)

print("\nData Types:")
print(ratings.dtypes)

print("\nMissing Values:")
print(ratings.isnull().sum())

print("\nDuplicate Rows:")
print(ratings.duplicated().sum())
