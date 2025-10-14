/*
 * Problem: Authors Who Viewed Their Own Articles
 * ----------------------------------------------
 * Table: Views
 *
 * +---------------+---------+
 * | Column Name   | Type    |
 * +---------------+---------+
 * | article_id    | int     |
 * | author_id     | int     |
 * | viewer_id     | int     |
 * | view_date     | date    |
 * +---------------+---------+
 *
 * Notes:
 *  - There is no primary key; duplicates may exist.
 *  - Each row records that a viewer viewed an article written by an author on a specific date.
 *  - If author_id = viewer_id, it means the author viewed their own article.
 *
 * Task:
 * -----
 * Find all authors who have viewed **at least one of their own articles**.
 * Return their IDs, sorted in ascending order.
 *
 * Output Format:
 * +------+
 * | id   |
 * +------+
 *
 * Example:
 * --------
 * Input:
 * +------------+-----------+-----------+------------+
 * | article_id | author_id | viewer_id | view_date  |
 * +------------+-----------+-----------+------------+
 * | 1          | 3         | 5         | 2019-08-01 |
 * | 1          | 3         | 6         | 2019-08-02 |
 * | 2          | 7         | 7         | 2019-08-01 |
 * | 2          | 7         | 6         | 2019-08-02 |
 * | 4          | 7         | 1         | 2019-07-22 |
 * | 3          | 4         | 4         | 2019-07-21 |
 * | 3          | 4         | 4         | 2019-07-21 |
 * +------------+-----------+-----------+------------+
 *
 * Output:
 * +------+
 * | id   |
 * +------+
 * | 4    |
 * | 7    |
 * +------+
 *
 * Explanation:
 * - Author 4 viewed their own article (viewer_id = 4)
 * - Author 7 viewed their own article (viewer_id = 7)
 * - Both appear only once in the output, even if multiple self-views exist.
 *
 * Author: Mahad Iqbal
 * Date: October 2025
 */

-- Solution Query
SELECT author_id AS id
FROM Views
WHERE author_id = viewer_id
GROUP BY id
ORDER BY id ASC;
