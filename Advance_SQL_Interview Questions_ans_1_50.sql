drop database advancesqlstudy; 

create database advancesqlstudy;

use  advancesqlstudy;

create table studies (
	PNAME VARCHAR(35),
    INSTITUTE VARCHAR(45),
    COURSE VARCHAR(35),
    COURSEFEE INT
    );
    
    INSERT INTO  STUDIES (PNAME,INSTITUTE,COURSE,COURSEFEE) VALUES
("ANAND","SABHARI","PGDCA",4500),
("ATLAF","COIT","DCA",7200),
("JULIANA","BITS","MCA",22000),
("KAMALA","PRAGATHI","DCP",5000),
("MARY","SABHARI","PGDCA",4500),
("NELSON","PRAGATHI","DAP",6200),
("PATRICK","PRAGATHI","DCAP",5200),
("QADIR","APPLE","HDCP",14000),
("RAMESH","SABHARI","PGDCA",4500),
("RESECCA","BRILLIANT","DCP",11000),
("REMITHA","BDPS","DCS",6000),
("VIJAYA","BDPS","DCA",48000);



CREATE TABLE SOFTWARE(
	PNAME VARCHAR(45),
    TITLE VARCHAR(45),
    DEVELOPIN VARCHAR(45),
    SCOST FLOAT,
    DCOST INT,
    SOLD INT 
    );
    
    
    INSERT INTO SOFTWARE (PNAME,TITLE,DEVELOPIN,SCOST,DCOST,SOLD) VALUES 
("MARY","README","CPP",100.00,1200,84),
("ANAND","PARACHUTES","BASIC",399.95,6000,43),
("ANAND","VIDEOTITLING","PASCAL",7500.00,16000,9),
("JULIANA","INVENTORY","COBOL",3000.00,3500,0),
("KAMALA","PAYROLLPRG","DBASE",9000.00,20000,7),
("MARY","FINANCIALACC","ORACLE",18000.00,85000,4),
("MARY","CODEGENERRATOP","C",4500.00,20000,23),
("PATTRICK","README","CPP",300.00,1200,84),
("QADIR","BOMBSAWAY","ASSEMBLY",750.00,5000,11),
("QADIR","VACCINES","C",1900.00,3400,21),
("RAMESH","HOTLIMGMT","DBASE",12000.00,35000,4),
("RAMESH","DEADLEE","PASCAL",599.95,4500,73),
("REMITHA","PCUTITLES","C",725.00,5000,51),
("REMITHA","TSRHELPPKG","ASSEMBLY",2500.00,6000,7),
("REVATHI","HOSPITALMGT","PASCAL",1100.00,75000,2),
("VIJAYA","TSREDITOR","C",900.00,700,6);


CREATE TABLE PROGRAMMER(
	PNAME VARCHAR(35),
    DOB DATE,
    DOJ DATE,
    SEX VARCHAR(3),
    PROF1 VARCHAR(35),
    PROF2 VARCHAR(35),
    SALARY INT
    );
    
    INSERT INTO PROGRAMMER (PNAME,DOB,DOJ,SEX,PROF1,PROF2,SALARY) VALUES ("ANAND","1966-04-12","1992-04-21","M","PASCAL","BASIC",3200),
    ("ALTAF","1964-07-02","1990-11-13","M","CLIPPER","COBOL",2800),
    ("JULIANA","1960-01-13","1990-04-21","F","COBOL","DBASE",3000),
    ("KAMALA","1968-10-30","1992-01-02","F","C","DBASE",2900),
    ("MARY","1970-06-24","1991-02-01","F","CPP","ORACLE",4500),
("NELSON","1985-09-11","1989-03-11","M","COBOL","DBASE",2500),
("PATTRICK","1965-11-10","1990-04-21","M","PASCAL",NULL,2800),
("QADIR","1965-08-31","1990-04-21","M","ASSEMBLY","C",3000),
("RAMESH","1967-05-03","1991-02-26","M","PASCAL","DBASE",3200),
("REBECCA","1997-01-01","1990-12-01","F","BASIC","COBOL",2500),
("REMITHA","1970-04-19","1993-04-20","F","C","ASSEMBLY",3000),
("REVATHI","1969-12-02","1992-01-02","F","PASCAL","BASIC",3200),
("VIJAYA","1965-12-14","1992-05-02","F","FOXPRO","C",4500);

SELECT * FROM SOFTWARE;
SELECT * FROM PROGRAMMER;
SELECT * FROM STUDIES;

-- Q1 : Find out the selling cost of Packages developed in Pascal
select SCOST from software where DEVELOPIN = "PASCAL";

-- Q2 : Display the names ages of all programmers
SELECT * FROM PROGRAMMER;
select PNAME , TIMESTAMPDIFF(YEAR,DOB,NOW()) from programmer; 

