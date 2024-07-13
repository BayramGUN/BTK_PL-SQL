-- %TYPE
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

-- %TYPE EXAMPLE --

DECLARE
    /*
        -- DATATYPES ARE ENTERED STATICALLY --
    wdepartment_id            NUMBER(4);    
    wdepartment_name          VARCHAR2(30);
    wmanager_id               NUMBER(6);    
    wlocation_id              NUMBER(4);
    */
    wdepartment_id            HR.DEPARTMENTS.DEPARTMENT_ID % TYPE;    
    wdepartment_name          HR.DEPARTMENTS.DEPARTMENT_NAME % TYPE;
    wmanager_id               HR.DEPARTMENTS.MANAGER_ID % TYPE;
    wlocation_id              HR.DEPARTMENTS.LOCATION_ID % TYPE;
BEGIN
    SELECT 
        d.DEPARTMENT_ID,
        d.DEPARTMENT_NAME ,
        d.MANAGER_ID ,
        d.LOCATION_ID 
    INTO 
        wdepartment_id, 
        wdepartment_name, 
        wmanager_id, 
        wlocation_id
    FROM HR.DEPARTMENTS d
    WHERE d.DEPARTMENT_ID = 10;
    
    DBMS_OUTPUT.PUT_LINE(
        wdepartment_id || ' ' ||
        wdepartment_name || ' ' ||
        wmanager_id || ' ' ||
        wlocation_id
    );
END;
