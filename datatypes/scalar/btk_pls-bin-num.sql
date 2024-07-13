-- pls_integer, binary_integer, number

DECLARE
    p_one PLS_INTEGER := 2147483647;
    p_two BINARY_INTEGER;
    
    n NUMBER;
BEGIN
    p_two := 0;
    n := p_one + p_two;
    DBMS_OUTPUT.PUT_LINE(n);
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(n, '999,999,999,999.99'));
END;

-- pls_integer, binary_integer, number overflow
DECLARE
    p_one BINARY_INTEGER := 2147483647;
    p_two PLS_INTEGER;
    
    n NUMBER;
BEGIN
    p_two := 1;
    n := p_one + p_two;
    DBMS_OUTPUT.PUT_LINE(n);
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(n, '999,999,999,999.99'));
END;

