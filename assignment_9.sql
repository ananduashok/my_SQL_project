/*
Assignment 9
Stored Procedures
*/

create database storedprocedure;
use storedprocedure;
CREATE TABLE Worker (
    Worker_Id INT PRIMARY KEY,
    FirstName CHAR(25),
    LastName CHAR(25),
    Salary INT,
    JoiningDate DATETIME,
    Department CHAR(25)
);

/* Consider the Worker table with following fields: 
   Worker_Id INT FirstName CHAR(25), LastName CHAR(25), Salary INT(15), JoiningDate DATETIME, Department CHAR(25)) */
   
/* 1. Create a stored procedure that takes in IN parameters for all the columns in the Worker table and 
   adds a new record to the table and then invokes the procedure call. */

delimiter //

create procedure AddWorker(
	IN p_Worker_Id int,
    in p_FirstName char(25),
    in p_LastName char(25),
    in p_Salary int,
    in p_JoiningDate datetime,
    in p_Department char(25)
)

begin
	insert into worker (Worker_Id, FirstName, LastName, Salary, JoiningDate, Department)
    values(p_Worker_Id, p_FirstName, p_LastName, p_Salary, p_JoiningDate, p_Department);
end //

DELIMITER ;

call AddWorker(1, 'John', 'Doe', 5000, '2023-01-01', 'HR');
call addworker(2,'Peter','Dirk',10000,'2023-01-02','Software');
call addworker(3, 'Messi', 'Leo', 4000, '2023-02-03','HR');
call addworker(4, 'Ronaldo', 'Cristiano', 6000, '2022-09-06','Sales');
call addworker(5, 'Mesut', 'Ozil', 7000, '2024-09-08','HR');
call addworker(6, 'Neymar','Chicolso',8000, '2024-01-06','Sales');
call addworker(7,'Peter','cruyff',9000,'2022-09-01','Sodtware');

select * from worker;

/* 2. Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY. 
   It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. Then make the procedure call.*/ 

DELIMITER //
create procedure GetWorkerSalary(
	in p_worker_id int,
    out p_salary int
)
begin
	select salary into p_salary
    from worker
    where worker_id = p_worker_id;
end //
DELIMITER ;

 -- calling the getworkersalary procedure
 
 call getworkersalary(2,@salary);
 select @salary as Salary;

/* 3. Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT. 
   It should update the department of the worker with the given ID. Then make a procedure call. */

Delimiter //
create procedure updatedepartment(
	in p_worker_id int,
    in p_department char(25)
)
Begin
	update worker
    set department = p_department
    where worker_id = p_worker_id;
end //

delimiter ;

-- calling the updatedepartment procedure

call updatedepartment(7,'Software');
select * from worker where worker_id = 7;

/* 4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. 
   It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter. Make procedure call. */

delimiter //

create procedure getworkercount(
	in p_department char(25),
    out p_workercount int
)

Begin
	select count(*) into p_workercount
    from worker
    where department = p_department;
end //

delimiter ;

-- calling getworkercount 

call getworkercount('HR', @count);
select @count as Count;
    
/* 5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. 
   It should retrieve the average salary of all workers in the given department and returns it in the p_avgSalary parameter
   and call the procedure. */
   
delimiter //

create procedure getaveragesalary(
	in p_department char(25),
    out p_avgsalary decimal(10,2)
)

Begin
	select avg(salary) into p_avgsalary
    from worker
    where department = p_department;
end //

delimiter ;

-- calling getavgsalary procedure

call getaveragesalary('HR', @average);
select @average as 'Average of Salary';

call getaveragesalary('Software', @average);
select @average as average;

call getaveragesalary('sales', @average);
select @average  as average;