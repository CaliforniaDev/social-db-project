-- This script is used to test the performance of the database
-- EXPLAIN ANALYZE is used to get the query plan and the time taken to execute the query
-- Because we are using indexes in the username column, the query should be fast
-- Downsides of using indexes:
-- 1. Can be large in size because it stores the data from at least one column
-- 2. Slows down the write operations because the index needs to be updated
-- 3. Can be slow if the query is not selective enough

-- Index Types:
-- 1. B-tree: Default index type in PostgreSQL
-- 2. Hash: Used for equality comparisons
-- 3. GiST: Generalized Search Tree
-- 4. GIN: Generalized Inverted Index
-- 5. BRIN: Block Range Index
-- 6. SP-GiST: Space-Partitioned Generalized Search Tree

-- Remember: 
-- Postgres automatically creates an index for primary keys, and unique constraints
-- Automatically created indexes do not show up in the indexes list



-- With index: 0.075ms  17% faster
EXPLAIN ANALYZE SELECT * 
FROM users
WHERE username = 'Emil30';

-- Without index: 1.249ms
EXPLAIN ANALYZE SELECT * 
FROM users
WHERE username = 'Emil30';

-- Show the size of the users table with the index
SELECT pg_size_pretty(pg_relation_size('users'));

-- This query will shows all the indexes in the database including the automatically created indexes
-- relname: Name of the index
-- relkind: Type of the index
SELECT relname, relkind
FROM pg_class
WHERE relkind = 'i';
