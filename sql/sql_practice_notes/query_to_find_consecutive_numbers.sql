1. SQL to find the consecutive numbers 
===========================================
drop table t ;
create table t(c number);

insert into t values(6);
insert into t values(10);
insert into t values(11);
insert into t values(12);
insert into t values(57);
insert into t values(77);
insert into t values(98);
insert into t values(99);
insert into t values(100);
insert into t values(120);
insert into t values(125);

select c from (
				select 
				c,
				lead(c,1) over (order by c) c_lead,
				lag(c,1) over (order by c ) c_lag
				from t 
)
where c = c_lead-1 or c = c_lag+1;


c   lead lag
	
6	10	
10	11	6
11	12	10
12	57	11
57	77	12
77	98	57
98	99	77
99	100	98
100	120	99
120	125	100
125		120


2. how to find the consecutive negative tempratures in a city 
tectTFQ youtube 

city      temp        date 
London	  -1          2021-01-30
London	  -2          2021-02-02
London	  -1          2021-02-03
London	  -6          2021-02-04
London	   3          2021-03-30
London	  -1          2021-04-01
London	  -2          2021-04-02
London	  -8          2021-04-03

with t1 as (
            select * ,row_number() over () as row_num 
            from weather where temp <  0
           )
		   
	 t2 as (
			select t1.*,datediff(t1.date,row_num) as tdiff
			from t1 
	
	       )	   
     t3 as (
			select *,count(1) over(partition by tdiff order by temp) from t3 
				
	        )
		   
	select * from t3 ;
	
	
3. how to find the consecutive negative tempratures in a city 

city      temp   
London	  -1     
London	  -2     
London	  -1     
London	  -6     
London	   3     
London	  -1     
London	  -2     
London	  -8     

HINT :  apply row_number as PK in the table and follow above steps 






