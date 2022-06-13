create database triggers;
use triggers;
show tables;

#before insert trigger
create table customers 
	(cust_id int,age int, name varchar(30));
 show tables;
 select *from customers;

delimiter //
create trigger age_verify 
before insert on customers
for each row 
if new.age<0 then set new.age=0;
end if; //

insert into customers 
	values(101,27,"jerry"),
    (102,-20,"ammy"),
    (104,-30,"fahim");
show tables;
select *from customers;

#after insert trigger
create table customer1(
	id int auto_increment primary key, name varchar(40) not null,email varchar(30),
    birthdate date);
create table message(
	id int auto_increment,messageId int,message varchar(300) not null, 
    primary key(id,messageId));
    
delimiter //
create trigger check_null_dob
after insert on customer1
for each row
begin 
if new.birthdate is null then 
insert into message (messageId,message)
	values(new.id, concat('hi ',new.name,', please update your dob.'));
end if;
end //

insert into customer1(name, email,birthdate)
	values("nancy","nancy@gmail.com", null),
		("fahim","fahim@gmail.com","1998-11-23"),
        ("akash","aku@gmail.com",null);
select *from message;

#before update triggers

create table employees
	(emp_id int primary key,emp_name varchar(15), age int, salary float);

insert into employees values
		(101, "fahim",35,70000),
        (102,"ashik",32,55000),
        (103,"bob",38,80000);
delimiter //
create trigger salary_check
before update 
on employees 
for each row
begin 
if new.salary=10000 then 
set new.salary=85000;
elseif new.salary<10000 then 
set new.salary= 75000;
end if ;
end //

update employees
set salary= 8000 where emp_id=101;
select *from employees;

#before delete 

create table salary(
		eid int primary key, validfrom date not null,amount float not null);
insert into salary values
	(101,"2005-05-01",55000),
    (102,"2002-04-23",68000),
    (103,"2009-07-30",75000);
create table salary_delete (id int auto_increment primary key,eid int,
	validfrom date not null,amount float not null, deletedate timestamp default now());

delimiter //
create trigger sal_delete
before delete
on salary 
for each row
begin 
insert into salary_delete(eid,validfrom,amount)
value(old.eid,old.validfrom,old.amount);
end//

delete from salary 
	where eid=103;
select *from salary_delete ;