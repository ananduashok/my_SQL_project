/* 
MySQL Assignment 7
Functions
*/

-- 1. Add a new column called DOB in Persons table with data type as Date. 

alter table persons add DOB date;
desc persons;
select * from persons;

update persons set dob = '1993-10-25' where id = 1;
update persons set dob = '1992-10-25' where id = 2;
update persons set dob = '1991-10-25' where id = 3;
update persons set dob = '1990-10-25' where id = 4;
update persons set dob = '1994-10-25' where id = 5;
update persons set dob = '1995-10-25' where id = 6;
update persons set dob = '1996-10-25' where id = 7;
update persons set dob = '1998-10-25' where id = 8;
update persons set dob = '1983-10-25' where id = 9;
update persons set dob = '1984-10-25' where id = 10;
update persons set dob = '1985-10-25' where id = 11;
update persons set dob = '1986-10-25' where id = 12;
update persons set dob = '1987-10-25' where id = 13;
update persons set dob = '1988-10-25' where id = 14;
update persons set dob = '1989-10-25' where id = 15;
update persons set dob = '1973-10-25' where id = 16;
update persons set dob = '1974-10-25' where id = 17;
update persons set dob = '1975-10-25' where id = 18;
update persons set dob = '1976-10-25' where id = 20;
update persons set dob = '1977-10-25' where id = 21;
update persons set dob = '1978-10-25' where id = 22;
update persons set dob = '1979-10-25' where id = 23;
update persons set dob = '1980-10-25' where id = 24;
update persons set dob = '1969-10-25' where id = 25;
update persons set dob = '1968-10-25' where id = 26;
update persons set dob = '1967-10-25' where id = 27;
update persons set dob = '1966-10-25' where id = 28;
update persons set dob = '1954-10-25' where id = 19;

-- 2. Write a user-defined function to calculate age using DOB. 

delimiter //
create function CalculateAge(dob date)
returns int
deterministic
begin
	declare age int;
    set age = timestampdiff(year, dob, curdate());
    return age;
end //

delimiter ;


-- 3. Write a select query to fetch the Age of all persons using the function that has been created. 

select fname, lname, calculateage(dob) as Age from persons;

-- 4. Find the length of each country name in the Country table. 

select id, length(country_name) as Length from country;

-- 5. Extract the first three characters of each country's name in the Country table. 

select ID, left(country_name, 3) as Nation from country;

-- 6. Convert all country names to uppercase and lowercase in the Country table.

select id, upper(country_name) as Upper, lower(country_name) as Lower from country;