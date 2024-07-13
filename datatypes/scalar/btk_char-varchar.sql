DECLARE
    wfirst_name CHAR(15);
    wlast_name VARCHAR(15);
BEGIN
    wfirst_name := 'Bayram';
    wlast_name  := 'GUN';
    
    DBMS_OUTPUT.PUT_LINE('*' || wfirst_name || '*');
    DBMS_OUTPUT.PUT_LINE('*' || wlast_name || '*');
END;