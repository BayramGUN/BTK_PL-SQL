-- STATEMENT CONTROL CASES (Searched Case & Simple Case)


-- Searched Case Example
DECLARE
    birth_day  date := TO_DATE('21/05/1999', 'dd/mm/yyyy');
    age        number;
    birth_year number;
    output     varchar(1000);
BEGIN
    age := floor((sysdate - birth_day) / 365);
    birth_year := to_number(to_char(birth_day, 'yyyy'));
    CASE
        WHEN age < 15 
            THEN output := 'I am a child and I am in the Z generation. My current age is ' || age;
        WHEN age < 18 
            THEN output := 'I am a teenager and I am in the Z generation. My current age is ' || age;
                 
        WHEN age < 50 
            THEN output := 'I am a middle-aged and my current age is ' || age;
            CASE --nested usage
                WHEN birth_year > 1996 
                    THEN DBMS_OUTPUT.PUT_LINE('I am in Z generation');
            END CASE;
        ELSE
            output := 'I am an old and my current age is ' || age;        
    END CASE;
        
    DBMS_OUTPUT.PUT_LINE(output);
    
END;

-- Simple Case Example

DECLARE
    check_number    number  := &check_number;
    output          varchar2(2000) := 'No output!';
BEGIN
    CASE mod(check_number, 2)
        WHEN 1 THEN output := check_number ||' is odd number!';
        ELSE output := check_number || ' is even number!';
    END CASE;
    DBMS_OUTPUT.PUT_LINE(output);
END;