Select * From(
Select B.Business_id,B.Business_name,avg(R.rating) AS average, count(B.Business_id) as reviewcount
from Business B,Reviews R
where R.Business_Id=B.Business_Id and B.city='San Jose'and B.state='CA'and R.author IN
(Select RE.author 
from Reviews RE
group by RE.author 
having count(RE.Review_Id)>10)
group by B.Business_Id,B.Business_name
Having count(B.Business_Id)>5
Order by reviewcount desc)
where rownum<=5;

