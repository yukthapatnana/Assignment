use Hexa_jan_30


create table Customer
(
CUSTOMER_NUMBER varchar(20) primary key,
FIRSTNAME varchar(30) not null,
middlename varchar(30),
lastname varchar(30) not null,
CUSTOMER_CITY VARCHAR(30) NOT NULL,
customer_contact_no VARCHAR(50) not null,
occupation varchar(20) not null,
CUSTOMER_DATE_OF_BIRTH date
)
select * from Customer
insert into Customer values('C00001','RAMESH','CHANDRA','SHARMA','DELHI','9543198345','SERVICE','1976-12-06')
insert into Customer values('C00002','AVINASH','SUNDER','MINHA','DELHI','9876532109','SERVICE','1974-10-16')
select * from Customer


----Display no of customers belongs to each city
select CUSTOMER_CITY, count(CUSTOMER_NUMBER) as 'count_city' from Customer group by CUSTOMER_CITY 

----Display all city names from customer table without duplicate values
select distinct(CUSTOMER_CITY) from Customer

-----Display no.of customers from different occupations

select occupation, count(CUSTOMER_NUMBER) as 'count' from Customer group by occupation
select occupation, count(occupation) as 'count' from Customer group by occupation


---Display customer details with the ascending order based on firsrname
select * from Customer order by FIRSTNAME


---Display the data in descnding order based on occupation and display the firstname in ascending of each occupation
select * from Customer order by occupation desc, FIRSTNAME


---Display customers who has middlename as null
select * from Customer where middlename is null
select CUSTOMER_NUMBER from Customer where middlename is null