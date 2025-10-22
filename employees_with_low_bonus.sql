-- ============================================================
-- Title: Employees with Bonus Less Than 1000
-- Description:
--   This SQL query retrieves the name and bonus amount of each
--   employee who has a bonus less than 1000 or no bonus assigned.
-- 
-- Tables Used:
--   1. Employee (empId, name, supervisor, salary)
--   2. Bonus (empId, bonus)
--
-- Logic:
--   - Use a LEFT OUTER JOIN to include all employees even if
--     they don’t have a corresponding bonus record.
--   - Filter the result to include only those employees with
--     bonus < 1000 or no bonus at all (NULL).
--
-- Example Output:
--   +------+-------+
--   | name | bonus |
--   +------+-------+
--   | Brad | null  |
--   | John | null  |
--   | Dan  | 500   |
--   +------+-------+
--
-- Author: Mahad Iqbal
-- Date: October 22, 2025
-- ============================================================

SELECT 
    Employee.name,
    Bonus.bonus
FROM 
    Employee
LEFT OUTER JOIN 
    Bonus 
ON 
    Employee.empId = Bonus.empId
WHERE 
    Bonus.bonus < 1000 
    OR Bonus.bonus IS NULL;
