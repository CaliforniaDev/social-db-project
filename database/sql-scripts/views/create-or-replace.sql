/* Create or replace view for recent posts */

CREATE OR REPLACE VIEW recent_posts AS (
  SELECT *
  FROM posts
  ORDER BY created_at DESC
  LIMIT 15 -- Changed from 10 to 15
);

-- This is how we drop a view
DROP VIEW recent_posts;