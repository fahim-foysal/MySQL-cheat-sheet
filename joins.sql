create database sql_joins;
show databases;
use sql_joins;
create table cricket(cricket_id int auto_increment primary key, name varchar(20));
create table football(football_id int auto_increment primary key, name varchar(20));
show tables;
insert into cricket (name)
	values ("Fahim"),("rahim"),("protik"),("angshu");
insert into football (name)
	values ("omer"),("faruk"),("afzal"),("nokib");
insert into football (name)
	values ("rahim"),("protik");
 select *from cricket;
 select *from football;
 
 select *from cricket as c inner join 
	football as f where c.name=f.name;
show databases;
use classicmodels;
show tables;
show databases;
use classicmodels;
show tables;
select *from products;
select *from productlines;
select productcode, productname, textdescription
	from products 
	inner join productlines using (productline);
select *from products;
select *from orders ;
select *from orderdetails;
select o.ordernumber, o.status,p.productname, sum(quantityordered*priceeach) as revenue
	from orders as o inner join orderdetails as od
		on o.ordernumber=od.ordernumber inner join products as p
        on p.productcode=od.productcode 
        group by ordernumber;

select *from customers;
select *from orders;
select c.customernumber, c.customername,o.ordernumber,status 
	from customers as c left join orders as o 
    on c.customernumber=o.customernumber;
select *from employees;
select c.customername, c.phone,e.employeenumber,e.email
	from customers as c right join employees as e
    on e.employeenumber=c.salesrepemployeenumber
    order by employeenumber;
select m.lastname,m.employeenumber as manager,e.lastname,e.employeenumber as employee
    from employees as e
    inner join employees as m on
    e.employeenumber = m.reportsto
    order by manager;
    
    # Full outter join
select c.customername,
o.ordernumber from customers as c left join
orders as o
on c.customernumber=o.customernumber
union
select c.customername,
o.ordernumber from customers as c right join
orders as o
on c.customernumber=o.customernumber;

