/*
-------------------------------------------------------------
  SQL Script: Managers with At Least Five Direct Reports
  Description:
    This query identifies all employees who are managers
    with 5 or more direct reports in the organization.

  Table Schema:
    Employee (
      id INT PRIMARY KEY,
      name VARCHAR,
      department VARCHAR,
      managerId INT
    )

  Notes:
    - 'managerId' refers to the 'id' of another employee.
    - If 'managerId' is NULL, the employee has no manager.
    - A manager can have multiple direct reports (employees
      whose managerId matches the manager's id).

  Example:
    Input:
      +-----+-------+------------+-----------+
      | id  | name  | department | managerId |
      +-----+-------+------------+-----------+
      | 101 | John  | A          | null      |
      | 102 | Dan   | A          | 101       |
      | 103 | James | A          | 101       |
      | 104 | Amy   | A          | 101       |
      | 105 | Anne  | A          | 101       |
      | 106 | Ron   | B          | 101       |
      +-----+-------+------------+-----------+

    Output:
      +------+
      | name |
      +------+
      | John |
      +------+
-------------------------------------------------------------
*/

-- Option 1: Using JOIN
SELECT e.name
FROM Employee e
JOIN Employee m
  ON e.id = m.managerId
GROUP BY e.id, e.name
HAVING COUNT(m.id) >= 5;


-- Option 2: Using Subquery (more readable)
-- SELECT name
-- FROM Employee
-- WHERE id IN (
--     SELECT managerId
--     FROM Employee
--     WHERE managerId IS NOT NULL
--     GROUP BY managerId
--     HAVING COUNT(*) >= 5
-- );
