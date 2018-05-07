Select C.business_cat_id,C.name,uniontable.BIDS,uniontable.BNAMES 
from (select business_cat_id,LISTAGG(business_id,',') within group (order by business_id) as BIDS,
LISTAGG(business_name,',') within group (order by business_name) as BNAMES 
from (
select * from 
(select b.business_id,business_name,b.business_cat_id,avg(rating)
from business b, reviews r
where b.business_id = r.business_id and business_cat_id = 'BCT1'
group by b.business_id, business_cat_id,business_name
order by avg(rating) desc
)where rownum <= 2
UNION
select * from 
(select b.business_id,business_name,b.business_cat_id,avg(rating)
from business b, reviews r
where b.business_id = r.business_id and business_cat_id = 'BCT2'
group by b.business_id, business_cat_id,business_name
order by avg(rating) desc
)where rownum <= 2
UNION
select * from 
(select b.business_id,business_name,b.business_cat_id,avg(rating)
from business b, reviews r
where b.business_id = r.business_id and business_cat_id = 'BCT3'
group by b.business_id, business_cat_id,business_name
order by avg(rating) desc
)where rownum <= 2
UNION
select * from 
(select b.business_id,business_name,b.business_cat_id,avg(rating)
from business b, reviews r
where b.business_id = r.business_id and business_cat_id = 'BCT4'
group by b.business_id, business_cat_id,business_name
order by avg(rating) desc
)where rownum <= 2
UNION
select * from 
(select b.business_id,business_name,b.business_cat_id,avg(rating)
from business b, reviews r
where b.business_id = r.business_id and business_cat_id = 'BCT5'
group by b.business_id, business_cat_id,business_name
order by avg(rating) desc
)where rownum <= 2
UNION
select * from 
(select b.business_id,business_name,b.business_cat_id,avg(rating)
from business b, reviews r
where b.business_id = r.business_id and business_cat_id = 'BCT6'
group by b.business_id, business_cat_id,business_name
order by avg(rating) desc
)where rownum <= 2
UNION
select * from 
(select b.business_id,business_name,b.business_cat_id,avg(rating)
from business b, reviews r
where b.business_id = r.business_id and business_cat_id = 'BCT7'
group by b.business_id, business_cat_id,business_name
order by avg(rating) desc
)where rownum <= 2
UNION
select * from 
(select b.business_id,business_name,b.business_cat_id,avg(rating)
from business b, reviews r
where b.business_id = r.business_id and business_cat_id = 'BCT8'
group by b.business_id, business_cat_id,business_name
order by avg(rating) desc
)where rownum <= 2
UNION    
select * from 
(select b.business_id,business_name,b.business_cat_id,avg(rating)
from business b, reviews r
where b.business_id = r.business_id and business_cat_id = 'BCT9'
group by b.business_id, business_cat_id,business_name
order by avg(rating) desc
)where rownum <= 2
UNION
select * from 
(select b.business_id,business_name,b.business_cat_id,avg(rating)
from business b, reviews r
where b.business_id = r.business_id and business_cat_id = 'BCT10'
group by b.business_id, business_cat_id,business_name
order by avg(rating) desc
)where rownum <= 2
UNION
select * from 
(select b.business_id,business_name,b.business_cat_id,avg(rating)
from business b, reviews r
where b.business_id = r.business_id and business_cat_id = 'BCT11'
group by b.business_id, business_cat_id,business_name
order by avg(rating) desc
)where rownum <= 2)
bctable group by business_cat_id) uniontable,Business_Category C where uniontable.business_cat_id = C.business_cat_id;

    




