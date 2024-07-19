-- CURSORS - Implicit Cursors (SQL%FOUND, SQL%NOTFOUND, SQL%ROWCOUNT)

-- create table hr.employees2 as select * from hr.employees;


-- DQL SELECT Example
DECLARE
    rec_emp hr.employees%rowtype;
BEGIN
   select * into rec_emp from hr.employees2 where employee_id = 100; 
   
   
   if sql%found 
        then
            dbms_output.put_line('There is ' || sql%rowcount || ' record from sql%found!');
   else
        dbms_output.put_line('There is ' || sql%rowcount || ' record  from sql%found!');
   end if;
   
   if sql%notfound 
        then
            dbms_output.put_line('There is ' || sql%rowcount || ' record from sql%notfound!');
   else
        dbms_output.put_line('There is ' || sql%rowcount || ' record from sql%notfound!');
   end if;
   
   exception when no_data_found then
        dbms_output.put_line('There is ' || sql%rowcount || ' record from exception!');
END;
