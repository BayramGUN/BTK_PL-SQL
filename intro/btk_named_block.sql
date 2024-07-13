-- Show date value for today with named block
-- they are stored on the database
create or replace function get_day_name(P_DATE date) return varchar2
is

begin
    return(to_char(P_DATE, 'DAY'));
end;

select get_day_name(sysdate) from dual;