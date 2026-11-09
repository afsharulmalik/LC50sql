SELECT
    stu.student_id,
    stu.student_name,
    sub.subject_name,
    COUNT(edu.subject_name) AS attended_exams
FROM Students AS stu
CROSS JOIN Subjects AS sub
LEFT JOIN Examinations AS edu
    ON stu.student_id = edu.student_id
    AND sub.subject_name = edu.subject_name
GROUP BY stu.student_id, stu.student_name, sub.subject_name
ORDER BY stu.student_id, sub.subject_name;