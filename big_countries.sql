/*
 * Problem: Find Big Countries
 * ----------------------------
 * Table: World
 *
 * +-------------+---------+
 * | Column Name | Type    |
 * +-------------+---------+
 * | name        | varchar |
 * | continent   | varchar |
 * | area        | int     |
 * | population  | int     |
 * | gdp         | bigint  |
 * +-------------+---------+
 * name is the primary key column for this table.
 *
 * Each row provides details of a country — including its
 * name, continent, area (in km²), population, and GDP.
 *
 * Task:
 * -----
 * Find the countries that are considered "big".
 * A country is big if:
 *  1. Its area is at least 3,000,000 km², OR
 *  2. Its population is at least 25,000,000.
 *
 * Return the country's name, population, and area.
 *
 * Example:
 * --------
 * Input:
 * +-------------+-----------+---------+------------+--------------+
 * | name        | continent | area    | population | gdp          |
 * +-------------+-----------+---------+------------+--------------+
 * | Afghanistan | Asia      | 652230  | 25500100   | 20343000000  |
 * | Albania     | Europe    | 28748   | 2831741    | 12960000000  |
 * | Algeria     | Africa    | 2381741 | 37100000   | 188681000000 |
 * | Andorra     | Europe    | 468     | 78115      | 3712000000   |
 * | Angola      | Africa    | 1246700 | 20609294   | 100990000000 |
 * +-------------+-----------+---------+------------+--------------+
 *
 * Output:
 * +-------------+------------+---------+
 * | name        | population | area    |
 * +-------------+------------+---------+
 * | Afghanistan | 25500100   | 652230  |
 * | Algeria     | 37100000   | 2381741 |
 * +-------------+------------+---------+
 *
 * Explanation:
 *  - Afghanistan qualifies because population >= 25,000,000
 *  - Algeria qualifies because area >= 3,000,000
 *
 * Author: Mahad Iqbal
 * Date: October 2025
 */

-- Solution Query
SELECT name, population, area
FROM World
WHERE area >= 3000000
   OR population >= 25000000;
