# 🎬 Netflix Analytics Platform

> An end-to-end Data Analytics and Machine Learning project that simulates a Netflix-style streaming platform using PostgreSQL, Python, SQL, Power BI, and Recommendation Systems.

---

## 📌 Project Overview

This platform combines **Data Engineering, Business Intelligence, Machine Learning, and Web Application Development** into a single interactive solution.

Users can:

- 📊 Explore interactive analytics dashboards
- 🗄 Browse the PostgreSQL database
- 📈 Execute SQL analytics
- 🤖 Generate AI-powered movie recommendations
- 📸 View Power BI dashboard screenshots
- 🔍 Explore Netflix streaming insights through an intuitive Streamlit interface
---

# 🚀 Key Features

### 📊 Data Engineering

- Designed a normalized PostgreSQL database
- Created relational tables with foreign keys
- Implemented constraints and indexing
- Generated realistic synthetic Netflix data
- Built ETL pipelines using Python and SQLAlchemy

---

### 🗄 Database Schema

The platform contains the following entities:

- Movies
- Genres
- Movie Genres
- Users
- Ratings
- Watch History
- Subscription Plans
- Subscriptions
- Countries
- Devices

All tables are connected through proper foreign key relationships following database normalization principles.

---

### 🐍 Python Modules

Developed Python scripts for:

- Data generation
- ETL pipeline
- Database loading
- Recommendation systems
- Database connectivity
- Analytics automation

---

### 📈 SQL Analytics

Implemented advanced SQL including:

- Joins
- Common Table Expressions (CTEs)
- Window Functions
- Aggregate Functions
- Ranking Functions
- Views
- Stored Procedures
- Performance Optimization using Indexes

Created analytical views for:

- Executive KPIs
- Monthly Watch Hours
- Monthly Signups
- Genre Popularity
- Device Usage
- Country Watch Time
- User Activity
- Subscription Summary
- Movie Ratings
- User Watch Summary

---

### 📊 Power BI Dashboards

Developed interactive dashboards including:

## Executive Overview

- Total Users
- Total Movies
- Average Rating
- Total Watch Hours
- Estimated Revenue
- Active Subscribers

---

## User Analytics

- User Distribution
- Daily Active Users
- Monthly Active Users
- Watch Time Analysis
- User Demographics

---

## Content Analytics

- Genre Popularity
- Top Movies
- Movie Ratings
- Completion Rate
- Watch Time Trends

---

## Subscription Analytics

- Active vs Inactive Users
- Payment Status
- Auto Renew Analysis
- Revenue Distribution
- Subscription Plans

---

## Recommendation Analytics

Visual insights supporting recommendation systems.

---

# 🤖 Machine Learning

Implemented three recommendation systems.

---

## 1️⃣ Popularity Based Recommendation

Recommends movies based on

- Average Rating
- Rating Count

Libraries Used

- Pandas

---

## 2️⃣ Content Based Recommendation

Uses

- TF-IDF Vectorization
- Cosine Similarity

Content similarity is calculated using movie genres stored in PostgreSQL.

Libraries

- Scikit-learn
- Pandas

---

## 3️⃣ Collaborative Filtering

User-user recommendation engine based on

- Ratings Matrix
- Cosine Similarity
- Similar User Behaviour

---

# 🛠 Tech Stack

## Programming

- Python
- SQL

## Database

- PostgreSQL
- pgAdmin 4

## Python Libraries

- Pandas
- NumPy
- SQLAlchemy
- Psycopg2
- Faker
- Scikit-learn
- Matplotlib

## Business Intelligence

- Microsoft Power BI
- Streamlit

## Data Visualization

- Plotly
---

# 📂 Project Structure

```
Netflix-Analytics-Platform/

├── dataset/
│   ├── raw/
│   ├── generated/
│   └── processed/
│
├── python/
│   ├── db.py
│   ├── load_movies.py
│   ├── load_users.py
│   ├── load_watch_history.py
│   ├── load_ratings.py
│   ├── popularity_recommender.py
│   ├── content_based_recommender.py
│   ├── collaborative_filtering.py
│
├── screenshots/
│
├── sql/
│   ├── schema.sql
│   ├── analytics_queries.sql
│   ├── views.sql
│   ├── procedures.sql
│   └── indexes.sql
│
├── README.md
├── requirements.txt
└── LICENSE
```

