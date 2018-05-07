Select * from 
(select avgtable.rating,avgtable.business_id,B.business_name,B.business_cat_id from 
(select avg(rating)as rating,business_id from reviews group by business_id order by rating desc) avgtable , Business B
where avgtable.Business_id = B.Business_id and avgtable.rating=5) fivestar,
(select * from
(select * from(select round(months_between(sysdate,birthdate)/12) as age,Yelp_Id from Yelp_User)  where age <=25 and age >=15 order by age desc) agetable ,Reviews R where R.Author = agetable.Yelp_Id ) usersage where fivestar.Business_id = usersage.Business_Id;

