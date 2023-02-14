create database day3

use day3
use day2
---create a user defined stored procedure to display "welcome to sql server"as message and execute it
create procedure uspyuktha
as
begin 
print 'welcome to SQL server'
end

execute uspyuktha


-----create a stored procedure which takes gender and depatid as input parameter. Based on input parameter display the the employee name,gender salary from tblemployee



create procedure uspEmployee(
@Gender varchar(20),
@Depatid int
)
as
begin
select name,gender,salary from Employee 
where @Gender=gender and @Depatid=departmentid
end


execute uspEmployee 'female',3


-/*create a stored procedure which takes gender and depatid as input parameter and totalemployee as output param.Based on input parameter display the 
employee name ,gender,salary from tblemployee table and total employee of given gender and deaprtmentid */

alter procedure uspEmployee(
@Gender varchar(20),
@Depatid int,
@Total_Employee int output
)
as
begin
select name,gender,salary from Employee 
where @Gender=gender and @Depatid=departmentid
select @Total_Employee=@@ROWCOUNT
end

declare @Total int;
execute uspEmployee 'female',3, @Total_Employee=@Total output
select @Total as 'Total'

---Display the totalemployeecount by gender using stored procedure?
alter procedure uspEmployeetotal
as
begin
select gender,count(gender) as totalemployee from Employee 
group by gender
end
go


execute uspEmployeetotal


/*create a stored procedure to add three numbers and display the sum of three numbers output.
If user does not pass values for input params give default value sum as ouput*/
create procedure result(
@num1 int,
@num2 int,
@num3 int,
@sum int,
@result varchar(20)
)
as
begin 
set @sum=@num1+@num2+@num3
if @num1=not null or @num2=not null or @num3= not null
then print @sum
else @num1=null or @num2=null or @num3=null
then @sum=null
end