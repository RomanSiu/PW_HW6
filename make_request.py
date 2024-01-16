import sqlite3
from sys import argv


def make_request(num):
    with open(f'query_{num}.sql', 'r') as f:
        sql = f.read()

    with sqlite3.connect('students.db') as con:
        cur = con.cursor()
        res = cur.execute(sql)
        return res.fetchall()


if __name__ == "__main__":
    args = argv[1:]
    print(make_request(int(args[0])))