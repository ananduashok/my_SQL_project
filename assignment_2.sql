
-- Create a database called “Sales”

-- create database
create database Sales;
use sales;


-- create a new table named “Orders” in the Sales database with columns: 
-- (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No). Use constraints: Primary Key Unique Not Null

create table Orders(
Order_Id INT PRIMARY KEY,
Customer_name varchar(30),
Product_Category varchar(20) not null,
Ordered_item varchar(30),
Contact_No bigint unique
);

desc orders;
 
-- 1. Add a new column named “order_quantity” to the orders table. 

alter table orders add Order_quantity int;
desc orders;

-- 2. Rename the orders table to the sales_orders table. 

rename table orders to Sales_Orders;
desc sales_orders;

-- 3. Insert 10 rows into the sales_orders table. 

insert into sales_orders values(6574,'Anandu', 'electronics', 'iron box', 8281365067, 4);
insert into sales_orders values(6382,'Ashok', 'industry', 'spanner', 8281365061, 1);
insert into sales_orders values(9874,'Sobha', 'grocery', 'fruits', 8281365062, 2);
insert into sales_orders values(2367,'Akhil', 'mechanical', 'compass', 8281365063, 3);
insert into sales_orders values(9846,'Abhirami', 'grocery', 'pen', 8281365064, 5);
insert into sales_orders values(6478,'Anaswa', 'grocery', 'vegetables', 8281365065, 6);
insert into sales_orders values(9345,'Akshad', 'toys', 'car', 8281365066, 7);
insert into sales_orders values(6472,'Adishesh', 'toys', 'jeep', 8281365068, 8);
insert into sales_orders values(9485,'Anjali', 'academics', 'table', 8281365069, 9);
insert into sales_orders values(1425,'Aswathy', 'grocery', 'moong seeds', 8281365060, 2);

select * from sales_orders;

-- 4. Retrieve customer_name and Ordered_Item from the sales_orders table. 

select customer_name, ordered_item from sales_orders;

-- 5. Use the update command to change the name of the product for any row. 

update sales_orders set ordered_item = 'drilling machine' where customer_name = 'ashok';
select * from sales_orders;

-- 6. Delete the sales_orders table from the database.

drop table sales_orders;





