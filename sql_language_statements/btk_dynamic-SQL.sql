-- usage of SQL scripts inside the PL/SQL scripts. (Dynamic SQL - DDL - DCL)


-- Create TEMP_TABLE:
DECLARE
    ddl_command varchar2(2000);
BEGIN
    
    ddl_command :=
        'create table TEMP_TABLE ( 
            product_id number(10), 
            product_name varchar2(30) 
        )';
    
    
    EXECUTE IMMEDIATE ddl_command;
    dbms_output.put_line('Table Created Successfully!');
END;
/
desc temp_table;


-- Add product_price column on the TEMP_TABLE
DECLARE
    ddl_command varchar2(2000);
BEGIN
    ddl_command := 'alter table temp_table add product_price number(15, 2)';
    
    EXECUTE IMMEDIATE ddl_command;
    dbms_output.put_line('Table Altered Successfully!');
END;
/
desc temp_table;

-- Give and revoke grant for an user
-- CREATE A USER NAMED BAYRAM (YOU MUST CONNECT ON DB WITH SYS USER)
CREATE USER BAYRAM IDENTIFIED BY GUN;

GRANT CONNECT, RESOURCE, UNLIMITED TABLESPACE TO BAYRAM;

DECLARE
    ddl_command varchar2(2000);
BEGIN
    --ddl_command := 'grant select on temp_table to BAYRAM';
    ddl_command := 'revoke select on temp_table from BAYRAM';
    execute immediate ddl_command;
    dbms_output.put_line('Grant gived to user Successfully!');
END;
/

-- drop table 
DECLARE
    ddl_command varchar2(2000);
BEGIN
    --ddl_command := 'grant select on temp_table to BAYRAM';
    ddl_command := 'drop table temp_table';
    execute immediate ddl_command;
    dbms_output.put_line('table dropped Successfully!');
END;
/

