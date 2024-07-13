-- Exception Block Example 2

declare
    wdepartment_name varchar2(30);
begin
    -- Exception works on function
    wdepartment_name := get_deparment_name(78);
    
    dbms_output.put_line(wdepartment_name);
end;