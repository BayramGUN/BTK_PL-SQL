-- CURSORS - Explicit Cursors - Developer-Defined Cursors

DECLARE
    CURSOR c_empl IS select employee_id, last_name from hr.employees;
    wempl_id hr.employees.employee_id%type;
    wlast_name hr.employees.last_name%type;
BEGIN
    OPEN c_empl; -- memory allocated for c_empl CURSOR
        LOOP
            FETCH c_empl into wempl_id, wlast_name;
            EXIT WHEN c_empl%NOTFOUND;
            dbms_output.put_line(c_empl%ROWCOUNT || '-) Empl NO: ' || wempl_id || ' Last Name: ' || wlast_name);
        END LOOP;
    CLOSE c_empl; -- memory relased from c_empl CURSOR
END;

/*
    DEVELOPER-DEFINED CURSOR ATTRIBUTES STATUS INFORMATION
    
    - CURSOR -   - TYPE -     - DESCRIPTION -   
                
    %ISOPEN     (BOOLEAN)     : IF CURSOR IS OPEN, IT RETURNS TRUE, ELSE FALSE
    %NOTFOUND   (BOOLEAN)     : IF THERE IS NO RECORD THAT IT WILL BE ABLE TO FETCH, RETURNS TRUE, ELSE FALSE
    %FOUND      (BOOLEAN)     : IF THERE ARE ANY RECORD THAT THEY WILL BE ABLE TO FETCH, RETURNS TRUE, ELSE FALSE
    %ROWCOUNT   (NUMBER)      : COUNT OF RECORDS THAT THEY ARE FETCHED
*/

DECLARE
    CURSOR c_empl IS (select 
                        * 
                      from hr.employees);
    
    wempl_id hr.employees.employee_id%type;
    wlast_name hr.employees.last_name%type;
BEGIN
    if not c_empl%ISOPEN then
        OPEN c_empl; -- memory allocated for c_empl CURSOR
    end if;
        LOOP
            FETCH c_empl into wempl_id, wlast_name;
            EXIT WHEN c_empl%NOTFOUND or c_empl%ROWCOUNT > 10;
            dbms_output.put_line(c_empl%ROWCOUNT || '-) Empl NO: ' || wempl_id || ' Last Name: ' || wlast_name);
        END LOOP;
    if c_empl%ISOPEN then
        CLOSE c_empl; -- memory relased from c_empl CURSOR
    end if;
END;

-- CURSORS and RECORDS (REFERENCE DATA TYPE % TYPE)

DECLARE
    CURSOR c_empl IS select * from hr.employees;
    r_read c_empl%ROWTYPE;
BEGIN
    if not c_empl%ISOPEN then
        OPEN c_empl; -- memory allocated for c_empl CURSOR
    end if;
        LOOP
            FETCH c_empl into r_read;
            EXIT WHEN c_empl%NOTFOUND or c_empl%ROWCOUNT > 107;
            dbms_output.put_line(c_empl%ROWCOUNT 
                                || '-) Empl NO: ' 
                                || r_read.employee_id 
                                || ' Last Name: ' 
                                || r_read.last_name
                                || ' Firs Name: ' 
                                || r_read.first_name);
        END LOOP;
    if c_empl%ISOPEN then
        dbms_output.put_line('Cursor is closing...');
        CLOSE c_empl; -- memory relased from c_empl CURSOR
        dbms_output.put_line('Cursor closed...');        
    end if;
END;

-- Cursors in for loop

DECLARE
    CURSOR c_empl IS select * from hr.employees;
    
BEGIN
    FOR r_read 
        IN c_empl
    LOOP
        dbms_output.put_line(c_empl%ROWCOUNT 
                                || '-) Empl NO: ' 
                                || r_read.employee_id 
                                || ' Last Name: ' 
                                || r_read.last_name
                                || ' Firs Name: ' 
                                || r_read.first_name);
    END LOOP;
END;

DECLARE    
BEGIN
    FOR r_read 
        IN (select * from hr.employees)
    LOOP
        dbms_output.put_line('Empl NO: ' 
                                || r_read.employee_id 
                                || ' Last Name: ' 
                                || r_read.last_name
                                || ' Firs Name: ' 
                                || r_read.first_name);
    END LOOP;
END;

-- USAGE OF FOR UPDATE AND WHERE CURRENT IN CURSORS

-- SCENARIO: Employees whose salary is less than $5000 will receive a 20% raise.

/*
create table hr.employees2 as select * from hr.employees;
*/

DECLARE
    CURSOR c_empl IS (select * from hr.employees2) FOR UPDATE of salary;
BEGIN
    FOR r_empl
        IN c_empl
    LOOP
        IF r_empl.salary < 5000
            THEN
                UPDATE hr.employees2 
                SET salary = salary * 1.2
                --WHERE employee_id = r_empl.employee_id;
                WHERE CURRENT OF c_empl;
        END IF;
    END LOOP;
    COMMIT;
END;


--select * from hr.employees2 where salary < 5000;

-- USAGE PARAMETERS IN CURSORS (CURSORS WITH PARAMETERS)
DECLARE
    CURSOR c_empl( wdeptno hr.employees.department_id%TYPE DEFAULT 90 ) IS (select 
                        employee_id, 
                        last_name 
                      from hr.employees
                      where department_id = wdeptno);
    r_empl c_empl%ROWTYPE;
BEGIN
    IF NOT c_empl%ISOPEN
        THEN OPEN c_empl(30);
    END IF;
    LOOP
        FETCH c_empl INTO r_empl;
        EXIT WHEN c_empl%NOTFOUND;   
        dbms_output.put_line(r_empl.employee_id || ' ' || r_empl.last_name);
    END LOOP;
    IF c_empl%ISOPEN
        THEN CLOSE c_empl;
    END IF;    
END;

