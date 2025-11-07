/*
===============================================================
File: non_boring_movies.sql
Author: Mahad Iqbal
Date: YYYY-MM-DD
Description:
    SQL script to report all movies from the 'Cinema' table that
    have an odd-numbered ID and a description that is not 'boring'.
    The result is sorted by movie rating in descending order.
===============================================================
Table Schema:
---------------------------------------------------------------
Cinema
+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| id             | int      |  -- Primary Key
| movie          | varchar  |
| description    | varchar  |
| rating         | float    |  -- Range [0,10], two decimal places
---------------------------------------------------------------
*/

-- Select movies with odd-numbered IDs and non-boring descriptions
SELECT *
FROM Cinema
WHERE id % 2 = 1                -- Filter for odd-numbered IDs
  AND description <> 'boring'   -- Exclude boring descriptions
ORDER BY rating DESC;           -- Sort by highest rating first
