/*
------------------------------------------------------------
File: contest_registration_percentage.sql
Author: Mahad Iqbal
Date: 2025-11-10
Description:
    This SQL script calculates the percentage of users 
    registered in each contest. The percentage is rounded 
    to two decimal places and the results are ordered 
    by percentage (descending) and contest_id (ascending).
------------------------------------------------------------

Tables Used:
1. Users
   +-------------+---------+
   | Column Name | Type    |
   +-------------+---------+
   | user_id     | int     |
   | user_name   | varchar |
   +-------------+---------+
   Primary Key: user_id

2. Register
   +-------------+---------+
   | Column Name | Type    |
   +-------------+---------+
   | contest_id  | int     |
   | user_id     | int     |
   +-------------+---------+
   Primary Key: (contest_id, user_id)

Goal:
    Find the percentage of users registered in each contest.
    Round to 2 decimal places.

Output Format:
    +------------+------------+
    | contest_id | percentage |
    +------------+------------+
------------------------------------------------------------
*/

-- SQL Query
SELECT 
    r.contest_id,
    ROUND(COUNT(DISTINCT r.user_id) * 100.0 / (SELECT COUNT(*) FROM Users), 2) AS percentage
FROM Register r
GROUP BY r.contest_id
ORDER BY percentage DESC, r.contest_id ASC;
