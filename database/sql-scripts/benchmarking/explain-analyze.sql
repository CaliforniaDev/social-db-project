/*
** Explain: Build a query that will return the execution plan of a query.
** Explain Analyze: Build a query, run it, and return the execution plan of a query.
** 
** These are for benchmarking purposes.
*/

/*
Query Plan (EXPLAIN ANALYZE Output): 
Hash Join  (cost=8.31..1795.11 rows=11 width=81) (actual time=1.003..19.286 rows=7 loops=1)
  Hash Cond: (comments.user_id = users.id)
  ->  Seq Scan on comments  (cost=0.00..1628.10 rows=60410 width=72) (actual time=0.031..8.530 rows=60410 loops=1)
  ->  Hash  (cost=8.30..8.30 rows=1 width=17) (actual time=0.394..0.396 rows=1 loops=1)
        Buckets: 1024  Batches: 1  Memory Usage: 9kB
        ->  Index Scan using users_username_idx on users  (cost=0.28..8.30 rows=1 width=17) (actual time=0.104..0.107 rows=1 loops=1)
              Index Cond: ((username)::text = 'Alyson14'::text)
Planning Time: 2.091 ms
Execution Time: 19.436 ms
*/ ;

EXPLAIN ANALYZE
  SELECT users.username, comments.contents
  FROM
    users
    JOIN comments ON comments.user_id = users.id
  WHERE users.username = 'Alyson14';

SELECT *
FROM pg_stats
WHERE tablename = 'users';

-- This query will not use the index because process cost is higher than the sequential scan
EXPLAIN
  SELECT *
  FROM likes
  WHERE created_at > '2013-01-01';

-- This query will use the index because process cost is lower than the sequential scan
  EXPLAIN
  SELECT *
  FROM likes
  WHERE created_at < '2013-01-01';

CREATE INDEX likes_created_at_idx ON likes (created_at);
