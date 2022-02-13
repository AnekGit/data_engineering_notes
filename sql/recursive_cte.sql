WITH cte (n)
as 
(
select 1 from dual 
union all 
select n+1 from cte 
where n <= 4
)
select * from cte;
