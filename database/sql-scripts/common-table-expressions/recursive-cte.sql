/*
  Example of a recursive common table expression (CTE) in SQL.
  A recursive CTE is a CTE that references itself in the query definition.
  This example demonstrates a countdown from 3 to 1 using a recursive CTE.
*/ ;

WITH RECURSIVE
  countdown(val) AS (
    SELECT 3 AS val -- initial, non-recursive query
    UNION
    SELECT val - 1
    FROM countdown
    WHERE val > 1 -- recursive query
  )
SELECT *
FROM countdown;
/*
  Practical example of a recursive CTE in SQL.

  Lets say in aur instagram app. A user is following The Rock, and Kevin Hart. 
  The Rock is following Justin Bieber.
  Kevin Hart is following Jennifer Lopez and Snoop Dogg.

  We want instagram to suggest Justin Bieber, Jennifer Lopez and Snoop Dogg to the user.

* User
* ├── follows The Rock
* │    └── follows Justin Bieber
* └── follows Kevin Hart
    * ├── follows Jennifer Lopez
    * └── follows Snoop Dogg

     Then lets say the user exhausted the choices by scrolling further down the list.
     Now we want to suggest the other users the Justin Bieber, Jennifer Lopez and Snoop Dogg are following.

     * Justin Bieber
      └── follows Miley Cyrus

     * Jennifer Lopez
     * └── follows Justin Timberlake

     * Snoop Dogg
     * └── follows Selena Gomez      

Typically, in the real world, the data would form more of a graph than a tree, but this example is simplified for demonstration purposes.
*/ ;

WITH RECURSIVE
  suggestions(leader_id, follower_id, depth) AS (
    SELECT leader_id, follower_id, 1 AS depth -- select the user's direct followers
    FROM followers
    WHERE follower_id = 1000 -- initial user id
    UNION
    SELECT followers.leader_id, followers.follower_id, depth + 1 -- select columns from the joined table and increment the depth
    FROM
      followers
      JOIN suggestions ON suggestions.leader_id = followers.follower_id -- match the leaders of the working set with who they follow from the followers table and  join row with the suggestions table
    WHERE depth < 3
  )
SELECT DISTINCT users.id, users.username -- select the users who are not direct followers
FROM
  suggestions
  JOIN users ON users.id = suggestions.leader_id
WHERE depth > 1 
LIMIT 30;
