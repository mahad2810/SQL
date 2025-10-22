/*
  Filename: student_exam_attendance.sql
  Description: 
    This SQL script retrieves the total number of exams attended by each student 
    for every subject. It ensures that all combinations of students and subjects 
    are included, even if a student has not attended any exams for a subject.

  Tables Used:
    1. Students(student_id, student_name)
    2. Subjects(subject_name)
    3. Examinations(student_id, subject_name)

  Expected Output Columns:
    - student_id
    - student_name
    - subject_name
    - attended_exams

  Example:
    Alice attended Math 3 times, Physics 2 times, and Programming once.
    Alex did not attend any exams, so all his counts are zero.
*/

-- Select each student and every subject combination
SELECT 
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM Students s
-- Create all possible student-subject pairs
CROSS JOIN Subjects sub
-- Join exam records if they exist
LEFT JOIN Examinations e
    ON s.student_id = e.student_id
    AND sub.subject_name = e.subject_name
-- Group by each unique student-subject pair
GROUP BY 
    s.student_id, 
    s.student_name, 
    sub.subject_name
-- Sort results by student ID and subject
ORDER BY 
    s.student_id, 
    sub.subject_name;
