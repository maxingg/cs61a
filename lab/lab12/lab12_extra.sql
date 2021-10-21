.read lab12.sql

-- Q5
CREATE TABLE greatstudents AS
  SELECT s1.date, s2.color, s1.pet, s2.number, s1.number from fa17students as s1, students as s2
  where s1.date = s2.date and s1.color = s2.color and s1.pet = s2.pet; 
-- Q6
CREATE TABLE sevens AS
  SELECT s.seven from students as s, checkboxes as c where s.time = c.time and s.number = 7 and c."7" = "True";

-- Q7
CREATE TABLE fa17favnum AS
  SELECT number, count(*) as ct from fa17students group by number order by ct desc limit 1;


CREATE TABLE fa17favpets AS
  SELECT pet, count(*) as ct from fa17students group by pet order by ct desc limit 10;


CREATE TABLE sp18favpets AS
  SELECT pet, count(*) as ct from students group by pet order by ct desc limit 10;


CREATE TABLE sp18dog AS
  SELECT pet, count(*) from students where pet = "dog";


CREATE TABLE sp18alldogs AS
  SELECT pet, count(*) from students where pet like "%dog%";


CREATE TABLE obedienceimages AS
  SELECT seven, denero, count(*) as ct from students where seven = '7' group by denero;

-- Q8
CREATE TABLE smallest_int_count AS
  SELECT smallest, count(*) as ct from students group by smallest;
