BEGIN;

UPDATE accounts
SET balance = balance - 50
WHERE name = 'Alyson';


SELECT * FROM accounts;


COMMIT;
