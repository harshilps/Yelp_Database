Select Y1.Yelp_Id,Y1.first_name from Yelp_User Y1 where Y1.birthdate=(Select min(y.birthdate)from Yelp_User Y where not exists(Select * from reviews R where R.author=Y.yelp_id));

