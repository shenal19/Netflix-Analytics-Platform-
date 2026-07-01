```sql
/*
===========================================================
Netflix Analytics & Recommendation Intelligence Platform
Database Schema
Author: Shenbagabalaji A
Database: PostgreSQL
===========================================================
*/

-- ==========================================
-- DROP TABLES
-- ==========================================

DROP TABLE IF EXISTS watch_history CASCADE;
DROP TABLE IF EXISTS ratings CASCADE;
DROP TABLE IF EXISTS subscriptions CASCADE;
DROP TABLE IF EXISTS movie_genres CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS movies CASCADE;
DROP TABLE IF EXISTS genres CASCADE;
DROP TABLE IF EXISTS devices CASCADE;
DROP TABLE IF EXISTS countries CASCADE;
DROP TABLE IF EXISTS plans CASCADE;

-- ==========================================
-- COUNTRIES
-- ==========================================

CREATE TABLE countries (

    country_id SERIAL PRIMARY KEY,

    country_name VARCHAR(100) UNIQUE NOT NULL

);

-- ==========================================
-- DEVICES
-- ==========================================

CREATE TABLE devices (

    device_id SERIAL PRIMARY KEY,

    device_name VARCHAR(50) UNIQUE NOT NULL

);

-- ==========================================
-- PLANS
-- ==========================================

CREATE TABLE plans (

    plan_id SERIAL PRIMARY KEY,

    plan_name VARCHAR(50) UNIQUE NOT NULL,

    price NUMERIC(8,2) NOT NULL,

    max_screens INT NOT NULL CHECK(max_screens > 0),

    video_quality VARCHAR(20) NOT NULL

);

-- ==========================================
-- USERS
-- ==========================================

CREATE TABLE users (

    user_id INT PRIMARY KEY,

    full_name VARCHAR(100) NOT NULL,

    email VARCHAR(150) UNIQUE NOT NULL,

    age INT CHECK(age >= 13),

    gender VARCHAR(20),

    country_id INT NOT NULL,

    plan_id INT NOT NULL,

    join_date DATE NOT NULL,

    CONSTRAINT fk_users_country
        FOREIGN KEY(country_id)
        REFERENCES countries(country_id),

    CONSTRAINT fk_users_plan
        FOREIGN KEY(plan_id)
        REFERENCES plans(plan_id)

);

-- ==========================================
-- MOVIES
-- ==========================================

CREATE TABLE movies (

    movie_id INT PRIMARY KEY,

    title VARCHAR(255) NOT NULL,

    release_year INT,

    duration_minutes INT,

    imdb_rating NUMERIC(3,1)

);

-- ==========================================
-- GENRES
-- ==========================================

CREATE TABLE genres (

    genre_id SERIAL PRIMARY KEY,

    genre_name VARCHAR(50) UNIQUE NOT NULL

);

-- ==========================================
-- MOVIE GENRES (Many-to-Many)
-- ==========================================

CREATE TABLE movie_genres (

    movie_id INT NOT NULL,

    genre_id INT NOT NULL,

    PRIMARY KEY(movie_id, genre_id),

    CONSTRAINT fk_moviegenre_movie
        FOREIGN KEY(movie_id)
        REFERENCES movies(movie_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_moviegenre_genre
        FOREIGN KEY(genre_id)
        REFERENCES genres(genre_id)
        ON DELETE CASCADE

);

-- ==========================================
-- SUBSCRIPTIONS
-- ==========================================

CREATE TABLE subscriptions (

    subscription_id INT PRIMARY KEY,

    user_id INT UNIQUE NOT NULL,

    start_date DATE NOT NULL,

    end_date DATE,

    payment_status VARCHAR(20),

    auto_renew BOOLEAN DEFAULT TRUE,

    CONSTRAINT fk_subscription_user
        FOREIGN KEY(user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE,

    CONSTRAINT chk_payment_status
        CHECK(payment_status IN
        ('Paid','Pending','Failed'))

);

-- ==========================================
-- RATINGS
-- ==========================================

CREATE TABLE ratings (

    rating_id INT PRIMARY KEY,

    user_id INT NOT NULL,

    movie_id INT NOT NULL,

    rating NUMERIC(2,1)
        CHECK(rating BETWEEN 0.5 AND 5.0),

    review_date DATE,

    CONSTRAINT fk_rating_user
        FOREIGN KEY(user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_rating_movie
        FOREIGN KEY(movie_id)
        REFERENCES movies(movie_id)
        ON DELETE CASCADE

);

-- ==========================================
-- WATCH HISTORY
-- ==========================================

CREATE TABLE watch_history (

    watch_id INT PRIMARY KEY,

    user_id INT NOT NULL,

    movie_id INT NOT NULL,

    device_id INT NOT NULL,

    watch_date TIMESTAMP NOT NULL,

    minutes_watched INT
        CHECK(minutes_watched >= 0),

    completion_percentage NUMERIC(5,2)
        CHECK(completion_percentage
        BETWEEN 0 AND 100),

    CONSTRAINT fk_watch_user
        FOREIGN KEY(user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_watch_movie
        FOREIGN KEY(movie_id)
        REFERENCES movies(movie_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_watch_device
        FOREIGN KEY(device_id)
        REFERENCES devices(device_id)
        ON DELETE CASCADE

);

-- ==========================================
-- SAMPLE MASTER DATA
-- ==========================================

INSERT INTO devices(device_name)
VALUES
('Mobile'),
('Tablet'),
('Laptop'),
('Smart TV'),
('Desktop');

INSERT INTO plans
(plan_name,price,max_screens,video_quality)
VALUES
('Basic',199,1,'HD'),
('Standard',499,2,'Full HD'),
('Premium',649,4,'4K');

-- ==========================================
-- END OF SCHEMA
-- ==========================================
```
