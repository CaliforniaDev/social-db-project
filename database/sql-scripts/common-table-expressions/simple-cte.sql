/*
EXERCISE 1:
Show the username of users who were tagged in a photo or caption
before January 7, 2010. 
Also show the date they were tagged.
*/ ;

SELECT users.username, tags.created_at
FROM
  users
  JOIN (
    SELECT user_id, created_at FROM caption_tags
    UNION ALL
    SELECT user_id, created_at FROM photo_tags
  ) AS tags
    ON tags.user_id = users.id
WHERE tags.created_at < '2010-01-07';

-- The query above can be rewritten using a common table expression (CTE)
WITH
  tags AS (
    SELECT user_id, created_at FROM caption_tags
    UNION ALL
    SELECT user_id, created_at FROM photo_tags
  )
SELECT users.username, tags.created_at
FROM
  users
  JOIN tags ON tags.user_id = users.id
WHERE tags.created_at < '2010-01-07';
