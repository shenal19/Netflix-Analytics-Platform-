from sqlalchemy import create_engine

DATABASE_URL = "postgresql://postgres:balaji@localhost:5432/netflix_analytics"

engine = create_engine(DATABASE_URL)