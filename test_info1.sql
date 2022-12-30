create or replace package test_pkg 
is
PROCEDURE exchange_data;
procedure add_sal ;

end test_pkg;

create or replace package body test_pkg 
is
PROCEDURE exchange_data 
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

procedure add_sal 
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

end test_pkg;
/
create or replace procedure  git is 
begin 
dbms_output.put_line('Git basic');
end;
/
set serverout on ;
/

execute git;