-- Q3 : Display the names of those who have done the dap course.
SELECT * FROM STUDIES;

select PNAME from studies where COURSE = "DAP";

-- Q4 : Display the names and date of births of all programmers born in january
SELECT * FROM PROGRAMMER;

select PNAME , DOB from programmer where month(DOB) = 01;

-- Q5 : What is the highest number of copies sold by a package
SELECT * FROM SOFTWARE;
select SOLD from software limit 1; 
SELECT MAX(SOLD) AS HIGHEST_NUMBER_OF_COPIES FROM SOFTWARE;

-- Q6 : Display the lowest course fee
SELECT * FROM STUDIES;
select min(COURSEFEE) from studies;

-- Q7 : How many programmers done the pgdca course
SELECT * FROM STUDIES;
select count(PNAME) from studies where COURSE = "PGDCA";

-- Q8 : How much revenue has been earned thru sales of packages developed in c.
SELECT * FROM SOFTWARE;

select sum(SCOST * DCOST) as revenue from software where DEVELOPIN = "C";

-- Q9 : Display the details of the software developed by Ramesh.
SELECT * FROM SOFTWARE;

select * from software where PNAME = "Ramesh";

-- Q10 : How many programmers studied at Sabhari

SELECT * FROM STUDIES;

select count(PNAME) from studies where INSTITUTE = "SABHARI";

-- Q11 : Display details of packages whose sales crossed the 2000 mark
SELECT * FROM SOFTWARE;
SELECT * FROM SOFTWARE WHERE (DCOST*SOLD) > 2000;

-- Q12 : Find out the number of copies which should be sold in order to
SELECT * FROM SOFTWARE;

select TITLE,count(SOLD) from software group by TITLE;

-- Q13 :  Display the details of packages for which developments cost have been recovered.
SELECT * FROM SOFTWARE;

select * from software where SCOST*SOLD >= DCOST;

-- Q14 : What is the cost of the costliest software developed in basic 

select max(DCOST) from software where DEVELOPIN = "BASIC";

-- Q15 : How many packages developed in dbase
SELECT * FROM SOFTWARE;
select count(TITLE) from software where DEVELOPIN = "DBASE";

-- Q16 : How many programmers studies in Pragathi
SELECT * FROM STUDIES;

select count(PNAME) from studies where INSTITUTE = "PRAGATHI";

-- Q17 : How many programmers paid 5000 to 10000 for their studies.
SELECT * FROM STUDIES;

select count(PNAME) from studies where COURSEFEE >=5000  and COURSEFEE <=10000;

-- Q18 :  What is avg course fee
SELECT * FROM STUDIES;

select avg(COURSEFEE) from STUDIES;

-- Q19 : Display the detail the programmers knowing c
SELECT * FROM PROGRAMMER;

select * from programmer where PROF1 = "C" or PROF2 = "C";

-- Q20 : How many programmers know either Cobol or Pascal
SELECT * FROM PROGRAMMER;

select count(PNAME) from programmer where PROF1 = "Cobol" or "Pascal" and PROF2 = "Cobol" or "Pascal";

-- Q21 : How many programmers don’t know Pascal and C
SELECT * FROM PROGRAMMER;

select count(PNAME) from programmer where PROF1 <> "Cobol" or "Pascal" and PROF2 <> "Cobol" or "Pascal";

-- Q22 : How old is the oldest male programmers
SELECT * FROM PROGRAMMER;

select max(timestampdiff(year,DOB,now())) from PROGRAMMER where sex = "M" ; 

-- Q23 : Calculate the experience in years for each programmers and. display along with the names in descending order.
SELECT * FROM PROGRAMMER;
select PNAME , timestampdiff(year,DOJ,now()) as Years  from PROGRAMMER order by Years desc; 

-- Q24 : Who are the programmers who celebrate their birthdays during the current month.
SELECT * FROM PROGRAMMER;
select PNAME,DOB from PROGRAMMER where month(DOB)= '03'; 

-- Q25 : How many female programmers are there
SELECT * FROM PROGRAMMER;
select count(PNAME) from PROGRAMMER where sex = 'F';

-- Q26 :  What are the languages by male programmers
SELECT * FROM PROGRAMMER;

select PNAME, PROF1 , PROF1 from PROGRAMMER where SEX = 'M';
SELECT PROF1 FROM PROGRAMMER WHERE SEX = 'M' UNION DISTINCT SELECT PROF2 FROM PROGRAMMER WHERE SEX = 'M';


-- Q27 : What is the average salary
select avg(SALARY) from programmer;

-- Q28 : How many people draw salary 2000 to 4000
select count(PNAME) from programmer where SALARY >= 2000 and SALARY <= 4000;


