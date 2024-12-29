Performance with Postgres

Where Does Postgres Store Data?

The clause below will show us the path to our directory where Postgres is installed and running from

``` sql
SHOW data_directory; 
```

This clause below will show you which folders contain what heap file: 

``` sql
SELECT oid, datname
FROM pg_database;
```

This lists out all the heap files: 

``` sql
SELECT * FROM pg_class;
```