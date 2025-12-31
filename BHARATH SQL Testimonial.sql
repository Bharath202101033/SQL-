create database besant;
use besant ; 
create table employe(
Empid varchar(100),
EmpName varchar(100),
Department  varchar(100),
ContactNo varchar(100),
Emailid varchar(100),
EmpHeadid varchar(4)) ;   
insert into employe values("101","Isha","E-101","1234567890","isha@gmail.com",105);
insert into employe values("102","Priya","E-104","1234567890","priya@yahoo.com","103"),
("103","Neha","E-101","1234567890","neha@gmail.com","101"),
("104",	"Rahul","E-102","1234567890","rahul@yahoo.com","105"),
("105","Abhishek","E-101","1234567890","abhishek@gmail.com","102");
select * from employe;
Select * from employe Where EmpName Like 'P%'; 
Select * from employe Where Emailid like '%@gmail.com';
Select * from employe Where department In ('E-104', 'E-102');
Select * from employe Where EmpName Like '%a'; 
Select * from employe Where EmpName like '__h%';

create table worker(
worker_id int,
first_name varchar(100),
lastname varchar(100),
salary int,
joining_date datetime ,
department varchar(100));
insert into worker values(001,'monika','arora',100000,'2014-02-20 09:00:00','hr'),
(002,'niharika','verma',80000,'2014-06-11 09:00:00','admin'),
(003,'vishal','singhal',300000,'2014-02-20 09:00:00','hr'),
(004,'amitabh','singh',500000,'2014-02-20 09:00:00','admin'),
(005,'vivek','bhati',500000	,'2014-06-11 09:00:00',	'admin'),
(006,'vipul','diwan',200000,'2014-06-11 09:00:00','account'),
(007,'satish','kumar',75000,'2014-01-20 09:00:00','account'),
(008,'geetika','chauhan',90000,'2014-04-11 09:00:00','admin');
select * from worker;

create database besant;
use besant;
create table bonus (
WORKER_REF_ID int,
BONUS_DATE datetime,
BONUS_AMOUNT int);
insert into bonus values(1,'2016-02-20 00:00:00',5000),
(2,'2016-06-11 00:00:00',3000),
(3,'2016-02-20 00:00:00',4000),
(1,'2016-02-20 00:00:00',4500),
(2,'2016-06-11 00:00:00',3500);
create table title(
WORKER_REF_ID int,
WORKER_TITLE varchar(100),
AFFECTED_FROM datetime);
insert into title values(1,'Manager','2016-02-20 00:00:00'),
(2,'Executive','2016-06-11 00:00:00'),
(8,'Executive','2016-06-11 00:00:00'),
(5,'Manager','2016-06-11 00:00:00'),
(4,'Asst.Manager','2016-06-11 00:00:00'),
(7,'Executive','2016-06-11 00:00:00');
select first_name as worker_name from worker;
select upper(first_name)  from worker;
select distinct department  from worker;
select substring(first_name,1,3) from worker ;
select locate('a',first_name)from worker where first_name='amitabh';
select rtrim(first_name)from worker;
select ltrim(department)from worker;
select distinct length(department)from worker; 
select replace(first_name,'a','A')from worker;
select concat(first_name,' ',lastname) as complete_name from worker; 	
select * from worker order by first_name asc;    
select * from worker order by first_name asc , department desc;
select * from worker where first_name in ('vipul','satish');
select * from worker where first_name not in ('vipul','satish');
select * from worker where department='admin';
select * from worker where first_name like '%a%';
select * from worker where first_name like '%a';
select * from worker where first_name like '__%h';
select * from worker where salary between 100000 and 500000;
select * from worker where year(joining_date)=2014 and month(joining_date)=2;
select count(first_name)as count_of_employess from worker where department='admin';
select * from worker where salary >= 50000 and salary <= 100000;
select department,count(first_name) as no_of_workers from worker group by department order by no_of_workers  desc;
select w.first_name,t.WORKER_TITLE from worker w join title t on worker_id=WORKER_REF_ID where WORKER_TITLE='manager';
SELECT first_name, lastname, COUNT(*) AS duplicate_count FROM Worker GROUP BY first_name, lastname HAVING COUNT(*) > 1;
SELECT * FROM Worker WHERE MOD(WORKER_ID, 2) = 0;
select * from worker where mod(WORKER_ID,2)=1;
select now();
select * from worker limit 5;
select distinct salary from worker order by salary desc limit 1 OFFSET 4; 
select * from worker where salary IN (select salary from  worker group by salary having count(*) > 1);
select distinct salary from worker order by salary desc limit 1 offset 1;
select department ,count(*) from worker group  by department having count(*)<5;
select department ,count(first_name)from worker group by department;
select * from worker order by   worker_id desc limit 1;
select * from worker w where salary = (select max(salary)from worker where  department = w.department);
select distinct salary from worker order by salary desc limit 3;
select department,sum(salary) as totsalary from worker group by department;
select * from worker where salary=(select max(salary) from worker);


