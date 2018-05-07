Select B1.business_id,B1.business_name,Percentage from(select reviewtable.Business_Id,100*(counttable.rating_5_count/reviewtable.total) AS Percentage
from(SELECT Count(R.Review_Id)as total ,R.Business_Id
from Business B,Reviews R WHERE B.State='CA' and B.City='San Jose' and B.Business_Id=R.Business_Id
Group by R.Business_Id) reviewtable,
(SELECT count(R1.Review_Id) as rating_5_count,R1.Business_Id
from Reviews R1
where R1.rating=5
group by R1.Business_Id ) counttable
where reviewtable.Business_Id=counttable.Business_Id)A, Business B1
where A.business_id=B1.business_id
ORDER BY Percentage DESC;

