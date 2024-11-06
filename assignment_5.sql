use world_population;
select * from country;
desc country;

select * from persons;
desc persons;

-- inner join

select persons.fname, country.country_name, persons.rating
from persons
inner join country on persons.country_id = country.id;

-- left join

select persons.fname, country.country_name, persons.rating
from persons
left join country on persons.country_id = country.id;

-- right join

select persons.fname, country.country_name, persons.rating
from persons
right join country on persons.country_id = country.id;

-- List all distinct country names from both the Country and Persons tables

select distinct country.country_name from country
union
select distinct persons.country_name from persons
join country on persons.country_id = country.id;

-- List all country names from both the Country and Persons tables, including duplicates

select distinct country.country_name from country
union all
select distinct persons.country_name from persons
join country on persons.country_id = country.id;

-- Round the ratings of all persons to the nearest integer in the Persons table:

select id, fname, lname, country_name, rating from persons;
select id, fname, lname, country_name, round(rating) as Rounded_Ratings from persons;

