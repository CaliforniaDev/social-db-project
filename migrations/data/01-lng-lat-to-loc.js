/**
 * The purpose of this migration is to update/copy the loc column in the posts table from the existing lng and lat columns.
 */

const pg = require("pg");

const pool = new pg.Pool({
  host: "localhost",
  port: 5432,
  database: "socialnetwork",
  user: "leodaniels",
  password: "",
});

pool
  .query(
    `
  UPDATE posts
  SET loc = POINT(lng, lat)
  WHERE loc IS NULL;
`,
  )
  .then(() => {
    console.log("Update complete");
    pool.end();
  })
  .catch((err) => console.error(err));