-- Q29 : Display the details of those who don’t know clipper Cobol or Pascal
SELECT * FROM PROGRAMMER;

select * FROM PROGRAMMER where PROF1 not in ('clipper' ,'Cobol', 'Pascal') and PROF2 not in ('clipper' ,'Cobol', 'Pascal');

-- Q30 : Display the cost of package developed by each programmer
SELECT * FROM SOFTWARE;
SELECT PNAME,SUM(DCOST) FROM SOFTWARE GROUP BY PNAME;


-- Q31 : Display the sales values of the packages developed by the each programmer
SELECT * FROM SOFTWARE;
select pname,sum(SCOST) from  SOFTWARE group by pname; 


-- Q32 :  Display the number of packages sold by each programmer
SELECT * FROM SOFTWARE;
select PNAME , count(SOLD) from SOFTWARE group by PNAME;

-- Q33 :  Display the sales cost of the packages developed by each programmer
select PNAME,sum(SCOST) from SOFTWARE group by PNAME; 

-- Q34 : Display the sales cost of the packages developed by each programmer language wise
select DEVELOPIN, sum(SCOST) from SOFTWARE group by  DEVELOPIN; 

-- Q35 : Display each language name with average development cost, average selling cost and average price per copy.
select DEVELOPIN,AVG(DCOST), AVG(SCOST) from SOFTWARE group by  DEVELOPIN;

-- Q36 : Display each programmers name costliest and cheapest packages developed.
SELECT * FROM SOFTWARE;

select pname, max(DCOST) as costliest , min(DCOST) as cheapest from SOFTWARE group by pname;

-- Q37 : Display each institute name with number of courses average cost per course.

SELECT * FROM STUDIES;

select INSTITUTE ,count(COURSE), avg(COURSEFEE) from STUDIES group by INSTITUTE; 

-- Q38 : Display each institute name with number of students.

select INSTITUTE , count(PNAME) from STUDIES group by INSTITUTE; 

-- Q39 : Display names of male and female programmers name and sex also 
SELECT * FROM PROGRAMMER;

select PNAME , SEX FROM PROGRAMMER where sex = 'M' union select PNAME ,SEX FROM PROGRAMMER where sex = 'F' ;

-- Q40 : Display the name of programmers and their packages
    SELECT * FROM SOFTWARE;
SELECT * FROM PROGRAMMER;

select PNAME , SALARY from programmer;

-- Q41:  Display the number of packages in each languages except c and c++
    SELECT * FROM SOFTWARE;

select DEVELOPIN , count(TITLE) from SOFTWARE where DEVELOPIN <> 'c' and DEVELOPIN <> 'c++' group by DEVELOPIN ; 

-- Q42: Display the number of packages in each language for which development cost is less than 1000.
SELECT * FROM SOFTWARE;
select DEVELOPIN , count(TITLE) from SOFTWARE where DCOST < 1000 group by DEVELOPIN;

-- Q43:  Display the average difference between Scost and Dcost for each package
select TITLE , avg (SCOST-DCOST)as avgdiff from SOFTWARE group by TITLE;

-- Q44: Display the total Scost, Dcost and amount to be recovered for each programmer for those whose Dcost has not yet been recovered.

-- Q45: Display highest, lowest and average salaries for those earning more than 2000.
SELECT * FROM PROGRAMMER;

select max(SALARY) , min(SALARY) , avg(SALARY) from PROGRAMMER where SALARY > 2000;

-- Q46:  Who is the highest paid in c programmers.
SELECT * FROM PROGRAMMER;
select * from PROGRAMMER where SALARY  = (select max(SALARY) from PROGRAMMER where PROF1 = 'C' or PROF2 = 'C' );

use advancesqlstudy;
-- Q47. Who is the highest paid female Cobol programmer
select * from PROGRAMMER where salary in (select max(SALARY) from PROGRAMMER where PROF1 = 'COBOL' or PROF2 = 'COBOL' );

-- 48. Display the names of the highest paid programmer for each language 
SELECT PROF1,PROF2, MAX(SALARY) AS MAXSAL, GROUP_CONCAT(PNAME ORDER BY SALARY DESC) AS Highest_paid_programmers from PROGRAMMER group by PROF1,PROF2;

-- 49. Who is the least experienced programmer
SELECT min(abs(TIMESTAMPDIFF(YEAR,DOB,DOJ))) AS LEAST_EXPERIENCE FROM PROGRAMMER;

-- 50. Who is the most experienced male programmer knowing Pascal
select * from PROGRAMMER;

SELECT MAX(ABS(TIMESTAMPDIFF(YEAR,DOB,DOJ))) AS MOST_EXPERIENCE FROM PROGRAMMER WHERE SEX = 'M'AND PROF1 OR PROF2 = 'PASCAL';