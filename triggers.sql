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

select *from customers;

    
    