Select * 
from
(select distinct B.business_id,B.business_name,B.review_count,B2.rating from Business B,
(select avg(rating) AS rating , count(review_id),business_id from Reviews group by Business_Id) B2
where B.state='CA' AND B.city='San Jose' AND B.open='T' AND B2.Business_Id=B.Business_Id  
order by Review_count DESC) 
where rownum<=7;

