/*
  Materialized Views Vs Views
  
  Materialized Views: 
  - Gets executed only at specific times
  - Results are stored in the database
  - We can retrieve the results from the database without executing the query again
  - If data changes, we need to refresh the materialized view

  - We use view anytime we have an expensive query that we want to run multiple times

  Views:
  - Gets executed every time it is called
*/ ;
/*
* Exercise 1: 
* For each week, show the number of likes that posts and comments received.
* Use the post and comment create_at date, not when the like was received.
*/ ;

CREATE MATERIALIZED VIEW weekly_likes AS
  (
    SELECT
      -- DATE_TRUNC truncates the date to the specified interval
      DATE_TRUNC(
        'week',
        COALESCE(posts.created_at, comments.created_at) -- COALESCE returns the first non-null value
      ) AS week,
      COUNT(posts.id) AS num_likes_for_posts, -- COUNT returns the number of non-null values
      COUNT(comments.id) AS num_likes_for_comments -- COUNT returns the number of non-null values
    FROM
      likes
      LEFT JOIN posts ON likes.post_id = posts.id
      LEFT JOIN comments ON likes.comment_id = comments.id
    GROUP BY week
    ORDER BY week
  ) WITH DATA; -- WITH DATA populates the materialized view with the current data

SELECT * FROM weekly_likes;

-- DELETE FROM posts
-- WHERE created_at < '2010-02-01';

REFRESH MATERIALIZED VIEW weekly_likes; -- REFRESH updates the materialized view with the current data