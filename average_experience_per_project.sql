/*
===================================================================
File: average_experience_per_project.sql
Author: Mahad Iqbal
Date: YYYY-MM-DD
Description:
    SQL script to calculate the average experience (in years)
    of all employees working on each project.

    The result reports:
        project_id  |  average_years (rounded to 2 decimal places)

===================================================================
Table Schemas:
-------------------------------------------------------------------
Project
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| project_id  | int     |  -- Part of Primary Key
| employee_id | int     |  -- Part of Primary Key, Foreign Key to Employee
-------------------------------------------------------------------

Employee
+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| employee_id      | int     |  -- Primary Key
| name             | varchar |
| experience_years | int     |  -- Non-null integer value
-------------------------------------------------------------------
*/

-- Step 1: Join Project and Employee tables using employee_id.
-- Step 2: Group the results by project_id.
-- Step 3: Compute the average of experience_years for each project.
-- Step 4: Round the average to 2 decimal places.

SELECT 
    p.project_id,
    ROUND(AVG(e.experience_years), 2) AS average_years
FROM Project p
JOIN Employee e
    ON p.employee_id = e.employee_id
GROUP BY p.project_id;
