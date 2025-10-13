/*
 * Problem: Find Low Fat and Recyclable Products
 * ----------------------------------------------
 * Table: Products
 *
 * +-------------+---------+
 * | Column Name | Type    |
 * +-------------+---------+
 * | product_id  | int     |
 * | low_fats    | enum('Y','N') |
 * | recyclable  | enum('Y','N') |
 * +-------------+---------+
 * product_id is the primary key.
 *
 * Task:
 *  - Find the IDs of products that are BOTH:
 *      1. Low fat  (low_fats = 'Y')
 *      2. Recyclable (recyclable = 'Y')
 *
 * Output:
 *  +-------------+
 *  | product_id  |
 *  +-------------+
 *
 * Example:
 *  Input:
 *  | product_id | low_fats | recyclable |
 *  |-------------|----------|------------|
 *  | 0           | Y        | N          |
 *  | 1           | Y        | Y          |
 *  | 2           | N        | Y          |
 *  | 3           | Y        | Y          |
 *  | 4           | N        | N          |
 *
 *  Output:
 *  | product_id |
 *  |-------------|
 *  | 1           |
 *  | 3           |
 *
 * Explanation:
 *  Products 1 and 3 satisfy both conditions.
 *
 * Author: Mahad Iqbal
 * Date: October 2025
 */

-- Solution Query
SELECT product_id
FROM Products
WHERE low_fats = 'Y'
  AND recyclable = 'Y';
