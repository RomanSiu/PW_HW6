SELECT sg.group_id AS "group №", sub.sub_name AS "subject",
s.name, m.mark
FROM marks AS m
LEFT JOIN students AS s ON s.student_id = m.student_id
LEFT JOIN student_groups AS sg ON sg.student_id = s.student_id
LEFT JOIN subjects AS sub ON sub.id = m.sub_id
WHERE sg.group_id = 2 AND sub.id = 1;