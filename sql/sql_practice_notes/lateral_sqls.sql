select * from employee_details;

select 64+level,chr(64+level), ora_hash(chr(level+64)) from dual connect by level<=26;



select 'MAN',ora_hash('M') from dual  ;

select * from employee;
select * from department ;
select * from CUSTOMER_EXPENSE;

select
DEPTNO, 
DEPT_NAME ,
(select avg(emp_sal) from employee where employee.emp_deptno = department.deptno)
from department ;

select 
d.deptno,d.dept_name,round(e.avg_sal,2)
from department d ,LATERAL (select avg(emp_sal) avg_sal from employee WHERE employee.emp_deptno = d.deptno ) e;




select 
d.*,e.*
from department d ,(select emp_deptno ,avg(emp_sal) from employee group by employee.emp_deptno ) e
where e.emp_deptno = d.deptno;


select 
d.deptno,d.dept_name,e.avg
from department d ,(select emp_deptno ,avg(emp_sal) avg from employee group by employee.emp_deptno ) e
where e.emp_deptno = d.deptno;



select employee.emp_deptno ,avg(emp_sal) from employee group by employee.emp_deptno;