SELECT t.name, sub.sub_name
FROM teachers AS t
LEFT JOIN subjects AS sub ON sub.teacher_id = t.id;