create database sql_intro;
use sql_intro;
create table emp_details (Name varchar(25), Age int, Sex  char(1), doj date, city varchar(15), salary float);
show tables;
show databases;
use world;

use sql_intro;
show tables;
create table emp_details (Name varchar(25), Age int, Sex  char(1), doj date, city varchar(15), salary float);
show tables;
describe emp_details;
insert into emp_details
	values("Jimmy",25,"M","2009-03-10","Boston",7000),
			("Fahim",23,"M","2010-10-12","Sylhet",5000),
            ("Foysal",27,"M","2015-6-20","Dhaka",9000),
            ("Rabeya",22,"F","2019-8-30","Dhaka",6000);
select *from emp_details;
select distinct city from emp_details;
select count(name) as count_name from emp_details;
select sum(salary) from emp_details;
select name, age, city from emp_details;
select *from emp_details where age> 25;
select name, age, salary from emp_details where sex="F";
select *from emp_details where city="Boston" or city="Sylhet";
select *from emp_details where doj between '2000-01-1' and '2010-12-30';
select *from emp_details where age<30 and sex="F";
select sex ,sum(salary) as total_salary from emp_details group by sex;
select *from emp_details order by salary desc;
select curdate();
select day(curdate());
select now();
#strings
select length('bangladesh') as total_len;
select name , length(name) as name_length from emp_details;
select concat("fahim"," is", " sql");
select name,age, concat(name," ",salary) as name_salary from emp_details; 
select reverse("Fahim");
select reverse(name) from emp_details;
select replace("orange is a vegetable","vegetable","fruit") as replacing;
select length("    fahim    ");
select length(rtrim("    fahim    "));
select length(trim("    fahim    "));
SELECT POSITION('fruit' IN 'orange is a fruit') AS pos;
