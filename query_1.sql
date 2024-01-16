SELECT s.name, AVG(m.mark)
FROM marks AS m
LEFT JOIN students AS s ON m.student_id = s.student_id
GROUP BY m.student_id
ORDER BY AVG(m.mark) DESC
LIMIT 5;