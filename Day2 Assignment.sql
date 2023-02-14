create database Hexa_day2
 
use Hexa_day2


create table Customer_master(
CUSTOMER_NUMBER int primary key identity,
FIRSTNAME varchar(50) not null,
middlename varchar(50),
lastname varchar(50) not null,
CUSTOMER_CITY varchar(50) not null,
CUSTOMER_CONTACT_NO bigint not null,
occupation varchar(30) not null,
CUSTOMER_DATE_OF_BIRTH date not null
)



create table loan_details(
cutomer_number int foreign key references Customer_master(CUSTOMER_NUMBER),
Branch_id int,
loan_amount bigint
)

create table Branch_master(
Branch_id int primary key identity,
branch_name varchar(30),
branch_city varchar(20)
)


create table account_master(
account_number varchar(100) primary key,
customer_number int foreign key references Customer_master(CUSTOMER_NUMBER),
branch_id int foreign key references Branch_master(Branch_id),
opening_balance bigint,
account_opening_date date,
account_type varchar(30),
account_status varchar(30)
)


create table transaction_details(
transaction_number varchar(100) primary key,
account_number varchar(100) foreign key references account_master(account_number),
date_of_transaction date,
medium_of_transaction varchar(30),
transaction_type varchar(30),
transaction_amount bigint
)

