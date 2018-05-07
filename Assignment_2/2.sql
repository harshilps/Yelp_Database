Select B.Business_Cat_Id, count(R.Business_Id ) as reviewcount
from Reviews R,Business_category BC, Business B
where
R.Business_id=B.business_id
and BC.business_cat_id=B.business_Cat_Id
group by B.Business_Cat_Id
order by reviewcount desc;

