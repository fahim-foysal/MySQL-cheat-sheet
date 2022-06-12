show databases;
use sql_intro;
show tables;
create table employees( Emp_id int primary key, Emp_name varchar(25), age int, Gender char(1), DOJ date, Dept varchar(20), City varchar(15), Salary float);
describe employees;
insert into employees values 
		(101,"Jimmy",34,"M","2005-07-23","Sales","Chicago",7000),
        (102,"Fahim",25,"M","2020-07-28","Marketing","Seatle",65000),
        (103,"Marry",28,"F","2009-03-10","Product","Boston",8000),
        (104,"Dayene",37,"M","2011-07-23","Tech","Austin",720000);
select *from employees; 
insert into employees values 
		(105,"Karin",24,"M","2005-07-23","Tech","Chicago",70000),
        (106,"Rahim",35,"M","2007-07-28","Marketing","Seatle",55000),
        (107,"Mariam",38,"F","2012-03-10","Sales","Boston",80000),
        (108,"Deen",27,"M","2010-07-23","Tech","Austin",620000),
		(109,"Mimmy",34,"F","2015-07-23","Sales","Chicago",7000),
        (110,"Fahim",25,"M","2010-09-28","Marketing","Seatle",65000),
        (111,"Marry",28,"F","2009-03-10","Product","Miami",8000),
        (112,"Dani",32,"F","2017-07-23","Tech","Austin",720000);
select *from employees; 
select distinct city from employees;
select distinct dept from employees;
select avg(age) from employees;
#avg age in each dept;
select dept, round(avg(age),2) as average_age from employees group by dept;
select dept,sum(salary) from employees group by dept;        

select count(emp_id), city from employees group by city order by count(emp_id) desc;
select count(emp_id),year(DOJ) from employees group by year(DOJ) order by count(emp_id) desc;
show databases;
use sql_intro;
show tables;
select *from employees;
create table sales(product_id int, sell_price float,quantity int, state varchar(10));
describe sales;
insert into sales values
		(121,320.0,3,"California"),
        (121,320.0,6,"Texas"),
        (123,290.0,4,"California"),
        (123,320.0,6,"Alaska"),
        (122,290.0,4,"Texas");
select *from sales;
select product_id,sum(sell_price*quantity) as revenue from sales group by product_id;

create table c_product(product_id int, cost_price float);
insert into c_product values
		(121,250),
        (123,260),
        (122,255);
select c.product_id, sum((s.sell_price-c.cost_price)*s.quantity) as profit 
	from sales as s inner join c_product as c
	where s.product_id=c.product_id 
    group by product_id order by product_id;

select *from employees;
select city,count(emp_id) from employees group by city having count(emp_id)>2 ;
select dept, round(avg(salary),2) from employees group by dept having avg(salary)>40000;
select dept,count(dept) as emp_count 
	from employees 
    group by dept
    having count(dept)>2;
select city, count(*) as emp_count 
	from employees 
	where city!="Austin" 
    group by city;
SELECT 
    dept, COUNT(*) AS emp_sal
FROM
    employees
GROUP BY dept
HAVING AVG(Salary) > 70000;