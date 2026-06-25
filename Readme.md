# ⭐ Netflix Analytics & Recommendation Intelligence Platform

<div align="center">

**🚀 End-to-End Data Analytics Platform using SQL, Python ETL & Power BI**

*Transforming streaming data into actionable business insights through advanced SQL analytics, automated ETL pipelines, and interactive dashboards.*

![Python](https://img.shields.io/badge/Python-3.x-blue)
![SQL](https://img.shields.io/badge/SQL-Advanced-green)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-Database-blue)
![PowerBI](https://img.shields.io/badge/PowerBI-Dashboard-yellow)
![License](https://img.shields.io/badge/License-MIT-red)

</div>

---

# 📌 Overview

Netflix Analytics & Recommendation Intelligence Platform is a full-stack data analytics project that simulates a real-world streaming platform. The project integrates **SQL, Python ETL, and Business Intelligence** to analyze user engagement, content performance, subscription revenue, and personalized recommendations.

The platform demonstrates modern data engineering and analytics workflows used in large-scale product companies.

---

# 🎯 Objectives

* Design a scalable relational database
* Build automated Python ETL pipelines
* Perform advanced SQL analytics
* Generate business insights through dashboards
* Develop a recommendation engine
* Optimize query performance using indexing

---

# 🏗️ Project Architecture

```text
                    Raw Netflix Dataset
                            │
                            ▼
                 Python ETL Pipeline
         (Extract → Transform → Load)
                            │
                            ▼
                  PostgreSQL / MySQL
                            │
        ┌───────────────────┼───────────────────┐
        ▼                   ▼                   ▼
 Advanced SQL        Recommendation        Query
   Analytics             Engine          Optimization
        │                   │                   │
        └───────────────────┼───────────────────┘
                            ▼
                  Power BI Dashboard
                            │
                            ▼
                  Business Insights
```

---

# 🛠️ Tech Stack

| Category        | Technologies       |
| --------------- | ------------------ |
| Programming     | Python             |
| Database        | PostgreSQL / MySQL |
| Analytics       | SQL                |
| ETL             | Pandas, SQLAlchemy |
| Dashboard       | Power BI           |
| Version Control | Git & GitHub       |

---

# 📂 Project Structure

```text
Netflix-Analytics-Platform/

│
├── dataset/
│
├── sql/
│   ├── schema.sql
│   ├── constraints.sql
│   ├── indexes.sql
│   ├── views.sql
│   ├── procedures.sql
│   └── analytics_queries.sql
│
├── python/
│   ├── etl.py
│   ├── transform.py
│   ├── load.py
│   └── recommendation.py
│
├── dashboard/
│   └── Netflix_Dashboard.pbix
│
├── docs/
│   ├── ER_Diagram.png
│   ├── StarSchema.png
│   └── Report.pdf
│
├── screenshots/
│
├── README.md
│
└── requirements.txt
```

---

# 🗄️ Database Design

## Dimension Tables

* Users
* Movies
* Genres
* Dates

## Fact Tables

* Watch History
* Ratings
* Subscriptions

---

# ⭐ Star Schema

```text
                 dim_users
                      │
                      │
dim_dates ─── fact_watch_history ─── dim_movies
                      │
                      │
               fact_ratings
                      │
               fact_subscriptions
```

---

# 📊 Analytics Modules

### 🎬 Content Analytics

* Top Movies
* Genre Popularity
* Watch Time Analysis
* Completion Rate Analysis

---

### 👤 User Analytics

* Active Users
* User Retention
* User Engagement
* Watch Frequency

---

### 💰 Revenue Analytics

* Revenue by Plan
* Revenue by Country
* Monthly Revenue
* Premium Subscriber Analysis

---

### 📉 Churn Analytics

* Inactive Users
* Churn Rate
* Subscription Trends

---

### 🤖 Recommendation Analytics

* Trending Movies
* Genre-Based Recommendations
* Collaborative Filtering
* Personalized Suggestions

---

# 🔥 SQL Concepts Implemented

* SELECT
* WHERE
* ORDER BY
* GROUP BY
* HAVING
* INNER JOIN
* LEFT JOIN
* Subqueries
* Common Table Expressions (CTE)
* Window Functions
* Views
* Stored Procedures
* Triggers
* Indexing
* Query Optimization

---

# 🐍 Python ETL Pipeline

The ETL pipeline automates:

### Extract

* Read CSV datasets
* Load raw streaming data

### Transform

* Remove duplicates
* Handle missing values
* Standardize formats
* Feature engineering

### Load

* Insert cleaned data into PostgreSQL/MySQL
* Validate records
* Maintain referential integrity

---

# 📈 Power BI Dashboard

### Executive Dashboard

* Total Users
* Total Revenue
* Watch Hours
* Churn Rate

### Content Dashboard

* Top Movies
* Top Genres
* Ratings Distribution

### User Dashboard

* User Segmentation
* Engagement Analysis
* Country-wise Activity

### Recommendation Dashboard

* Trending Movies
* Personalized Recommendations

---

# ⚡ Performance Optimization

Implemented:

* Primary Keys
* Foreign Keys
* Composite Keys
* Indexes
* Execution Plan Analysis (`EXPLAIN`)
* Query Optimization

---

# 💡 Business Insights

The platform provides insights into:

* User engagement patterns
* Content performance
* Revenue growth
* Subscriber retention
* Recommendation effectiveness
* Genre popularity trends

---

# 🚀 Resume Highlights

* Designed a **Netflix-scale relational data warehouse** with multiple interconnected tables.
* Built **50+ advanced SQL queries** using joins, CTEs, window functions, views, stored procedures, and indexing.
* Developed **Python ETL pipelines** for automated data cleaning and loading.
* Created **Power BI dashboards** for engagement, churn, revenue, and content analytics.
* Implemented a **recommendation engine** for personalized content suggestions.

---

# 📚 Skills Demonstrated

* Advanced SQL
* Database Design
* Data Engineering
* ETL Pipelines
* Business Intelligence
* Data Visualization
* Query Optimization
* Recommendation Systems
* Analytics Engineering

---

# 🎯 Future Enhancements

* Apache Airflow for ETL orchestration
* Docker containerization
* REST API using FastAPI
* Real-time streaming analytics
* Machine Learning recommendation models
* Cloud deployment on AWS

---

# 👨‍💻 Author

**SHENBAGABALAJI A**

B.Tech Computer Science and Engineering (Data Science)

Vellore Institute of Technology, Chennai

---