---

# 📸 Dashboard Screenshots

## Executive Dashboard

<img width="1920" height="1200" alt="Screenshot 2026-06-29 165814" src="https://github.com/user-attachments/assets/0da1edf8-fc1e-402d-99ab-7d666a2f00f3" />

---
## User Dashboard

<img width="1920" height="1200" alt="Screenshot 2026-06-29 165827" src="https://github.com/user-attachments/assets/adb4ad02-a4ad-4a4d-85ec-727d5a070b0f" />

---

## Content Dashboard

<img width="1920" height="1140" alt="Screenshot 2026-06-29 165840" src="https://github.com/user-attachments/assets/262da4ea-2385-4c03-87e6-f2edd1545e5f" />


---

## Subscription Dashboard

<img width="1920" height="1140" alt="Screenshot 2026-06-29 165855" src="https://github.com/user-attachments/assets/977ff4af-6754-469b-ad38-ff7c6096c49e" />


---

## Recommendation Dashboard

<img width="1920" height="1140" alt="Screenshot 2026-06-29 165913" src="https://github.com/user-attachments/assets/b196638b-6467-4d98-9277-63a7288ac818" />


---

## 🌐 Streamlit Web Application

An interactive web application was developed using **Streamlit** to provide a unified interface for exploring the entire project.

### Features

- 🏠 Home Dashboard
- 📊 Power BI Dashboard Showcase
- 🗄 PostgreSQL Database Explorer
- 📈 SQL Analytics Dashboard
- 🤖 AI Recommendation Engine
- ℹ Project Overview

The application allows users to interact with the database, execute analytics, and generate movie recommendations directly from the browser.

# ⚙ Installation

Clone Repository

```bash
git clone https://github.com/shenal19/Netflix-Analytics-Platform.git
```

Navigate into the project

```bash
cd Netflix-Analytics-Platform
```

Install dependencies

```bash
pip install -r requirements.txt
```

Update PostgreSQL credentials in

```python
python/db.py
```

Run ETL scripts

```bash
python load_movies.py
python load_users.py
python load_ratings.py
python load_watch_history.py
```

Run Recommendation Systems

```bash
python popularity_recommender.py
python content_based_recommender.py
python collaborative_filtering.py
```

---

# 📈 Project Highlights

✔ Designed a normalized relational database

✔ Built an automated ETL pipeline

✔ Generated realistic synthetic Netflix data

✔ Developed 5 interactive Power BI dashboards

✔ Wrote advanced SQL queries using joins, CTEs, window functions and views

✔ Implemented three movie recommendation algorithms

✔ Integrated PostgreSQL with Python using SQLAlchemy

✔ Built an end-to-end analytics pipeline from raw data to dashboard visualization

✔ Developed a full-featured Streamlit web application integrating analytics, SQL, PostgreSQL, and AI recommendation systems.

---

# 📌 Future Enhancements

- User Authentication
- Movie Poster Integration (TMDb API)
- Hybrid Recommendation System
- Docker Deployment
- AWS Cloud Deployment
- Explainable AI Recommendations

---

# 📚 Learning Outcomes

This project demonstrates practical experience in

- Database Design
- SQL Analytics
- ETL Pipelines
- Data Engineering
- Business Intelligence
- Machine Learning
- Recommendation Systems
- Python Programming
- Data Visualization

---

## 🎥 Live Application

The project includes a Streamlit-based web application that brings together all components into a single interactive interface.

### Available Modules

- 🏠 Home
- 📊 Dashboard Showcase
- 🗄 Database Explorer
- 📈 SQL Analytics
- 🤖 AI Recommendation Engine
- ℹ About Project

Run locally using:

```bash
streamlit run app.py
```

Deploy link: http://localhost:8501/#netflix-analytics-platform


# 👨‍💻 Author

**Balaji**

B.Tech Computer Science and Engineering (Data Science)

VIT Chennai

GitHub:
https://github.com/shenal19

LinkedIn:
https://www.linkedin.com/in/shenbaga-balaji-6b4b8228a/

---

## ⭐ If you found this project interesting, consider giving it a Star!
