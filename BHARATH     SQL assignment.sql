create database besant ;
use besant ;
create table passengers(
passenger_name varchar(100),
category varchar(100),
gender enum("male","female"),
boarding_station varchar(100),
destination_station varchar(100),
distance int,
compartment enum("ac","non-ac")

) ;   
insert into passengers values("sam","general","male","chennai","bangalore",350,"ac");
insert into passengers values("charlie","tatkal","male","hyderabad","mumbai",700,"non-ac"),
("tina","general","female","bangalore","goa",600,"ac"),
("carl","general","male","mumbai","chennai",1500,"ac"),
("sarah","tatkal","female","goa","trivandrum",1000,"ac"),
("john","general","male","hyderabad","nagpur",500,"non-ac"),
("linda","tatkal","female","mumbai","goa",700,"ac"),
("mike","tatkal","male","bangalore","hyderabad",500,"non-ac"),
("chris","general","male","nagpur","pune",700,"non-ac");
select * from passengers;
select gender,count(*) from passengers where distance>=600 group by gender;
select passenger_name from passengers where passenger_name like"s%";
select passenger_name,distance from passengers where distance >500;
select compartment,count(*) from passengers group by compartment;
select count(*)as bordingtomumbai from passengers where boarding_station='mumbai';
select passenger_name,boarding_station,destination_station from passengers where category='tatkal';
select passenger_name from passengers where boarding_station in ('bangalore','chennai','nagpur');
select  boarding_station from passengers order by boarding_station;
create table price (
compartment enum('ac','non-ac'),
distance int,
price int);
insert  into price values('ac',350,770);
insert  into price values('ac',500,1100),
('ac',600,1320),
('ac',700,1540),
('ac',1000,2200),
('ac',1200,2640),
('ac',1500,3300),
('non-ac',350,434),
('non-ac',500,620),
('non-ac',600,744),
('non-ac',700,868),
('non-ac',1000,1240),
('non-ac',1200,1488),
('non-ac',1500,1860);
select*from price;
select min(price) from price where compartment='ac';
select max(price) from price where compartment='non-ac';
select p.passenger_name ,pr.price from passengers p join price pr on p.compartment=pr.compartment and p.distance=pr.distance where p.boarding_station='chennai'and p.destination_station='bangalore'and p.compartment='ac';
select count(*)as tatkalpeople from passengers where category='tatkal';
select boarding_station from passengers where category='general';
select max(price),compartment from price group by compartment;
select p.passenger_name,pr.price ,p.distance from passengers p join price pr on p.distance=pr.distance and p.compartment=pr.compartment where pr.distance=700;
select * from passengers;
select passenger_name,length(passenger_name) as no_of_chars from passengers where boarding_station='hyderabad';

select passenger_name,gender,boarding_station from passengers;
select p.passenger_name,pr.price  from passengers p join price pr on p.distance=pr.distance and p.compartment=pr.compartment where p.passenger_name='linda';
select distinct count(boarding_station) from passengers;

 

