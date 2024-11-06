-- create database
create database School;

-- select database
use School;

-- create fields
create table Student(
Roll_No INT PRIMARY KEY,
Name varchar(30),
Marks INT,
Grade varchar(3)
);

-- show table
desc Student;

-- insert values
insert into Student values(1, 'Amal Baby', 87, 'A');
insert into Student values(2,'Anandu O A',89,'A');
insert into Student values(3,'Anjaly',93,'A+');
insert into Student values(4,'Anaswa',97,'A+');
insert into Student values(5,'Aswathy',90,'A+');
insert into Student values(6,'Akhil',99,'A+');
insert into Student values(7,'Abhirami',86,'A+');
insert into Student values(8,'Vishnu',75,'B+');
insert into Student values(9,'Aby',68,'C');
insert into Student values(10,'Basil',69,'C');
insert into Student values(11,'Ansal',78,'B+');
insert into Student values(12,'Adith',84,'A');
insert into Student values(13,'Amaljith',63,'B');
insert into Student values(14,'Athira',88,'A');
-- show table
select * from Student;
-- add new column
alter table student add Contact bigint;
-- update column
update student set Contact = 8281365067 where roll_no = 2;

update student
set contact = case
	when roll_no = 1 then 1234567890
    when roll_no = 3 then 1234567809
    when roll_no = 4 then 1234567089
    when roll_no = 5 then 1234560789
    when roll_no = 6 then 1234506789
    when roll_no = 7 then 1234056789
    when roll_no = 8 then 1230456789
    when roll_no = 9 then 1203456789
    when roll_no = 10 then 1023456789
    when roll_no = 11 then 0123456789
    when roll_no = 12 then 1234567800
    when roll_no = 13 then 1234567009
    when roll_no = 14 then 1234560089
end;

-- delete column 
alter table student drop contact;

-- create table student01
create table student01(
Roll_no INT Primary key,
Name varchar(30),
Grade char(3),
Marks int);

desc student01;

insert into student01 values(1,'Anandu','A',67);
insert into student01 values(2,'Ashok','B',57);
insert into student01 values(3,'Sobha','B',53);
insert into student01 values(4,'Akhil','A+',75);
insert into student01 values(5,'Abhirami','A',87);
insert into student01 values(6,'Anaswa','C',57);
insert into student01 values(7,'Anjali','A',77);

select * from student01;

-- remove column grade
alter table student01 drop grade;

-- rename table name
rename table student01 to ClassTen;
desc classten;
select * from classten;

-- delete all rows from table
truncate classten;

-- remove table from database
drop table classten;