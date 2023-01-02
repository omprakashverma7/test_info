CREATE TABLE Employee(
    EmpId integer, 
    FirstName varchar(20), 
    LastName varchar(20), 
    Email varchar(25), 
    PhoneNo varchar(25), 
    Salary integer
);


INSERT INTO Employee VALUES(1,'John','King','john.king@abc.com','123.123.1834',33000);
INSERT INTO Employee(EmpId, FirstName, LastName)VALUES(2,'James','Bond');
INSERT INTO Employee VALUES (4,'Jyothi','Madhusudhan','Madhusudhan@test.com','123.456.4568',100000);
INSERT INTO Employee VALUES (5,'Khushi','Mulge','Khushi@test.com','123.456.4768',19000);
INSERT INTO Employee VALUES (6,'Savyatha','Reddy','Savyatha@test.com','123.486.4568',77000);
INSERT INTO Employee VALUES (7,'Vasanth','Kumar','Vasanth@test.com','123.4569.4568',97000);
INSERT INTO Employee VALUES (8,'Abdhulla','Shaik','Abdhulla@test.com','123.4056.4568',67000);
INSERT INTO Employee VALUES (9,'Vanamu','Giridhar','Vanamu@test.com','123.45637.4568',57000);


CREATE TABLE employee_clone as  select * from employee where 1=0;


create or replace PROCEDURE exchange_data 
is
    emp_id employee.empid%type;
    emp_firstname employee.firstname%type;
    emp_lastname employee.lastname%type;
    emp_salary employee.salary%type;
    cursor getdetails is
    select empid,firstname,lastname,salary from employee;
begin
    open getdetails;
    loop
    fetch getdetails into emp_id,emp_firstname,emp_lastname,emp_salary ;
    exit when getdetails%notfound;
    dbms_output.put_line(emp_id||' '||emp_firstname||' '||emp_lastname||' '||emp_salary);
    insert into employee_clone(empid,firstname,lastname,salary) values(emp_id,emp_firstname,emp_lastname,emp_salary); 
    end loop;
end;
--
select*from employee;
select*from employee_clone;
truncate table employee_clone;
execute exchange_data;




---------------------------------------------------------------------------------------------------------------------
create table salary (
    salary int
    );

create table salary (
    salary int
    );
create or replace procedure add_sal 
is
    cursor c is
    select salary from employee;
    res c%rowtype;
begin
    open c;
    loop
    fetch c into res;
    exit when c%notfound;
    insert into salary values res;
    end loop;
    close c;
end;


execute add_sal;


select * from salary;
--truncate table salary;
-----------------------------------------------------------------------------------------------------

create table tab1 (
    name varchar(20),
    age integer,
    gender varchar(10),
    

    
    );  
