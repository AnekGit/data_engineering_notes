-- replicate numbers.sql


WITH cte(n) as 
(        SELECT 65 FROM dual 
        UNION ALL
        SELECT n+1 FROM cte 
        WHERE n < = 69 
),
ds as (SELECT N ,row_number() over (ORDER BY N) AS row_num FROM cte )
SELECT * FROM ds a , ds b where a.ROW_NUM  >= b.ROW_NUM order by a.N  ;
--create table tt (N varchar2(11),ROW_NUM varchar2(11));