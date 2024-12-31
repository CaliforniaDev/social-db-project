-- This script is used to test the performance of the database
-- EXPLAIN ANALYZE is used to get the query plan and the time taken to execute the query
-- Because we are using indexes in the username column, the query should be fast


-- With index: 0.075ms  17% faster
EXPLAIN ANALYZE SELECT * 
FROM users
WHERE username = 'Emil30';

-- Without index: 1.249ms
EXPLAIN ANALYZE SELECT * 
FROM users
WHERE username = 'Emil30';
