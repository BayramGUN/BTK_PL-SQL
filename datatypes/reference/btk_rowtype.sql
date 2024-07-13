-- %ROWTYPE
-- Scenario: FETCH ROW WHERE DEPARTMENT_ID IS 10 FROM HR.DEPARTMENTS TABLE.
-- Output: 10 Administration 200 1700

/*
-- DESCRIPTION OF HR.DEPARTMENTS TABLE --

Name            Null?    Type         
--------------- -------- ------------ 
DEPARTMENT_ID   NOT NULL NUMBER(4)    
DEPARTMENT_NAME NOT NULL VARCHAR2(30) 
MANAGER_ID               NUMBER(6)    
LOCATION_ID              NUMBER(4)  
*/

-- %ROWTYPE EXAMPLE --

DECLARE
    r_dept HR.DEPARTMENTS % ROWTYPE;
BEGIN
    SELECT 
        d.DEPARTMENT_ID,
        d.DEPARTMENT_NAME ,
        d.MANAGER_ID ,
        d.LOCATION_ID 
    INTO 
        r_dept
    FROM HR.DEPARTMENTS d
    WHERE d.DEPARTMENT_ID = 10;
    
    DBMS_OUTPUT.PUT_LINE(
        r_dept.DEPARTMENT_ID || ' ' ||
        r_dept.DEPARTMENT_NAME || ' ' ||
        r_dept.MANAGER_ID || ' ' ||
        r_dept.LOCATION_ID
    );
END;