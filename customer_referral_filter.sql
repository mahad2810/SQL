/*
 * Problem: Find Customers Not Referred by Customer ID = 2
 * --------------------------------------------------------
 * Table: Customer
 *
 * +-------------+---------+
 * | Column Name | Type    |
 * +-------------+---------+
 * | id          | int     |
 * | name        | varchar |
 * | referee_id  | int     |
 * +-------------+---------+
 * id is the primary key column for this table.
 *
 * Each row contains:
 *  - id: Unique identifier of the customer
 *  - name: Customer's name
 *  - referee_id: The ID of the customer who referred them (nullable)
 *
 * Task:
 *  - Return the names of customers who are either:
 *      1. Not referred by anyone (referee_id IS NULL), OR
 *      2. Referred by someone whose ID is NOT 2.
 *
 * Output:
 *  +------+
 *  | name |
 *  +------+
 *
 * Example:
 *  Input:
 *  +----+------+------------+
 *  | id | name | referee_id |
 *  +----+------+------------+
 *  | 1  | Will | null       |
 *  | 2  | Jane | null       |
 *  | 3  | Alex | 2          |
 *  | 4  | Bill | null       |
 *  | 5  | Zack | 1          |
 *  | 6  | Mark | 2          |
 *  +----+------+------------+
 *
 *  Output:
 *  +------+
 *  | name |
 *  +------+
 *  | Will |
 *  | Jane |
 *  | Bill |
 *  | Zack |
 *  +------+
 *
 * Explanation:
 *  - Customers referred by ID = 2 (Alex and Mark) are excluded.
 *  - Others are included in the result.
 *
 * Author: Mahad Iqbal
 * Date: October 2025
 */

-- Solution Query
SELECT name
FROM Customer
WHERE referee_id != 2
   OR referee_id IS NULL;
