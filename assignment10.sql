-- Triggers

-- 1. Create a table named teachers with fields id, name, subject, experience and salary and insert 8 rows. 

create database student;
use student;

create table teachers(
id int primary key,
name varchar(30),
subject varchar(30),
experience int,
salary decimal(10,2)
);

insert into teachers
values
(1, 'Alice', 'Math', 5, 50000),
(2, 'Bob', 'Science', 8, 55000),
(3, 'Carol', 'History', 3, 45000),
(4, 'Dave', 'Math', 12, 60000),
(5, 'Eve', 'Geography', 15, 65000),
(6, 'Frank', 'Science', 4, 52000),
(7, 'Grace', 'Math', 6, 48000),
(8, 'Hank', 'English', 2, 43000)
;

select * from teachers;

-- 2. Create a before insert trigger named before_insert_teacher that will raise an error “salary cannot be negative” 
-- if the salary inserted to the table is less than zero. 

delimiter //

create trigger before_insert_teacher
before insert on teachers
for each row

Begin
	if new.salary < 0 then
		signal sqlstate '45000'
        set message_text = 'salary cannot be neagtive';
	end if;
end //

delimiter ;

-- create teacher_log table

create table teacher_log(
teacher_id int,
action varchar(50),
timestamp datetime
);

-- 3. Create an after insert trigger named after_insert_teacher that inserts a row with teacher_id,action, 
-- timestamp to a table called teacher_log when a new entry gets inserted to the teacher table. 
-- tecaher_id -> column of teacher table, action -> the trigger action, timestamp -> time at which the new row has got inserted. 

delimiter //

create trigger after_insert_teacher
after insert on teachers
for each row
Begin
	insert into teacher_log( teacher_id, action, timestamp)
    values (new.id, 'insert', now());
end //

delimiter ;


-- 4. Create a before delete trigger that will raise an error when you try to delete a row that has experience greater than 10 years. 

delimiter //

create trigger before_delete_teacher
before delete on teachers
for each row
Begin
	if old.experience > 10 then
		signal sqlstate '45000'
        set message_text = 'Cannot delete a teacher with experience greater than 10 years';
	end if;
end //

delimiter ;

 -- 5. Create an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.
 
 delimiter //
 
 create trigger after_delete_trigger
 after delete on teachers
 for each row
 Begin
	insert into teacher_log (teacher_id, action, timestamp)
    values (old.id, 'Delete', now());
end //

delimiter ;
    