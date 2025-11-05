-- ============================================================
-- File: confirmation_rate.sql
-- Author: Mahad Iqbal
-- Description:
--   This SQL script calculates the confirmation rate for each user
--   based on their signup and confirmation data.
--
-- Tables used:
--   1. Signups(user_id, time_stamp)
--   2. Confirmations(user_id, time_stamp, action)
--
-- Definition:
--   The confirmation rate of a user is defined as:
--     (Number of 'confirmed' messages) / (Total number of confirmation requests)
--
-- Notes:
--   - Users who never requested a confirmation message will have a rate of 0.
--   - The result is rounded to two decimal places.
--   - Output columns:
--       user_id | confirmation_rate
--
-- Example:
--   Input:
--     user_id | action
--     ----------------
--     2       | confirmed
--     2       | timeout
--     3       | timeout
--
--   Output:
--     user_id | confirmation_rate
--     ----------------------------
--     2       | 0.50
--     3       | 0.00
--
-- ============================================================

SELECT 
    s.user_id,
    ROUND(
        IFNULL(SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) / COUNT(c.user_id), 0)
    , 2) AS confirmation_rate
FROM 
    Signups s
LEFT JOIN 
    Confirmations c
ON 
    s.user_id = c.user_id
GROUP BY 
    s.user_id;

-- ============================================================
-- End of File
-- ============================================================
