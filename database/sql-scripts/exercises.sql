

-- Show the users who have the Top 3 highst ID numbers.
SELECT *
FROM users
ORDER BY id DESC
LIMIT 3;

-- Show the username of user ID 200 abd the caption of all the posts that user has made.
SELECT users.username, posts.caption
FROM users
JOIN posts
ON users.id = posts.user_id
WHERE users.id = 200;

-- Show number of liker per user.
SELECT users.username, COUNT(*)
FROM users
JOIN likes
ON users.id = likes.user_id
GROUP BY users.id;

