SELECT s.name AS "student name", t.name AS "teacher name", sub.sub_name
FROM marks AS m
LEFT JOIN students AS s ON s.student_id = m.student_id
LEFT JOIN subjects AS sub ON sub.id = m.sub_id
LEFT JOIN teachers AS t ON t.id = sub.teacher_id
WHERE s.student_id = 1 AND t.id = 3
GROUP BY sub.sub_name;