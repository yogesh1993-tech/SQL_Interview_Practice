-- Practice for sql interview 
#1. Display the “FIRST_NAME” from Employee table using the alias name as Employee_name.

use employees;
use edubridge;
select * from employees;
 
select first_name as Employee_name from employees;

#2.Display “LAST_NAME” from Employee table in upper case.

select ucase(last_name) from employees;

#3.Display unique values of DEPARTMENT from EMPLOYEE table.

select distinct(dept_name) from DEPARTMENTS; 

#4.Display the first three characters of LAST_NAME from EMPLOYEE table.

select substring(last_name,1,3) from employees;

#5.Display the unique values of DEPARTMENT from EMPLOYEE table and prints its length.

select distinct(length(dept_name)) from departments;

#6. Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a single column AS FULL_NAME.

select concat(first_name," " ,last_name) as full_name from employees; 


#7. DISPLAY all EMPLOYEE details from the employee table order by FIRST_NAME Ascending.

select * from employees order by first_name; 

#8.Display all EMPLOYEE details order by FIRST_NAME Ascending and DEPARTMENT Descending. 

select * from employees order by first_name asc ,last_name desc; 

#9.Display details for EMPLOYEE with the first name as “VEENA” and “KARAN” from EMPLOYEE table.

select * from employee where first_name = "VEENA" union (select * from employee where first_name = "KARAN"); 

#10.Display details of EMPLOYEE with DEPARTMENT name as “Admin”

select * from employee where Department = "Admin";

#11.DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘V’.

select * from employee where First_name like ('%V%');  

#12.DISPLAY details of the EMPLOYEES whose SALARY lies between 100000 and 500000. 

select * from employee where Salary between 100000 and 500000;

#13. Display details of the employees who have joined in Feb-2020.

select * from employee where month(Joining_date) = 02 and year(Joining_date) = 2020; 

#14. Display employee names with salaries >= 50000 and <= 100000. 

select * from employee where Salary >= 50000 and Salary <= 10000; 

#15. Display the number of Employees for each department in the descenting order.

select count(First_name),department from employee group by department order by department desc;

#16.DISPLAY details of the EMPLOYEES who are also Managers.

select * from employee as  e , employee_title as t  where  e.Employee_id = t.Employee_ref_id  and t.Employee_title = 'Manager'; 

#17.DISPLAY duplicate records having matching data in some fields of a table.  

select Employee_title ,Affective_Date from employee_title group by  Employee_title ,Affective_Date having count(*) > 1;

#18. Display only odd rows from a table. 

select * from employee where Employee_id % 2 <> 0;

#19.Clone a new table from EMPLOYEE table. 

create table mydata like employee; 

select * from mydata;

# now inserting the data  

insert into mydata select * from employee; 

select * from mydata;

#20.DISPLAY the TOP 2 highest salary from a table. 

select Salary from employee order by Salary desc limit 1,2; 

#21.DISPLAY the list of employees with the same salary

select * from employee where Salary in (select Salary from employee e where employee.Employee_id <> e.Employee_id);

#22.Display the second highest salary from a table. 

select  distinct(Salary) from employee order by Salary desc limit 1,1;

#23. Display the first 50% records from a table.

select * from employee  limit 4; 

#24.Display the departments that have less than 4 people in it. 

select count(Employee_id) as countem , Department from employee group by Department having countem < 4; 

#25.Display all departments along with the number of people in there. 

select count(Employee_id) as countem , Department from employee group by Department; 

#26.Display the name of employees having the highest salary in each department. 

select First_name , Salary , Department from employee  where Salary in (select max(Salary) from employee group by Department);

#27.Display the names of employees who earn the highest salary.

select First_name , Salary  from employee where  Salary in (select max(Salary) from employee) ; 

#28.Display the average salaries for each department.

select avg(Salary) ,Department from employee group by Department; 

#29.display the name of the employee who has got maximum bonus. 

select * from employee as e , employee_bonus as eb where e.Employee_id =  eb.Employee_ref_id and eb.Bonus_Amount in (select max(Bonus_Amount) from employee_bonus);


#30.Display the first name and title of all the employees

select First_name , Employee_title from employee as em , employee_title as et where em.Employee_id = et.Employee_ref_id; 









