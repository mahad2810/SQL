/*
  Title: Find Dates with Higher Temperature than Previous Day
  Author: Mahad Iqbal
  Description:
    This query finds all dates (by id) where the temperature
    was higher compared to the previous day's temperature.

  Table Structure:
    Table: Weather
    +---------------+---------+
    | Column Name   | Type    |
    +---------------+---------+
    | id            | int     |  -- Unique ID for each record
    | recordDate    | date    |  -- The date of the temperature record
    | temperature   | int     |  -- Temperature on that date
    +---------------+---------+

  Example:
    Input:
      +----+------------+-------------+
      | id | recordDate | temperature |
      +----+------------+-------------+
      | 1  | 2015-01-01 | 10          |
      | 2  | 2015-01-02 | 25          |
      | 3  | 2015-01-03 | 20          |
      | 4  | 2015-01-04 | 30          |
      +----+------------+-------------+

    Output:
      +----+
      | id |
      +----+
      | 2  |
      | 4  |
      +----+

  SQL Dialect: MySQL
*/

-- Select the IDs of all records where today's temperature
-- is higher than yesterday's temperature.
SELECT w1.id
FROM Weather w1
JOIN Weather w2
  ON DATEDIFF(w1.recordDate, w2.recordDate) = 1  -- Match consecutive days
WHERE w1.temperature > w2.temperature;           -- Compare temperatures
