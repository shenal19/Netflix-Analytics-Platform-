--Query 65 — Execution Plan Before Index
EXPLAIN ANALYZE

SELECT *
FROM watch_history
WHERE user_id = 100;

--Query 66 — Create Index
CREATE INDEX idx_watch_history_user
ON watch_history(user_id);

--Query 67 — Composite Index
SELECT *
FROM watch_history
WHERE user_id = 100
AND movie_id = 250;

EXPLAIN ANALYZE

SELECT *
FROM watch_history
WHERE user_id = 100
AND movie_id = 250;

--68 optmize order by
EXPLAIN ANALYZE

SELECT *
FROM watch_history
ORDER BY watch_date DESC
LIMIT 20;

CREATE INDEX idx_watch_date_desc
ON watch_history(watch_date DESC);

--69 optimize group by 
EXPLAIN ANALYZE

SELECT
movie_id,
COUNT(*)
FROM watch_history
GROUP BY movie_id;

--70
--optimize join
EXPLAIN ANALYZE
SELECT
m.title,
COUNT(*)
FROM movies m
JOIN watch_history w
ON m.movie_id = w.movie_id
GROUP BY m.title;


CREATE INDEX idx_movies_movieid
ON movies(movie_id);

--71 Find Missing Indexes
SELECT
schemaname,
tablename,
indexname
FROM pg_indexes
WHERE schemaname='public'
ORDER BY tablename;

--72  Database Size
SELECT
pg_size_pretty(pg_database_size(current_database()));
 
--73  Largest Tables
SELECT
relname AS table_name,
pg_size_pretty(pg_total_relation_size(relid)) AS size
FROM pg_catalog.pg_statio_user_tables
ORDER BY pg_total_relation_size(relid) DESC;

--74 table Statistics
SELECT
relname,
n_live_tup
FROM pg_stat_user_tables
ORDER BY n_live_tup DESC;

--75 index usage 
SELECT
relname AS table_name,
idx_scan
FROM pg_stat_user_tables
ORDER BY idx_scan DESC;

