SELECT t.name, sub.sub_name AS "subject", AVG(m.mark) AS "avg mark"
FROM marks AS m
LEFT JOIN subjects AS sub ON sub.id = m.sub_id
LEFT JOIN teachers AS t ON sub.teacher_id = t.id
GROUP BY m.sub_id;