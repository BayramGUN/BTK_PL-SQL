create or replace function get_deparment_name(p_dep_no in number)
return varchar2
is
    wdepartment_name varchar(30);
begin
    select
        d.department_name into wdepartment_name
    from hr.departments d
    where d.department_id = p_dep_no;
    return (wdepartment_name);
    
    exception when no_data_found then
        return('Can not found any data with ' || p_dep_no);
end;