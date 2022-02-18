-- 1 . Generate consecutive numbers  

WITH cte (n)
as 
(
select 1 from dual 
union all 
select n+1 from cte 
where n <= 4
)
select * from cte;


--2. Generate consecutive month interest rate

create table fd_interest(
FD_TYPE INT,
MONTH_START INT,
MONTH_END INT,
INTEREST Varchar2(5)
);

Insert into fd_interest
Select 1,1,4,'3%' from dual
Union ALL
Select 2,5,11,'4%' from dual
Union ALL
Select 3,12,15,'5%' from dual ;

select * from fd_interest;

WITH cte(fd_type,month_start,month_end,interest) AS
(
    SELECT fd_type, month_start ,month_end,interest from fd_interest
    UNION ALL
    SELECT fd_type ,month_start+1 ,month_end , interest from cte
    WHERE month_start <  month_end
)
select * from cte order by 1,2 ;


