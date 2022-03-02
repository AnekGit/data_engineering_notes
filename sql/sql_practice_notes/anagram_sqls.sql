
--  corner case 'MAN' s1 ,'TAG' s2
with ds as (select 'MAN' s1 ,'NAM' s2  FROM DUAL )

select s1,s2,sum(a1) sum1 ,sum(a2) sum2,

case when sum(a1) = sum(a2)
 then 'valid anagram'
 else
 'Not valid Anagram' end as result
 
from (

select s1,s2,

--substr(s1,level,1) c1 ,substr(s2,level,1) c2 ,

ascii(substr(s1,level,1)) a1,ascii(substr(s2,level,1)) a2


from 

ds connect by level<=length(s1)

) group by s1,s2;