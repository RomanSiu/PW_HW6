import sqlite3
import random
from faker import Faker
from datetime import datetime


def create_name(quantity):
    fake = Faker("uk_UA")
    res = []
    for _ in range(quantity):
        p_name = fake.name()
        name_lst = p_name.split()
        name = f"{name_lst[-1]} {name_lst[0][0].upper()}."
        res.append(name)
    return res


def gen_date():
    start_date = datetime(year=2022, month=1, day=1)
    end_date = datetime(year=2023, month=12, day=31)
    start_stmp = start_date.timestamp()
    end_stmp = end_date.timestamp()
    random_stmp = random.randint(int(start_stmp), int(end_stmp))
    date = datetime.fromtimestamp(random_stmp)
    return date.date()


def gen_students(quantity):
    students = []
    students_lst = create_name(quantity)
    for i in range(quantity):
        stud = (i+1, students_lst[i])
        students.append(stud)
    return students


def gen_groups(quantity):
    group_lst = []
    num = 1
    group_num = 1
    for i in range(quantity):
        group = (i+1, group_num)
        group_lst.append(group)
        num += 1
        if num == 18:
            group_num += 1
            num = 1
    return group_lst


def gen_teachers(quantity):
    teachers = []
    teachers_lst = create_name(quantity)
    for i in range(quantity):
        teacher = (i+1, teachers_lst[i])
        teachers.append(teacher)
    return teachers


def gen_marks(quantity):
    data_lst = []
    for i in range(quantity):
        for j in range(20):
            sub = random.randint(1, 8)
            mark = random.randint(2, 5)
            date = gen_date()
            t = (i+1, sub, mark, date)
            data_lst.append(t)
    return data_lst


subjects = [(1, "math", 1), (2, "science", 1), (3, "art", 2), (4, "music", 2), (5, "chemistry", 3), (6, "biology", 3),
            (7, "geography", 4), (8, "language", 5)]

task_students = "INSERT INTO students (student_id, name) VALUES (?, ?)"
task_sg = "INSERT INTO student_groups (student_id, group_id) VALUES (?, ?)"
task_teachers = "INSERT INTO teachers (id, name) VALUES (?, ?)"
task_subjects = "INSERT INTO subjects (id, sub_name, teacher_id) VALUES (?, ?, ?)"
task_marks = "INSERT INTO marks (student_id, sub_id, mark, got_at) VALUES (?, ?, ?, ?)"


def main():
    students = gen_students(50)
    groups = gen_groups(50)
    teachers = gen_teachers(5)
    marks = gen_marks(50)
    with sqlite3.connect('students.db') as con:
        cur = con.cursor()
        cur.executemany(task_students, students)
        cur.executemany(task_sg, groups)
        cur.executemany(task_teachers, teachers)
        cur.executemany(task_subjects, subjects)
        cur.executemany(task_marks, marks)


if __name__ == "__main__":
    main()
