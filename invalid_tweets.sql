/*
 * Problem: Find Invalid Tweets
 * -----------------------------
 * Table: Tweets
 *
 * +----------------+---------+
 * | Column Name    | Type    |
 * +----------------+---------+
 * | tweet_id       | int     |
 * | content        | varchar |
 * +----------------+---------+
 * tweet_id is the primary key (unique).
 * content consists of alphanumeric characters, '!', or spaces.
 *
 * Task:
 * -----
 * A tweet is considered INVALID if the number of characters
 * in its content is strictly greater than 15.
 *
 * Return the IDs of all invalid tweets.
 *
 * Output Format:
 * +----------+
 * | tweet_id |
 * +----------+
 *
 * Example:
 * --------
 * Input:
 * +----------+-----------------------------------+
 * | tweet_id | content                           |
 * +----------+-----------------------------------+
 * | 1        | Let us Code                       |
 * | 2        | More than fifteen chars are here! |
 * +----------+-----------------------------------+
 *
 * Output:
 * +----------+
 * | tweet_id |
 * +----------+
 * | 2        |
 * +----------+
 *
 * Explanation:
 * - Tweet 1 has 11 characters → valid.
 * - Tweet 2 has 33 characters → invalid.
 *
 * Author: Mahad Iqbal
 * Date: October 2025
 */

-- Solution Query
SELECT tweet_id
FROM Tweets
WHERE CHAR_LENGTH(content) > 15;
