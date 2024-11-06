 

create database world_population;
use world_population;

-- Create a table named Country with fields: Id Country_name Population Area 

create table Country(
ID int primary key,
Country_name varchar(30),
Population varchar(50),
Area varchar(20)
); 

drop table country;
 
-- Create another table named Persons with fields: Id Fname Lname Population Rating Country_Id Country_name 

create table Persons(
ID int unique,
Fname varchar(30) not null,
Lname varchar(30) not null,
Population varchar(50),
Rating float not null,
Country_ID  int,
Country_name varchar(30),
foreign key (Country_ID) references Country(ID)
);

-- Insert 21 rows into both tables, as given below.

insert into country values
(123, 'India', 150000, 95),
(234,'Pakistan', 6000, 45),
(345,'China',148976, 145),
(456,'Sri Lanka', 56743, 65),
(567,'Norway', 5463786, 67),
(678,'UK', 34965, 87),
(789,'USA',345345, 98),
(890,'Canada',78254, 65),
(900,'Ukraine',746578, 34),
(1234,'Australia', 764786, 62),
(2345,'Combodia', 765234, 98),
(3456,'Canberra', 1324, 89),
(4567,'Rome',26384, 73),
(5678,'Singapore', 53762, 45),
(6789,'Kuwait', 54654, 35),
(7890,'Qatar', 532, 78),
(8900,'UAE', 652345, 65),
(9000,'Muscat', 135467, 87),
(12345,'Bahrain', 6534, 98),
(23456,'Sweden', 55237, 87),
(34567,'Germany',3648, 56)
;


insert into persons values
(1, 'Amit', 'Anil', 4278, 7.8, 23456, 'Sweden'),
(2, 'Unni','Krishnan', 4587, 3.9,123, 'India' ),
(3, 'Vishnu', 'Vijayan', 8763, 9.6, 567,'Norway'),
(4, 'Sanju', 'O S', 5467, 6.4, 34567,'Germany'),
(5, 'Amal', 'T K', 6382, 3.7,23456,'Sweden' ),
(6, 'Akhil', 'Thankachan', 676, 8.6,789,'USA' ),
(7, 'Anto', 'Manjooran',6473,4.0,678,'UK'),
(8, 'Adit', 'Jojo',342,6.7,890,'Canada'),
(9, 'jayadev', 'Nair',84583,3.6,678,'UK'),
(10, 'Anandu', 'Ashok',3245,4.5,789,'USA'),
(11, 'Akhil', 'O A',44533,9.0,1234,'Australia'),
(12, 'Jibin','George',4532,5.4,678,'UK'),
(13, 'Betsy', 'Mathew',2389,5.6,890,'Canada'),
(14, 'Amaljith', 'Vijayan',564,6.7,890,null),
(15, 'prince', 'george',453,5.6,678,null),
(16, 'mahima', 'Nambhiar',324,4.8,1234,'Australia'),
(17, 'Mohanlal', 'Viswanath',6545,6.7,789,'USA'),
(18, 'Mammoty', 'Ali',453,3.2,678,null),
(19, 'Gokul', 'Suresh',453,5.7,890,'Canada'),
(20, 'Aby', 'Tom',4325,5.0,678,'UK'),
(21, 'Ansal', 'Kallingal',5643,8.7,890,null),
(22, 'Aswathy' , 'U P',4356,5.3,890,'Canada'),
(23, 'Anjali', 'U P',4567,4.6,678,'UK'),
(24, 'Anaswa', 'Anandu',6543,6.9,789,'USA'),
(25, 'Adishesh' , 'Anandu',432,9.4,789,'USA'),
(26, 'Akshad', 'Skanda',3231,9.9,1234,'Australia')
;

select * from country;
select * from persons;

-- (1)List the distinct country names from the Persons table 

select distinct country_name from persons;

-- (2)Select first names and last names from the Persons table with aliases. 

select fname as First_Name, lname as Last_Name from persons;

-- (3)Find all persons with a rating greater than 4.0. 

select * from persons where rating > 4.0;

-- (4)Find countries with a population greater than 10 lakhs. 

select * from country where population > 100000;

-- (5)Find persons who are from 'USA' or have a rating greater than 4.5. 

select * from persons where country_name = 'USA' or rating > 4.5;

-- (6)Find all persons where the country name is NULL. 

select * from persons where country_name is null;

-- (7)Find all persons from the countries 'USA', 'Canada', and 'UK'. 

select * from persons where country_name in ('USA','canada','uk');

-- (8)Find all persons not from the countries 'India' and 'Australia'. 

select * from persons where country_name not in ('india','australia');

-- (9)Find all countries with a population between 5 lakhs and 20 lakhs. 

select * from country where population between 50000 and 2000000;

-- (10)Find all countries whose names do not start with 'C'. 

select * from country where country_name not like 'c%';


