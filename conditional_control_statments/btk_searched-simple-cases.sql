DECLARE
    birth_day  date := TO_DATE('21/05/1999', 'dd/mm/yyyy');
    age        number;
    birth_year number;
BEGIN
    age := floor((sysdate - birth_day) / 365);
    birth_year := to_number(to_char(birth_day, 'yyyy'));
    IF age < 15 THEN
        DBMS_OUTPUT.PUT_LINE('I am a child and I am in the Z generation. My current age is ' || age);
    ELSIF age < 18 THEN
        DBMS_OUTPUT.PUT_LINE('I am a teenager and I am in the Z generation. My current age is ' || age);
    ELSIF age < 50 THEN
        DBMS_OUTPUT.PUT_LINE('I am a middle-aged and my current age is ' || age);
        -- nested usage
        IF birth_year > 1996 THEN
            DBMS_OUTPUT.PUT_LINE('I am in the Z generation');
        ELSIF birth_year > 1979 THEN
            DBMS_OUTPUT.PUT_LINE('I am in the Y generation');
        ELSIF birth_year > 1964 THEN
            DBMS_OUTPUT.PUT_LINE('I am in the Z generation');
        ELSE
            DBMS_OUTPUT.PUT_LINE('I am a boomer!');        
        END IF;
    ELSE
        DBMS_OUTPUT.PUT_LINE('I am an old and my current age is ' || age);        
    END IF;
    
END;