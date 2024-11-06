/*
MySQL Assignment 8
Subqueries and Views
*/

-- Consider the Country table and Persons table that you created earlier and perform the following: 

-- 1. Find the number of persons in each country. 

use world_population;
select country_name, count(id) as No_of_persons from persons
group by country_name;

-- 2. Find the number of persons in each country sorted from high to low. 

select country_name, count(id) as No_of_persons
from persons
group by country_name
order by count(id);

-- 3. Find out an average rating for Persons in respective countries if the average is greater than 3.0

select country_name, avg(rating) as Average_rating
from persons
group by country_name
having avg(rating) > 3
order by avg(rating);

-- 4. Find the countries with the same rating as the USA. (Use Subqueries)

select country_name 
from persons
where rating = (select rating from persons where country_name = 'USA');

select rating from persons where country_name = 'USA';

-- 5. Select all countries whose population is greater than the average population of all nations.

select avg(population) from country;

select country_name, population
from country
where population > (select avg(population) from country)
order by population;

-- Create a database named Product and create a table called Customer with the following fields in the Product database: 
-- Customer_Id - Make PRIMARY KEY First_name Last_name Email Phone_no Address City State Zip_code Country

create database Product;
use Product;
create table Customer(
Customer_Id int Primary key,
First_name varchar(30) not null,
Last_name varchar(30),
Email varchar(30) unique,
Phone_no bigint unique,
Address varchar(100),
City varchar(30),
State varchar(30),
Zip_code varchar(20),
Country varchar(30)
);

desc customer;

INSERT INTO Customer (Customer_Id, First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES 
(1, 'John', 'Doe', 'john.doe@example.com', '5551234', '123 Elm St', 'Los Angeles', 'California', '90001', 'USA'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '5552345', '456 Oak St', 'New York', 'New York', '10001', 'UK'),
(3, 'Michael', 'Johnson', 'michael.johnson@example.com', '5553456', '789 Pine St', 'Chicago', 'Illinois', '60601', 'Sweden'),
(4, 'Emily', 'Davis', 'emily.davis@example.com', '5554567', '101 Maple St', 'San Francisco', 'California', '94101', 'USA'),
(5, 'Chris', 'Brown', 'chris.brown@example.com', '5555678', '102 Birch St', 'Houston', 'Texas', '77001', 'India'),
(6, 'Olivia', 'Wilson', 'olivia.wilson@example.com', '5556789', '103 Cedar St', 'Seattle', 'Washington', '98101', 'USA'),
(7, 'William', 'Taylor', 'william.taylor@example.com', '5557890', '104 Redwood St', 'Miami', 'Florida', '33101', 'Russia'),
(8, 'Sophia', 'Anderson', 'sophia.anderson@example.com', '5558901', '105 Palm St', 'Dallas', 'Texas', '75201', 'India'),
(9, 'James', 'Moore', 'james.moore@example.com', '5559012', '106 Cypress St', 'Austin', 'Texas', '73301', 'India'),
(10, 'Ava', 'Jackson', 'ava.jackson@example.com', '5550123', '107 Spruce St', 'Boston', 'Massachusetts', '02101', 'USA'),
(11, 'Liam', 'Harris', 'liam.harris@example.com', '5551230', '108 Fir St', 'San Diego', 'California', '92101', 'USA'),
(12, 'Mason', 'Martin', 'mason.martin@example.com', '5552340', '109 Magnolia St', 'Denver', 'Colorado', '80201', 'USA'),
(13, 'Isabella', 'Lee', 'isabella.lee@example.com', '5553450', '110 Ash St', 'Phoenix', 'Arizona', '85001', 'USA'),
(14, 'Charlotte', 'Perez', 'charlotte.perez@example.com', '5554560', '111 Cherry St', 'Las Vegas', 'Nevada', '89101', 'USA'),
(15, 'Lucas', 'Thompson', 'lucas.thompson@example.com', '5555670', '112 Apple St', 'Portland', 'Oregon', '97201', 'USA'),
(16, 'Amelia', 'White', 'amelia.white@example.com', '5556780', '113 Orange St', 'Philadelphia', 'Pennsylvania', '19101', 'USA'),
(17, 'Logan', 'Garcia', 'logan.garcia@example.com', '5557891', '114 Plum St', 'San Antonio', 'Texas', '78201', 'India'),
(18, 'Mia', 'Martinez', 'mia.martinez@example.com', '5558902', '115 Lemon St', 'Orlando', 'Florida', '32801', 'Russia'),
(19, 'Ethan', 'Rodriguez', 'ethan.rodriguez@example.com', '5559013', '116 Peach St', 'Atlanta', 'Georgia', '30301', 'USA'),
(20, 'Abigail', 'Lopez', 'abigail.lopez@example.com', '5550124', '117 Pear St', 'Salt Lake City', 'Utah', '84101', 'USA');

select * from customer;

-- 1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. 
-- Then perform the SELECT operation for the customer_info view. 

create view Customer_Info as
select concat(First_name, ' ', last_name) as Customer_name, Email
from customer;

select * from customer_info;

-- 2. Create a view named US_Customers that displays customers located in the US.

create view US_Customers as
select * from customer
where country = 'USA';

select * from US_Customers;

-- 3. Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state. 

create view Customer_Details as
select concat(first_name,' ',last_name) as Customer_name, Email, Phone_no, State
from customer;

select * from customer_details;

-- 4. Update phone numbers of customers who live in California for Customer_details view. 

update customer_details
set Phone_no = 9876543
where state = 'California';

select * from customer_details where state = 'California';

-- 5. Count the number of customers in each state and show only states with more than 5 customers. 

select State, count(customer_id)
from customer
group by state
having count(customer_id) > 2;


-- 6. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view.

select State, count(*) as Number_of_customers
from customer_details
group by state
order by count(*);
 
-- 7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.

select * from customer_details
order by state;