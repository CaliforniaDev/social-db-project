/*
  In this lesson, we are creating a view named `tags` that combines 
  the `photo_tags` and `caption_tags` tables. 
  This view simplifies queries by using the `UNION ALL` operator to merge 
  the two tables into a single result set.

  The advantage of this approach is that it avoids potential errors 
  that could arise from maintaining separate views for each table. 
  By combining the tables into a single view, 
  we ensure consistency and simplify data retrieval. 
 * Note that we are preserving the original `id` values from each table.
 
 TODO: Check out the new solution we have using view in `most-popular-users-216.sql` file.
*/

CREATE VIEW tags AS
  (
    SELECT id, created_at, user_id, post_id, 'photo_tags' AS type
    FROM photo_tags
    UNION ALL
    SELECT id, created_at, user_id, post_id, 'caption_tags' AS type
    FROM caption_tags
  );
  SELECT * from tags;

