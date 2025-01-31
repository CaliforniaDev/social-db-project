/*
  This view will return the 10 most recent posts.
*/

CREATE VIEW recent_posts AS
  (
    SELECT *
    FROM posts
    ORDER BY created_at DESC
    LIMIT 10
  );

SELECT username
FROM
  recent_posts
  JOIN users ON users.id = recent_posts.user_id;
