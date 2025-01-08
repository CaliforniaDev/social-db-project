/*
Most Popular Users
Exercise from video 216:
https://www.udemy.com/course/sql-and-postgresql/learn/lecture/22802781#questions

  Show the most popular users - the users who were tagged the most
*/ ;

-- Solution 1 uses a CTE
WITH
  tags AS (
    SELECT user_id
    FROM caption_tags
    UNION ALL
    SELECT user_id
    FROM photo_tags
  )
SELECT username, COUNT(*) AS tags_count
FROM
  tags
  JOIN users ON tags.user_id = users.id
GROUP BY username
ORDER BY tags_count DESC;

-- Solution 2 uses a subquery
SELECT username, COUNT(*)
FROM
  users
  JOIN (
    SELECT user_id FROM photo_tags
    UNION ALL
    SELECT user_id FROM caption_tags
  ) AS tags
    ON tags.user_id = users.id
GROUP BY users.username
ORDER BY COUNT(*) DESC;

-- Solution 3 uses the created view "tags"

SELECT username, COUNT(*)
FROM
  users
  JOIN tags ON tags.user_id = users.id
GROUP BY username
ORDER BY COUNT(*) DESC;
