--concat_previous_row
-- youtube : Siva Academy => https://www.youtube.com/watch?v=bDoRdi7T3u8&t=24s

create table concat(col1 varchar2(10),col2 varchar2(10));
insert into concat values ('A',1);
insert into concat values ('A',2);
insert into concat values ('A',3);
insert into concat values ('B',100);
insert into concat values ('B',200);
insert into concat values ('B',300);
insert into concat values ('B',400);

select * from concat;

with ds as (
            select 
            a.col1,
            a.col2,
            listagg(a.col2, ',') within group (order by a.col2) over (partition by a.col1) as agg,
            row_number() over (partition by a.col1 order by a.col2) as occ 
            from concat a
)
select col1 ,col2 , agg, occ ,
instr(agg||',' , ',' ,1,occ) comma_occ,

-- instr(agg||',' ...)
-- append comma so that in the comma_occ there should not be any zero and our results are streamlined 
-- debug prev step then revise 

-- instr(agg,',',1,occ)
-- 1st row => 1st occ of comma starting from position 1 
-- 2nd row => 2nd occ of comma starting from position 1 
-- 3rd row => 3rd occ of comma starting from position 1 

 
substr(agg,1,instr(agg||',' , ',' ,1,occ)-1)
from ds ; 




