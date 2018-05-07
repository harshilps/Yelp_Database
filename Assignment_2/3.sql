select Y.Yelp_Id, avg(R.rating) from reviews R,Yelp_User Y where R.Author=Y.Yelp_Id GROUP BY Y.Yelp_Id
ORDER BY Y.Yelp_Id;
