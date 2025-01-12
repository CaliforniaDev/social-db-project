/*
  Materialized Views Vs Views
  
  Materialized Views: 
  - Gets executed only at specific times
  - Results are stored in the database
  - We can retrieve the results from the database without executing the query again

  - We use view anytime we have an expensive query that we want to run multiple times

  Views:
  - Gets executed every time it is called
*/ ;
/*
* Exercise 1: 
* For each week, show the number of likes that posts and comments received.
* Use the post and comment create_at date, not when the like was received.
week 
*/ ;

SELECT
  -- DATE_TRUNC truncates the date to the specified interval
  DATE_TRUNC('week', COALESCE(posts.created_at, comments.created_at)) AS week, -- COALESCE returns the first non-null value
  COUNT(posts.id) AS num_post, -- COUNT returns the number of non-null values
  COUNT(comments.id) AS num_comments -- COUNT returns the number of non-null values
FROM
  likes
  LEFT JOIN posts ON likes.post_id = posts.id
  LEFT JOIN comments ON likes.comment_id = comments.id
GROUP BY week
ORDER BY week;
