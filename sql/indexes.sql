
/*
===========================================================
Netflix Analytics & Recommendation Intelligence Platform
Indexes
Author: Shenbagabalaji A
Database: PostgreSQL
===========================================================
*/

-- ==========================================
-- DROP EXISTING INDEXES (Optional)
-- ==========================================

DROP INDEX IF EXISTS idx_movies_title;
DROP INDEX IF EXISTS idx_movies_release_year;

DROP INDEX IF EXISTS idx_users_country;
DROP INDEX IF EXISTS idx_users_plan;
DROP INDEX IF EXISTS idx_users_join_date;

DROP INDEX IF EXISTS idx_watch_user;
DROP INDEX IF EXISTS idx_watch_movie;
DROP INDEX IF EXISTS idx_watch_device;
DROP INDEX IF EXISTS idx_watch_date;
DROP INDEX IF EXISTS idx_watch_user_movie;
DROP INDEX IF EXISTS idx_watch_movie_date;

DROP INDEX IF EXISTS idx_ratings_user;
DROP INDEX IF EXISTS idx_ratings_movie;
DROP INDEX IF EXISTS idx_ratings_rating;

DROP INDEX IF EXISTS idx_moviegenres_movie;
DROP INDEX IF EXISTS idx_moviegenres_genre;

DROP INDEX IF EXISTS idx_subscriptions_user;
DROP INDEX IF EXISTS idx_subscriptions_status;
DROP INDEX IF EXISTS idx_subscriptions_startdate;

-- ==========================================
-- MOVIES
-- ==========================================

CREATE INDEX idx_movies_title
ON movies(title);

CREATE INDEX idx_movies_release_year
ON movies(release_year);

-- ==========================================
-- USERS
-- ==========================================

CREATE INDEX idx_users_country
ON users(country_id);

CREATE INDEX idx_users_plan
ON users(plan_id);

CREATE INDEX idx_users_join_date
ON users(join_date);

-- ==========================================
-- WATCH HISTORY
-- ==========================================

CREATE INDEX idx_watch_user
ON watch_history(user_id);

CREATE INDEX idx_watch_movie
ON watch_history(movie_id);

CREATE INDEX idx_watch_device
ON watch_history(device_id);

CREATE INDEX idx_watch_date
ON watch_history(watch_date);

-- Composite Index
CREATE INDEX idx_watch_user_movie
ON watch_history(user_id, movie_id);

-- Composite Index
CREATE INDEX idx_watch_movie_date
ON watch_history(movie_id, watch_date);

-- ==========================================
-- RATINGS
-- ==========================================

CREATE INDEX idx_ratings_user
ON ratings(user_id);

CREATE INDEX idx_ratings_movie
ON ratings(movie_id);

CREATE INDEX idx_ratings_rating
ON ratings(rating);

-- ==========================================
-- MOVIE GENRES
-- ==========================================

CREATE INDEX idx_moviegenres_movie
ON movie_genres(movie_id);

CREATE INDEX idx_moviegenres_genre
ON movie_genres(genre_id);

-- ==========================================
-- SUBSCRIPTIONS
-- ==========================================

CREATE INDEX idx_subscriptions_user
ON subscriptions(user_id);

CREATE INDEX idx_subscriptions_status
ON subscriptions(payment_status);

CREATE INDEX idx_subscriptions_startdate
ON subscriptions(start_date);

-- ==========================================
-- PERFORMANCE TESTS
-- ==========================================

-- Query by user
EXPLAIN ANALYZE
SELECT *
FROM watch_history
WHERE user_id = 100;

-- Query by movie
EXPLAIN ANALYZE
SELECT *
FROM watch_history
WHERE movie_id = 250;

-- Composite index usage
EXPLAIN ANALYZE
SELECT *
FROM watch_history
WHERE user_id = 100
AND movie_id = 250;

-- ORDER BY optimization
EXPLAIN ANALYZE
SELECT *
FROM watch_history
ORDER BY watch_date DESC
LIMIT 20;

-- GROUP BY optimization
EXPLAIN ANALYZE
SELECT
    movie_id,
    COUNT(*)
FROM watch_history
GROUP BY movie_id;

-- JOIN optimization
EXPLAIN ANALYZE
SELECT
    m.title,
    COUNT(*)
FROM movies m
JOIN watch_history w
ON m.movie_id = w.movie_id
GROUP BY
    m.movie_id,
    m.title;

-- ==========================================
-- DATABASE STATISTICS
-- ==========================================

-- Database Size
SELECT
    pg_size_pretty(
        pg_database_size(current_database())
    ) AS database_size;

-- Largest Tables
SELECT
    relname AS table_name,
    pg_size_pretty(
        pg_total_relation_size(relid)
    ) AS table_size
FROM pg_catalog.pg_statio_user_tables
ORDER BY pg_total_relation_size(relid) DESC;

-- Index Usage Statistics
SELECT
    relname,
    idx_scan
FROM pg_stat_user_tables
ORDER BY idx_scan DESC;

-- List All Indexes
SELECT
    schemaname,
    tablename,
    indexname
FROM pg_indexes
WHERE schemaname='public'
ORDER BY
    tablename,
    indexname;

-- ==========================================
-- END OF INDEX FILE
-- ==========================================

