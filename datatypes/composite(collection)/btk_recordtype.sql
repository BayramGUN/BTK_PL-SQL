-- Composite (Collection) Data Types (Example of Record Type)

-- Scenario: FETCH ROW WHERE DEPARTMENT_ID IS 10 FROM HR.DEPARTMENTS TABLE.
-- Output: 10 Administration 200 1700

/*
                        -- USAGE --
                        
    TYPE <type_name> IS RECORD (
                            <variable_name> <data_type>,
                            <variable_name> <data_type>,
                            <variable_name> <data_type>,
                            ...
                        );
*/



/*
-- DESCRIPTION OF HR.DEPARTMENTS TABLE --

Name            Null?    Type         
--------------- -------- ------------ 
DEPARTMENT_ID   NOT NULL NUMBER(4)    
DEPARTMENT_NAME NOT NULL VARCHAR2(30) 
MANAGER_ID               NUMBER(6)    
LOCATION_ID              NUMBER(4)  
*/

-- RECORD TYPE EXAMPLE --

DECLARE
    TYPE t_dept IS RECORD (
                    dept_id    HR.DEPARTMENTS.DEPARTMENT_ID % TYPE,
                    dept_name  HR.DEPARTMENTS.DEPARTMENT_NAME % TYPE,
                    mgr_id     HR.DEPARTMENTS.MANAGER_ID % TYPE NOT NULL DEFAULT 0                
                );
    r_dept2 t_dept;
BEGIN
    SELECT 
        d.DEPARTMENT_ID,
        d.DEPARTMENT_NAME ,
        d.MANAGER_ID
    INTO 
        r_dept2
    FROM HR.DEPARTMENTS d
    WHERE d.DEPARTMENT_ID = 10;
    
    DBMS_OUTPUT.PUT_LINE(
        r_dept2.dept_id || ' ' ||
        r_dept2.dept_name || ' ' ||
        r_dept2.mgr_id
    );
END;

