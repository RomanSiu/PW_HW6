SELECT sg.group_id, sub.sub_name, AVG(m.mark) as "avg mark"
FROM marks AS m
LEFT JOIN students AS s ON s.student_id = m.student_id
LEFT JOIN student_groups AS sg ON sg.student_id = s.student_id
LEFT JOIN subjects AS sub ON sub.id = m.sub_id
WHERE sub_id = 3
GROUP BY sg.group_id;
