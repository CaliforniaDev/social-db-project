CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  balance INTEGER NOT NULL DEFAULT 0
);
INSERT INTO accounts (name, balance)
VALUES
  ('Gia', 100),
  ('Alyson', 100);
