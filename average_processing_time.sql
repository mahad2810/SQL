/*
==========================================================
Title       : Average Processing Time of Machines
Description : 
    This SQL script calculates the average time each machine 
    takes to complete a process in a factory system.

Table Structure :
----------------------------------------------------------
| Column Name   | Type    | Description                  |
|----------------|---------|-----------------------------|
| machine_id     | int     | ID of the machine           |
| process_id     | int     | ID of the process           |
| activity_type  | enum    | 'start' or 'end' activity   |
| timestamp      | float   | Time in seconds             |
----------------------------------------------------------

Logic :
----------------------------------------------------------
1. Each (machine_id, process_id) has one 'start' and one 'end' record.
2. The time taken for each process = end_timestamp - start_timestamp.
3. The average processing time per machine = 
      AVG(end_timestamp - start_timestamp).
4. The result is rounded to 3 decimal places.

Output Columns :
----------------------------------------------------------
| machine_id     | processing_time (float, 3 decimals)   |
----------------------------------------------------------

Example :
----------------------------------------------------------
Machine 0 → ((1.520-0.712) + (4.120-3.140))/2 = 0.894
==========================================================
*/

-- Calculate average processing time for each machine
SELECT 
    machine_id,
    ROUND(AVG(end_time - start_time), 3) AS processing_time
FROM (
    SELECT 
        machine_id,
        process_id,
        MAX(CASE WHEN activity_type = 'start' THEN timestamp END) AS start_time,
        MAX(CASE WHEN activity_type = 'end' THEN timestamp END) AS end_time
    FROM Activity
    GROUP BY machine_id, process_id
) AS t
GROUP BY machine_id;

-- End of File
