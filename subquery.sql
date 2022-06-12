show databases;
use sql_intro;
show tables;
select *from employees;
select avg(salary) from employees;
select emp_name, dept, salary from employees
where salary<(select avg(salary) from employees);
create database subqueries;
use subqueries;
create table products (product_id int, item varchar(20),sell_price float, product_type varchar(20));
insert into products
values(101,'jewels',1800,'luxury'),
(102,'shirt',100,'non-luxury'),
(103,'table',400,'non-luxury'),
(104,'laptop',1300,'luxury');
select *from products;

create table orders(order_id int,product_sold varchar(20),selling_price float);
#insert subquery
insert into orders 
	select product_id,item,sell_price from products
		where product_id in (select product_id from products where sell_price>1000);
select *from orders;

#update subquery
select *from products;
update products 
	set sell_price= 50+sell_price
    where product_id in(select product_id from products where sell_price<1000);
use sql_intro;
show tables;
select *from employees;
select *from emp_details;
update employees
	set salary= 2*salary
    where emp_name in(select name from emp_details where salary<70000);
delete from employees
	where age in (select age from emp_details where age<25);
