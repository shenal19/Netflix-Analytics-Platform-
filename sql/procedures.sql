
/*
===========================================================
Netflix Analytics & Recommendation Intelligence Platform
PostgreSQL Functions
Author: Shenbagabalaji A
===========================================================
*/

-----------------------------------------------------------
-- DROP FUNCTIONS
-----------------------------------------------------------

DROP FUNCTION IF EXISTS get_user_watch_history(INT);
DROP FUNCTION IF EXISTS get_top_movies(INT);
DROP FUNCTION IF EXISTS get_movies_by_genre(TEXT);
DROP FUNCTION IF EXISTS get_movie_average_rating(INT);
DROP FUNCTION IF EXISTS get_country_statistics(TEXT);
DROP FUNCTION IF EXISTS get_plan_statistics(TEXT);
DROP FUNCTION IF EXISTS get_user_summary(INT);
DROP FUNCTION IF EXISTS search_movies(TEXT);

-----------------------------------------------------------
-- 1. USER WATCH HISTORY
-----------------------------------------------------------

CREATE OR REPLACE FUNCTION get_user_watch_history(
    p_user_id INT
)

RETURNS TABLE(

    movie_title VARCHAR,

    watch_date TIMESTAMP,

    minutes_watched INT,

    completion_percentage NUMERIC

)

LANGUAGE SQL

AS $$

SELECT

    m.title,

    w.watch_date,

    w.minutes_watched,

    w.completion_percentage

FROM watch_history w

JOIN movies m

ON w.movie_id = m.movie_id

WHERE w.user_id = p_user_id

ORDER BY w.watch_date DESC;

$$;

-----------------------------------------------------------
-- 2. TOP MOVIES
-----------------------------------------------------------

CREATE OR REPLACE FUNCTION get_top_movies(
    movie_limit INT
)

RETURNS TABLE(

    movie_title VARCHAR,

    total_views BIGINT

)

LANGUAGE SQL

AS $$

SELECT

    m.title,

    COUNT(*) AS total_views

FROM movies m

JOIN watch_history w

ON m.movie_id = w.movie_id

GROUP BY

m.movie_id,

m.title

ORDER BY total_views DESC

LIMIT movie_limit;

$$;

-----------------------------------------------------------
-- 3. MOVIES BY GENRE
-----------------------------------------------------------

CREATE OR REPLACE FUNCTION get_movies_by_genre(

    p_genre TEXT

)

RETURNS TABLE(

    movie_title VARCHAR,

    release_year INT

)

LANGUAGE SQL

AS $$

SELECT

m.title,

m.release_year

FROM movies m

JOIN movie_genres mg

ON m.movie_id = mg.movie_id

JOIN genres g

ON mg.genre_id = g.genre_id

WHERE LOWER(g.genre_name)=LOWER(p_genre)

ORDER BY m.title;

$$;

-----------------------------------------------------------
-- 4. MOVIE AVERAGE RATING
-----------------------------------------------------------

CREATE OR REPLACE FUNCTION get_movie_average_rating(

    p_movie_id INT

)

RETURNS NUMERIC

LANGUAGE SQL

AS $$

SELECT

ROUND(AVG(rating),2)

FROM ratings

WHERE movie_id = p_movie_id;

$$;

-----------------------------------------------------------
-- 5. COUNTRY STATISTICS
-----------------------------------------------------------

CREATE OR REPLACE FUNCTION get_country_statistics(

    p_country TEXT

)

RETURNS TABLE(

    total_users BIGINT,

    total_watch_hours NUMERIC

)

LANGUAGE SQL

AS $$

SELECT

COUNT(DISTINCT u.user_id),

ROUND(SUM(w.minutes_watched)/60.0,2)

FROM countries c

JOIN users u

ON c.country_id=u.country_id

LEFT JOIN watch_history w

ON u.user_id=w.user_id

WHERE LOWER(c.country_name)=LOWER(p_country);

$$;

-----------------------------------------------------------
-- 6. PLAN STATISTICS
-----------------------------------------------------------

CREATE OR REPLACE FUNCTION get_plan_statistics(

    p_plan TEXT

)

RETURNS TABLE(

    subscribers BIGINT,

    average_watch_minutes NUMERIC

)

LANGUAGE SQL

AS $$

SELECT

COUNT(DISTINCT u.user_id),

ROUND(AVG(w.minutes_watched),2)

FROM plans p

JOIN users u

ON p.plan_id=u.plan_id

LEFT JOIN watch_history w

ON u.user_id=w.user_id

WHERE LOWER(p.plan_name)=LOWER(p_plan);

$$;

-----------------------------------------------------------
-- 7. USER SUMMARY
-----------------------------------------------------------

CREATE OR REPLACE FUNCTION get_user_summary(

    p_user INT

)

RETURNS TABLE(

    total_movies BIGINT,

    watch_hours NUMERIC,

    average_rating NUMERIC

)

LANGUAGE SQL

AS $$

SELECT

COUNT(DISTINCT w.movie_id),

ROUND(SUM(w.minutes_watched)/60.0,2),

ROUND(AVG(r.rating),2)

FROM watch_history w

LEFT JOIN ratings r

ON w.user_id=r.user_id

AND w.movie_id=r.movie_id

WHERE w.user_id=p_user;

$$;

-----------------------------------------------------------
-- 8. SEARCH MOVIES
-----------------------------------------------------------

CREATE OR REPLACE FUNCTION search_movies(

    keyword TEXT

)

RETURNS TABLE(

    movie_id INT,

    title VARCHAR,

    release_year INT

)

LANGUAGE SQL

AS $$

SELECT

movie_id,

title,

release_year

FROM movies

WHERE LOWER(title)

LIKE '%' || LOWER(keyword) || '%'

ORDER BY title;

$$;

-----------------------------------------------------------
-- SAMPLE EXECUTION
-----------------------------------------------------------

-- SELECT * FROM get_user_watch_history(1);

-- SELECT * FROM get_top_movies(10);

-- SELECT * FROM get_movies_by_genre('Action');

-- SELECT get_movie_average_rating(10);

-- SELECT * FROM get_country_statistics('India');

-- SELECT * FROM get_plan_statistics('Premium');

-- SELECT * FROM get_user_summary(25);

-- SELECT * FROM search_movies('Batman');

