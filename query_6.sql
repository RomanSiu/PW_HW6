SELECT sg.group_id AS "group №", s.name
FROM student_groups AS sg
LEFT JOIN students AS s ON s.student_id = sg.student_id
WHERE sg.group_id = 1;