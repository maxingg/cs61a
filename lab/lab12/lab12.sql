.read fa17data.sql
.read sp18data.sql

-- Q2
CREATE TABLE obedience AS
  SELECT seven, denero from students;

-- Q3
CREATE TABLE smallest_int AS
  SELECT time, smallest from students where smallest > 15 order by smallest limit 20;

-- Q4
CREATE TABLE matchmaker AS
  SELECT s1.pet, s1.song, s1.color, s2.color from students as s1, students as s2 where s1.pet = s2.pet and s1.song = s2.song and s1.time < s2.time;
