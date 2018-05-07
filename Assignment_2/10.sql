Select Y2.yelp_id,Y2.first_name,Y2.last_name,Y2.email_id,gtable.statesvisited 
from (select LISTAGG(ftable.state,',') within group(order by ftable.state desc) as statesvisited,ftable.author from (select distinct B.state, ctable.count, ctable.author
from business B, reviews R,yelp_user Y1,
(select count(distinct state) as count,author from business B,reviews R where B.business_id = R.business_id group by author) ctable
where ctable.author = R.author and B.business_id = R.business_id and Y1.yelp_id = R.author and ctable.count >=3
order by ctable.count DESC, ctable.author ASC) ftable group by ftable.author) gtable ,yelp_user Y2 where gtable.author = Y2.yelp_id;

