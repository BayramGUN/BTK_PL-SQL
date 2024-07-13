-- EXCEPTION BLOCKS

/*
-- create divide function script
create or replace function divide(first_number in number, second_number in number) 
    return number
is
res number;
begin
    res := first_number / second_number;
    return(res);
end;
*/

declare
    d number;
begin
    d := divide(10, 0);
    dbms_output.put_line(d);
    exception when zero_divide then
        dbms_output.put_line(
            concat('Can not divide with 0 (zero)! ' || chr(10), 
            ('Message: ' || sqlerrm))   
        );
end;