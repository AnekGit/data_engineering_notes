select sysdate from dual ;
select trunc(sysdate) as d from dual;
select EXTRACT(MONTH FROM DATE to_date('02-MAR-22','dd-MON-yy')) year_ from dual ;
--2003-08-22

--Extract day month and year
select to_char(TO_DATE('02-MAR-2022','DD-MON-YYYY'),'DD')+1 as day_ from dual; 
select to_char(TO_DATE('02-MAR-2022','DD-MON-YYYY'),'MM')+1 as Month_ from dual;
select to_char(TO_DATE('02-MAR-2022','DD-MON-YYYY'),'yyyy')+1 as Year_ from dual;

--Extract day month and year
select TO_CHAR(TO_DATE('02-03-22','DD-MM-YY'),'W') week_of_month from dual;
select TO_CHAR(TO_DATE('02-03-22','DD-MM-yy'),'WW') week_of_year from dual ;

