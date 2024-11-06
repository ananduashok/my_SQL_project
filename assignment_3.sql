/* Create a table named Managers with fields : Manager_Id First_name Last_Name DOB Age 
->Use check constraint Last_update Gender Department Salary -> NOT NULL 
*/

create database Manager;
use manager;
create table managers(
Manager_Id int primary key,
First_Name varchar(20) not null,
Last_Name varchar(20) not null,
DOB date not null,
Age int check (age >= 18),
Last_update date not null,
Gender char,
Department varchar(30),
Salary bigint NOT NULL
);

-- 1. Insert 10 rows. 

insert into managers values(1237, 'Adri', 'Bhattacharya', '1992-06-23', 35, '2024-09-11', 'M', 'IT', 56000 );
insert into managers values(2345, 'Neeraj', 'Rawat', '1992-06-24', 36, '2024-09-11', 'M', 'Sales', 65000 );
insert into managers values(3645, 'Rahul', 'Kutty', '1992-06-25', 25, '2024-09-11', 'M', 'IT', 86000 );
insert into managers values(4637, 'Nirmal', 'Seetharaman', '1992-06-26', 32, '2024-09-11', 'M', 'IT', 36000 );
insert into managers values(5647, 'Ashok', 'OB', '1992-06-27', 55, '2024-09-11', 'M', 'IT', 94000 );
insert into managers values(6738, 'Sona', 'Pillai', '1992-06-28', 34, '2024-09-11', 'F', 'IT', 35000 );
insert into managers values(7453, 'Jermina', 'Mathew', '1992-06-29', 32, '2024-09-11', 'F', 'IT', 76000 );
insert into managers values(8769, 'Elizabeth', 'Sebastian', '1992-06-30', 31, '2024-09-11', 'F', 'IT', 99000 );
insert into managers values(9756, 'Andrew', 'Brown', '1992-07-31', 36, '2024-09-11', 'M', 'IT', 125000 );
insert into managers values(0947, 'Yadu', 'Krishna', '1992-06-01', 27, '2024-09-11', 'M', 'IT', 65000 );
select * from managers;

update managers set Department = 'Finance' where manager_id = (4637);
update managers set Department = 'Finance' where manager_id = (6738);
update managers set Department = 'Finance' where manager_id = (7453);
update managers set Department = 'Finance' where manager_id = (8769);

-- 2. Write a query that retrieves the name and date of birth of the manager with Manager_Id 1237.

select first_name, last_name, dob from managers where manager_id = 1237;

-- 3. Write a query to display the annual income of all managers. 

select first_name, last_name, department, salary*12 as Annual_Income from managers;

-- 4. Write a query to display records of all managers except ‘Andrew’.

select * from managers where first_name != 'Andrew';

-- 5. Write a query to display details of managers whose department is IT and earns more than 25000 per month.

select * from managers where department = 'IT' and salary >= 25000;

-- 6. Write a query to display details of managers whose salary is between 10000 and 35000.

select * from managers where salary between 10000 and 35000;