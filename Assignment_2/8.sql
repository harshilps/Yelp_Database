Select business_id,business_name from business where business_name LIKE '%COFFEE%' AND STATE='CA'
UNION
Select business_id,business_name from business where business_name LIKE '%Coffee%' AND STATE='CA';

