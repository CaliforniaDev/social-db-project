/**
 * Below is your DATABASE_URL Environment variable:
 * * DATABASE_URL=postgres://<username>:<password>@<host>:<port>/<database>
 * 
 * In the terminal, your write out the Environment variable, then
 * write out the command 'run migrate up' to apply the 'upgrade' function
 * or 'run migrate down' to revert the 'downgrade' function.
 */


/**
 * @type {import('node-pg-migrate').ColumnDefinitions | undefined}
 */
exports.shorthands = undefined;

/**
 * @param pgm {import('node-pg-migrate').MigrationBuilder}
 * @param run {() => void | undefined}
 * @returns {Promise<void> | void}
 */
exports.up = (pgm) => {
  pgm.sql(`
    CREATE TABLE comments (
      id SERIAL PRIMARY KEY,
      created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
      updated_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
      contents VARCHAR(240) NOT NULL
    );
  `);
};

/**
 * @param pgm {import('node-pg-migrate').MigrationBuilder}
 * @param run {() => void | undefined}
 * @returns {Promise<void> | void}
 */
exports.down = (pgm) => {
  pgm.sql(`
    DROP TABLE comments
  `);
};

