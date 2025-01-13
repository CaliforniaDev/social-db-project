/*
Transactions in SQL are a sequence of one or more SQL operations that are executed as a single unit of work. 
A transaction ensures that either all operations within the transaction are completed successfully, 
or none of them are. This is crucial for maintaining the integrity and consistency of the database.

Key properties of transactions are often referred to as ACID properties:
- Atomicity: Ensures that all operations within the transaction are completed; if not, the transaction is aborted.
- Consistency: Ensures that the database remains in a consistent state before and after the transaction.
- Isolation: Ensures that transactions are isolated from each other until they are completed.
- Durability: Ensures that the results of a transaction are permanently recorded in the database.

A ROLLBACK is a command used to undo transactions that have not yet been committed to the database. 
When a ROLLBACK is issued, all changes made by the transaction are undone, and the database is returned 
to its previous state before the transaction began. This is useful in scenarios where an error occurs 
during the transaction, and you need to revert the database to its original state to maintain data integrity.

Example usage:
BEGIN TRANSACTION;
-- SQL operations here
IF error_condition THEN
  ROLLBACK;
ELSE
  COMMIT;
END IF;
*/ ;

BEGIN;

UPDATE accounts
SET balance = balance - 50
WHERE name = 'Alyson';


SELECT * FROM accounts;


COMMIT;
