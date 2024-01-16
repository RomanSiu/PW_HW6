SELECT s.name, sub.sub_name
FROM marks AS m
LEFT JOIN students AS s ON s.student_id = m.student_id
LEFT JOIN subjects AS sub ON sub.id = m.sub_id
WHERE m.student_id = 6
GROUP BY sub.sub_name;