-- MySQL Assignment 6
-- Grouping and Sorting

-- print the first three characters of Country_name from the Country table. 

select left(country_name, 3) as "Country(short)" from country;

-- Concatenate first name and last name from Persons table:

select concat(fname, ' ', lname) as 'Full Name' from persons;

-- Count the number of unique country names from the Persons table:

select count(distinct Country_name) as Count_of_unique_countries from persons;

-- Print the maximum population from the Country table:

select max(population) as Max_Population from country;

-- Print the minimum population from the Persons table:
select min(population) as Min_Population from country;

-- Insert 2 new rows into Persons with Lname as NULL and count Lname in the Persons table:

select * from persons;

desc persons;

alter table persons
modify lname varchar(30) null;

insert into persons values
(27, 'Messi', null, 67868, 10.0, 678, 'UK'),
(28, 'Ronaldo', null, 73658, 9.8, 789, 'USA')
;

select count(lname) as Lname_count from persons;

-- Find the number of rows in the Persons table:

select count(*) as Number_of_Rows from persons;

-- Show the population of the Country table for the first 3 rows:
select * from country;
select country_name, population from country limit 3;

-- Print 3 random rows of countries:
select * from country order by rand() limit 3;

-- List all persons ordered by their rating in descending order:
select Fname, Lname, Rating from persons order by Rating desc;

-- Find the total population for each country in the Persons table:
select Country_name, sum(population) as Total_Population
from persons
group by Country_name; 

-- Find countries in the Persons table with a total population greater than 50,000:
select Country_name, sum(Population) as Total_Population
from persons
group by Country_name
having sum(population) > 50000;

-- List the total number of persons and average rating for each country, 
-- for countries with more than 2 persons, 
-- ordered by the average rating in ascending order:

SELECT Country_Id, COUNT(*) AS Total_Persons, AVG(Rating) AS Avg_Rating
FROM Persons
GROUP BY Country_Id
HAVING COUNT(*) > 2
ORDER BY Avg_Rating ASC;


