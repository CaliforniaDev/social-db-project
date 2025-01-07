/*
  Example of a recursive common table expression (CTE) in SQL.
  A recursive CTE is a CTE that references itself in the query definition.
  This example demonstrates a countdown from 3 to 1 using a recursive CTE.
*/

WITH RECURSIVE
  booty(val) AS (
    SELECT 3 AS val -- initial, non-recursive query
    UNION
    SELECT val - 1 FROM booty WHERE val > 1 -- recursive query
  )
SELECT *
FROM booty;
