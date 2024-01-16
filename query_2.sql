SELECT s.name, sub.sub_name, AVG(m.mark)
FROM marks AS m
LEFT JOIN students AS s ON m.student_id = s.student_id
LEFT JOIN subjects AS sub ON sub.id = m.sub_id
WHERE m.sub_id = 1
GROUP BY m.student_id
ORDER BY AVG(m.mark) DESC
LIMIT 1;
