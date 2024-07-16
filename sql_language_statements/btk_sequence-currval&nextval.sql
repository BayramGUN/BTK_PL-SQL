-- Usage PseudoColumns (Carval, Nextval) (Squence)

/*
  -- HR.REGIONS TABLE DESCRIPTION
Name        Null?    Type         
----------- -------- ------------ 
REGION_ID   NOT NULL NUMBER       
REGION_NAME          VARCHAR2(25) 
*/


-- Sequence creation
create sequence
    test_seq
start with 5
increment by 1;

-- USE SEQUENCE
DECLARE
    seq_num number;
BEGIN
    seq_num := test_seq.nextval;
    insert into hr.regions (
        region_id, 
        region_name
    )
    values ( seq_num, 'Austuralia' );
    
    --dbms_output.put_line();
    
    seq_num := test_seq.currval;
    update hr.regions
    set region_name = 'Antarctica'
    where region_id = seq_num;
    
    commit;
END;

select * from hr.regions;
