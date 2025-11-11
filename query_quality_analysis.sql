/*
  File: query_quality_analysis.sql
  Author: Mahad Iqbal
  Description:
    SQL script to calculate the quality and poor query percentage
    for each query_name from the Queries table.

  Table Schema:
    Queries(
      query_name VARCHAR,
      result VARCHAR,
      position INT,   -- range 1 to 500
      rating INT      -- range 1 to 5
    )

  Definitions:
    - Query Quality = Average of (rating / position)
    - Poor Query Percentage = (Number of queries with rating < 3) * 100 / Total queries

  Example:
    Input:
      | query_name | result            | position | rating |
      |-------------|-------------------|----------|--------|
      | Dog         | Golden Retriever  | 1        | 5      |
      | Dog         | German Shepherd   | 2        | 5      |
      | Dog         | Mule              | 200      | 1      |
      | Cat         | Shirazi           | 5        | 2      |
      | Cat         | Siamese           | 3        | 3      |
      | Cat         | Sphynx            | 7        | 4      |

    Output:
      | query_name | quality | poor_query_percentage |
      |-------------|----------|----------------------|
      | Dog         | 2.50     | 33.33               |
      | Cat         | 0.66     | 33.33               |
*/

-- SQL Query to calculate quality and poor_query_percentage
SELECT
    query_name,
    ROUND(AVG(rating * 1.0 / position), 2) AS quality,
    ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS poor_query_percentage
FROM
    Queries
GROUP BY
    query_name;
