# Social Media Comments and Hashtags Database

This project is a PostgreSQL database designed to handle core functionalities of a social media platform, including user-generated comments and hashtags, inspired by Instagram. The database structure supports efficient storage, retrieval, and analysis of data, incorporating key features like:

- **User Profiles:** Stores user information for identifying and managing platform participants.
- **Comments on Posts:** Enables users to interact by leaving comments on posts.
- **Hashtag Associations:** Connects hashtags to posts and comments for better discoverability.
- **Relational Connections:** Establishes links between posts, users, and tags to maintain data integrity.

### Objectives
This project is part of an online course to master:
- Database design principles, including schema normalization.
- Query optimization and indexing strategies.
- Relational database management with PostgreSQL.

### Purpose
The project demonstrates best practices in SQL and PostgreSQL, preparing the foundation for scalable social media applications.

---


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