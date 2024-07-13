-- Show date value for today with unnamed/ananoymus block
-- they are not stored on the database

SET SERVEROUTPUT ON;

DECLARE
    wdate VARCHAR2(50);
BEGIN
    wdate := to_char(sysdate, 'DAY');
    dbms_output.put_line('Today is: ' || wdate);
END;

DECLARE
    wdate VARCHAR2(50);
BEGIN
    wdate := get_day_name(sysdate);
    dbms_output.put_line(concat('Today is ', lower(wdate)));
END;
