
/*
===========================================================
Netflix Analytics & Recommendation Intelligence Platform
Business Reporting Views
Author: Shenbagabalaji A
Database: PostgreSQL
===========================================================
*/

-- ==========================================
-- DROP EXISTING VIEWS
-- ==========================================

DROP VIEW IF EXISTS vw_executive_kpis CASCADE;
DROP VIEW IF EXISTS vw_top_movies CASCADE;
DROP VIEW IF EXISTS vw_user_activity CASCADE;
DROP VIEW IF EXISTS vw_genre_popularity CASCADE;
DROP VIEW IF EXISTS vw_country_watchtime CASCADE;
DROP VIEW IF EXISTS vw_subscription_summary CASCADE;
DROP VIEW IF EXISTS vw_device_usage CASCADE;
DROP VIEW IF EXISTS vw_movie_ratings CASCADE;
DROP VIEW IF EXISTS vw_monthly_watch_hours CASCADE;
DROP VIEW IF EXISTS vw_monthly_signups CASCADE;
DROP VIEW IF EXISTS vw_completion_rate CASCADE;
DROP VIEW IF EXISTS vw_user_watch_summary CASCADE;

-- ==========================================
-- EXECUTIVE KPI VIEW
-- ==========================================

CREATE VIEW vw_executive_kpis AS

SELECT

    (SELECT COUNT(*) FROM users) AS total_users,

    (SELECT COUNT(*) FROM movies) AS total_movies,

    (SELECT COUNT(*) FROM watch_history) AS total_watch_events,

    (SELECT COUNT(*) FROM ratings) AS total_ratings,

    (SELECT ROUND(AVG(rating),2) FROM ratings) AS average_rating,

    (SELECT ROUND(SUM(minutes_watched)/60.0,2)
     FROM watch_history) AS total_watch_hours;

-- ==========================================
-- TOP MOVIES
-- ==========================================

CREATE VIEW vw_top_movies AS

SELECT

    m.movie_id,

    m.title,

    COUNT(w.watch_id) AS total_views,

    ROUND(AVG(r.rating),2) AS average_rating,

    SUM(w.minutes_watched) AS total_watch_minutes

FROM movies m

LEFT JOIN watch_history w
ON m.movie_id=w.movie_id

LEFT JOIN ratings r
ON m.movie_id=r.movie_id

GROUP BY
m.movie_id,
m.title;

-- ==========================================
-- USER ACTIVITY
-- ==========================================

CREATE VIEW vw_user_activity AS

SELECT

u.user_id,

u.full_name,

COUNT(w.watch_id) total_views,

SUM(w.minutes_watched) total_minutes,

ROUND(AVG(r.rating),2) average_rating

FROM users u

LEFT JOIN watch_history w
ON u.user_id=w.user_id

LEFT JOIN ratings r
ON u.user_id=r.user_id

GROUP BY
u.user_id,
u.full_name;

-- ==========================================
-- GENRE POPULARITY
-- ==========================================

CREATE VIEW vw_genre_popularity AS

SELECT

g.genre_name,

COUNT(*) total_views,

SUM(w.minutes_watched) total_watch_minutes,

ROUND(AVG(r.rating),2) average_rating

FROM genres g

JOIN movie_genres mg
ON g.genre_id=mg.genre_id

JOIN watch_history w
ON mg.movie_id=w.movie_id

LEFT JOIN ratings r
ON mg.movie_id=r.movie_id

GROUP BY
g.genre_name;

-- ==========================================
-- COUNTRY WATCH TIME
-- ==========================================

CREATE VIEW vw_country_watchtime AS

SELECT

c.country_name,

COUNT(w.watch_id) total_views,

SUM(w.minutes_watched) total_minutes

FROM countries c

JOIN users u
ON c.country_id=u.country_id

JOIN watch_history w
ON u.user_id=w.user_id

GROUP BY
c.country_name;

-- ==========================================
-- SUBSCRIPTION SUMMARY
-- ==========================================

CREATE VIEW vw_subscription_summary AS

SELECT
    p.plan_id,
    p.plan_name,
    p.monthly_fee,
    COUNT(u.user_id) AS subscribers,
    COUNT(u.user_id) * p.monthly_fee AS estimated_revenue

FROM plans p

LEFT JOIN users u
ON p.plan_id = u.plan_id

GROUP BY
    p.plan_id,
    p.plan_name,
    p.monthly_fee;
-- ==========================================
-- DEVICE USAGE
-- ==========================================

CREATE VIEW vw_device_usage AS

SELECT

d.device_name,

COUNT(*) total_sessions,

SUM(minutes_watched) total_watch_minutes

FROM devices d

JOIN watch_history w
ON d.device_id=w.device_id

GROUP BY
d.device_name;

-- ==========================================
-- MOVIE RATINGS
-- ==========================================

CREATE VIEW vw_movie_ratings AS

SELECT

m.movie_id,

m.title,

ROUND(AVG(r.rating),2) average_rating,

COUNT(r.rating_id) total_ratings

FROM movies m

LEFT JOIN ratings r
ON m.movie_id=r.movie_id

GROUP BY
m.movie_id,
m.title;

-- ==========================================
-- MONTHLY WATCH HOURS
-- ==========================================

CREATE VIEW vw_monthly_watch_hours AS

SELECT

DATE_TRUNC('month',watch_date) as  month,

ROUND(SUM(minutes_watched)/60.0,2)
watch_hours

FROM watch_history

GROUP BY month

ORDER BY month;

-- ==========================================
-- MONTHLY USER SIGNUPS
-- ==========================================

CREATE VIEW vw_monthly_signups AS

SELECT

DATE_TRUNC('month',join_date) as month,

COUNT(*) new_users

FROM users

GROUP BY month

ORDER BY month;

-- ==========================================
-- COMPLETION RATE
-- ==========================================

CREATE VIEW vw_completion_rate AS

SELECT

m.movie_id,

m.title,

ROUND(
AVG(w.completion_percentage),2
)

completion_rate

FROM movies m

JOIN watch_history w
ON m.movie_id=w.movie_id

GROUP BY
m.movie_id,
m.title;

-- ==========================================
-- USER WATCH SUMMARY
-- ==========================================

CREATE VIEW vw_user_watch_summary AS

SELECT

u.user_id,

u.full_name,

COUNT(w.watch_id) movies_watched,

SUM(w.minutes_watched) total_minutes,

ROUND(
AVG(w.completion_percentage),2
) completion_rate

FROM users u

LEFT JOIN watch_history w
ON u.user_id=w.user_id

GROUP BY
u.user_id,
u.full_name;

-- ==========================================
-- VERIFY CREATED VIEWS
-- ==========================================

SELECT table_name

FROM information_schema.views

WHERE table_schema='public'

ORDER BY table_name;

-- ==========================================
-- END OF FILE
-- ==========================================

