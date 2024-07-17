-- LOOPS (BASIC & FOR & WHILE)


-- BASIC LOOP EXAMPLE 1
DECLARE
    counter     binary_integer;
    stop_when   binary_integer := &stop_when;
BEGIN
    LOOP
        counter := nvl(counter, 0) + 1;
        
        -- for continue
        /*
        IF mod(counter, 2) = 0
            THEN continue;
        END IF;
        */
        
        CONTINUE WHEN mod(counter, 2) != 0;
        
        dbms_output.put_line(counter);

        
        -- for exit
        /*
        IF counter = 5
            THEN exit;
        END IF;
        */
        EXIT WHEN counter = stop_when;
    END LOOP;
END;

-- BASIC LOOP EXAMPLE 2

/*
-- for create a courses table to use in basic loop example 2
CREATE TABLE HR.COURSES (
    course_id       number(3)
    ,course_name    varchar2(50)
    ,teacher        varchar2(50)
    ,start_date     date
    ,end_date       date
);
*/

DECLARE
    rec_default_courses     HR.COURSES%ROWTYPE;
BEGIN
    rec_default_courses.teacher := 'Bayram Gun';
    rec_default_courses.start_date := trunc(sysdate);
    rec_default_courses.end_date := rec_default_courses.start_date + 4;
    
    LOOP
        rec_default_courses.course_id := nvl(rec_default_courses.course_id, 0) + 1;
        
        EXIT WHEN rec_default_courses.course_id = 4;
        
        SELECT DECODE(rec_default_courses.course_id, 1, 'Oracle SQL'
                                                     ,2, 'PL/SQL'
                                                     ,3, 'ORACLE DBA')
        INTO rec_default_courses.course_name FROM DUAL;
        
        INSERT 
            INTO HR.COURSES ( course_id, course_name, teacher, start_date, end_date )
        VALUES (
            rec_default_courses.course_id
            ,rec_default_courses.course_name
            ,rec_default_courses.teacher
            ,rec_default_courses.start_date
            ,rec_default_courses.end_date
        );
        
        rec_default_courses.start_date := rec_default_courses.end_date + 1;
        rec_default_courses.end_date := rec_default_courses.start_date + 4;
    END LOOP;
    
    COMMIT;
END;


-- FOR LOOP EXAMPLE
DECLARE
    counter     binary_integer;
    start_when   binary_integer := &start_when;
    stop_when   binary_integer := &stop_when;
BEGIN
    IF start_when > stop_when 
        THEN dbms_output.put_line('Loop can not work');
    END IF;
    
    FOR counter 
        IN REVERSE start_when..stop_when 
    LOOP
        dbms_output.put_line(counter);
        --continue when counter = 13;
        --exit when counter = 23;
    END LOOP;
END;

-- CALCULATE FACTORIAL WITH FOR LOOP EXAMPLE

DECLARE
    factorial pls_integer := 1;
BEGIN
    FOR counter 
        IN 1..5 
    LOOP
        factorial := factorial * counter;
    END LOOP;
    
    dbms_output.put_line('5! = ' || factorial);
    
END;

-- NESTED USAGE
-- SCENARIO: 
--      -->Departments
--          -->Employees of departments

DECLARE
    d_manager   HR.EMPLOYEES.last_name%type;
BEGIN
    FOR d 
        IN (
            SELECT 
                department_id, 
                department_name,
                manager_id
            FROM HR.DEPARTMENTS 
            ORDER BY department_id
        )
    LOOP
    
        BEGIN     
            SELECT
                last_name
            INTO d_manager 
            FROM HR.EMPLOYEES
            WHERE employee_id = d.manager_id;
            
            EXCEPTION when no_data_found 
                THEN d_manager := null;         
        END;
        
        dbms_output.put_line('');
        dbms_output.put_line('Department No: ' || d.department_id || '      Department Name: ' || d.department_name || '     Manager: ' || d_manager);
        FOR e
            IN (
                SELECT 
                    employee_id, 
                    first_name, 
                    last_name
                FROM HR.EMPLOYEES
                WHERE department_id = d.department_id
            ) 
        LOOP
            dbms_output.put_line('      Employee No: ' || e.employee_id || '     Employee Full Name: ' || e.first_name || ' ' || e.last_name);        
        END LOOP;
    END LOOP;
END;


-- WHILE LOOP EXAMPLE

DECLARE
    date_1 date;
    date_2 date;
BEGIN
    date_1 := to_date('26/08/1071', 'dd/mm/YYYY');
    date_2 := last_day(date_1);
    WHILE 
        date_1 <= date_2 
    LOOP
        dbms_output.put_line(to_char(date_1, 'DAY') || ' ' || to_char(date_1, 'dd/mm/YYYY'));
        date_1 := date_1 + 1;
        
        --exit when date_1 > to_date('29/08/1071', 'dd/mm/YYYY');
    END LOOP;
END;


