-- Usage of Static SQL Comments (Static SQL - DML - SAVEPOINT - TCL) in PL/SQL

/*
  -- HR.EMPLOYEES_TWO DESCRIPTION --
Name           Null?    Type         
-------------- -------- ------------ 
EMPLOYEE_ID    NOT NULL NUMBER(6)    
FIRST_NAME              VARCHAR2(20) 
LAST_NAME      NOT NULL VARCHAR2(25) 
EMAIL          NOT NULL VARCHAR2(25) 
PHONE_NUMBER            VARCHAR2(20) 
HIRE_DATE      NOT NULL DATE         
JOB_ID         NOT NULL VARCHAR2(10) 
SALARY                  NUMBER(8,2)  
COMMISSION_PCT          NUMBER(2,2)  
MANAGER_ID              NUMBER(6)    
DEPARTMENT_ID           NUMBER(4)   
*/

DECLARE
    emp_id HR.EMPLOYEES_TWO.employee_id % TYPE;
    emp_first_name HR.EMPLOYEES_TWO.first_name % TYPE  := 'Bayram';
    emp_last_name HR.EMPLOYEES_TWO.last_name % TYPE    := 'GUN';
    emp_job_id HR.EMPLOYEES_TWO.job_id % TYPE          := 'PL/SQL';
BEGIN
    SELECT NVL(MAX(employee_id), 0) + 1 INTO emp_id FROM HR.EMPLOYEES_TWO;
    
    INSERT INTO HR.EMPLOYEES_TWO (
        employee_id,
        first_name,
        last_name,
        job_id,
        email,
        hire_date
    )
    VALUES (
        emp_id,
        emp_first_name,
        emp_last_name,
        emp_job_id,
        'temp@email.com',
        sysdate
    );
    
    UPDATE HR.EMPLOYEES_TWO 
    SET job_id = 'DBA'
    WHERE employee_id = emp_id;
    
    DELETE HR.EMPLOYEES_TWO 
    WHERE employee_id = emp_id
    RETURNING 
        employee_id, 
        first_name, 
        job_id 
    INTO emp_id, emp_first_name, emp_job_id;
    
    --ROLLBACK;
    COMMIT;
    
    dbms_output.put_line(
        'Hello' || ' ' ||
        emp_id || ' ' ||
        emp_first_name || ' ' || 
        emp_job_id
    );
    
END;


-- SAVEPOINT EXAMPLE --

/*
    -- REGIONS_TWO TABLE DESCRIPTION --
    
    Name        Null?    Type         
    ----------- -------- ------------ 
    REGION_ID   NOT NULL NUMBER       
    REGION_NAME          VARCHAR2(25)     
*/

DECLARE
BEGIN
    INSERT INTO HR.REGIONS_TWO(REGION_ID, REGION_NAME) VALUES ( 1, 'AVRUPA' );
    SAVEPOINT FIRST_POINT;
    
    INSERT INTO HR.REGIONS_TWO(REGION_ID, REGION_NAME) VALUES ( 2, 'ASYA' );
    SAVEPOINT SECOND_POINT;
    
    UPDATE HR.REGIONS_TWO SET REGION_NAME = 'ASIA' WHERE region_id = 2;
    SAVEPOINT THIRD_POINT;
    
    DELETE FROM REGIONS_TWO WHERE REGION_ID = 1;
    
    --ROLLBACK TO FIRST_POINT;
    --ROLLBACK TO SECOND_POINT;
    ROLLBACK TO THIRD_POINT;
    
    COMMIT;

END;
