DROP TABLE IF EXISTS students;
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(30)
);

DROP TABLE IF EXISTS student_groups;
CREATE TABLE student_groups (
    student_id INT PRIMARY KEY,
    group_id INT,
    FOREIGN KEY (student_id) REFERENCES students (student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

DROP TABLE IF EXISTS marks;
CREATE TABLE marks (
    student_id INT,
    sub_id INT,
    mark INT,
    got_at DATE,
    FOREIGN KEY (student_id) REFERENCES students (student_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (sub_id) REFERENCES subjects (id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

DROP TABLE IF EXISTS subjects;
CREATE TABLE subjects (
    id INT PRIMARY KEY,
    sub_name VARCHAR(20),
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES teachers (id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

DROP TABLE IF EXISTS teachers;
CREATE TABLE teachers (
    id INT PRIMARY KEY,
    name VARCHAR(30)
);