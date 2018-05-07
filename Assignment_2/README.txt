Name: Harshil Shah
Tables Created:

 table yelp_user;
 table business;
 table reviews;
 table business_Category;
 table business_has_category;
 table photo;
 table list_of_friends;
 table complimented_friends;
 table business has_rec_review;
 table user_has_review;
 table vote_review;
 table yelp_photo;
 table list_of_user;
 table business_category_table;
 table review_table;
 type compliment_type;
 type vote_type;
 type list_type;-
 type departmental_type;
 type music_type;
 type restaurant_type;
 type businesscat_type;
 type recommended_type;
 type notrecommended_type;
 type review_type;
 type compliment_type;
 type helpful_type;
 type businessreview_type; 


Assumptions:
	
 
 
 Execution Result:
 
 1. The compliment given to friends(compliment-type) is of the data : Place is Good, Place is Nice, Place is Wonderful, Good Place, Wonderful Place, Nice Place, Place is Moderate.
 2. The Description to the photos given is: Scenic [and it is given to the state (CA,OH,AZ,OH)]
 3. Helpful Review Description is "Helpful"
 4. The business review type is stated as "Visible"
 5. The following are the Business category types:- rqesturarent, Music, Departmental Store



 1. 
 
 BUSINESS_ID
--------------------------------------------------
BUSINESS_NAME					   REVIEW_COUNT     RATING
-------------------------------------------------- ------------ ----------
B2
AirBorne COFFEE 					      6 2.83333333

B1
Big Surf						      6 	 2

B6
Catch Your Big Break					      6        3.5


BUSINESS_ID
--------------------------------------------------
BUSINESS_NAME					   REVIEW_COUNT     RATING
-------------------------------------------------- ------------ ----------
B3
Pedley Richard Architect				      6 2.16666667

B5
SMITH THOMSON						      6 	 4

B4
Safelite AutoGlass					      6 2.33333333


BUSINESS_ID
--------------------------------------------------
BUSINESS_NAME					   REVIEW_COUNT     RATING
-------------------------------------------------- ------------ ----------
B23
The Table						      6 	 4

7 rows selected.



 2.
 
 BUSINESS_CAT_ID 				   REVIEWCOUNT
-------------------------------------------------- -----------
BCT5							    45
BCT10							    12
BCT3							     6
BCT2							     6
BCT4							     6
BCT6							     6
BCT1							     6
BCT7							     2
BCT8							     2
BCT9							     2
BCT11							     1

11 rows selected.



 3.

 YELP_ AVG(R.RATING)
----- -------------
Y1	 3.08333333
Y10		2.5
Y13		  5
Y2		3.5
Y3		3.5
Y4	 3.66666667
Y5	       3.75
Y6	 3.58333333
Y7	 3.33333333
Y8	 3.33333333
Y9	 3.33333333

11 rows selected.
 
 
 4.
 
 
BUSINESS_ID
--------------------------------------------------
BUSINESS_NAME					      AVERAGE REVIEWCOUNT
-------------------------------------------------- ---------- -----------
B3
Pedley Richard Architect			   2.16666667		6

B25
Breakfast Place 					    4		6

B6
Catch Your Big Break					  3.5		6


BUSINESS_ID
--------------------------------------------------
BUSINESS_NAME					      AVERAGE REVIEWCOUNT
-------------------------------------------------- ---------- -----------
B23
The Table						    4		6

B2
AirBorne COFFEE 				   2.83333333		6
 
 
 5.

BUSINESS_ID
--------------------------------------------------
BUSINESS_NAME					   PERCENTAGE
-------------------------------------------------- ----------
B22
Hobees							  100

B28
Holders Country Inn					  100

B27
Southern Kitchen					   80


 6.
 BUSINESS_CAT_ID
--------------------------------------------------
NAME
--------------------------------------------------
BIDS
--------------------------------------------------------------------------------
BNAMES
--------------------------------------------------------------------------------
BCT1
Amusement Parks
B1
Big Surf


BUSINESS_CAT_ID
--------------------------------------------------
NAME
--------------------------------------------------
BIDS
--------------------------------------------------------------------------------
BNAMES
--------------------------------------------------------------------------------
BCT10
Bars
B14,B15
Alexs 49er Inn,Red Stag Lounge


BUSINESS_CAT_ID
--------------------------------------------------
NAME
--------------------------------------------------
BIDS
--------------------------------------------------------------------------------
BNAMES
--------------------------------------------------------------------------------
BCT11
Burgers
B11
In-N-Out Burger


BUSINESS_CAT_ID
--------------------------------------------------
NAME
--------------------------------------------------
BIDS
--------------------------------------------------------------------------------
BNAMES
--------------------------------------------------------------------------------
BCT2
Gymnastics
B2
AirBorne COFFEE


BUSINESS_CAT_ID
--------------------------------------------------
NAME
--------------------------------------------------
BIDS
--------------------------------------------------------------------------------
BNAMES
--------------------------------------------------------------------------------
BCT3
Architects
B3
Pedley Richard Architect


BUSINESS_CAT_ID
--------------------------------------------------
NAME
--------------------------------------------------
BIDS
--------------------------------------------------------------------------------
BNAMES
--------------------------------------------------------------------------------
BCT4
Windshield
B4
Safelite AutoGlass


BUSINESS_CAT_ID
--------------------------------------------------
NAME
--------------------------------------------------
BIDS
--------------------------------------------------------------------------------
BNAMES
--------------------------------------------------------------------------------
BCT5
Breakfast and Brunch
B22,B28
Hobees,Holders Country Inn


BUSINESS_CAT_ID
--------------------------------------------------
NAME
--------------------------------------------------
BIDS
--------------------------------------------------------------------------------
BNAMES
--------------------------------------------------------------------------------
BCT6
Career Counseling
B6
Catch Your Big Break


BUSINESS_CAT_ID
--------------------------------------------------
NAME
--------------------------------------------------
BIDS
--------------------------------------------------------------------------------
BNAMES
--------------------------------------------------------------------------------
BCT7
Coffee Shops
B7
Bay Area Coffee Shop


BUSINESS_CAT_ID
--------------------------------------------------
NAME
--------------------------------------------------
BIDS
--------------------------------------------------------------------------------
BNAMES
--------------------------------------------------------------------------------
BCT8
Food and More
B8
China  Coffee Toffee


BUSINESS_CAT_ID
--------------------------------------------------
NAME
--------------------------------------------------
BIDS
--------------------------------------------------------------------------------
BNAMES
--------------------------------------------------------------------------------
BCT9
Pool Cleaners
B9
Hastings Water Works


11 rows selected.

 
 7.
YELP_ FIRST_NAME
----- --------------------------------------------------
Y11   Maria



8.
BUSINESS_ID
--------------------------------------------------
BUSINESS_NAME
--------------------------------------------------
B12
Coffee Bar and Bistro

B2
AirBorne COFFEE

B7
Bay Area Coffee Shop


BUSINESS_ID
--------------------------------------------------
BUSINESS_NAME
--------------------------------------------------
B8
China  Coffee Toffee
 
 
 9.
 RATING BUSIN BUSINESS_NAME
---------- ----- --------------------------------------------------
BUSINESS_CAT_ID 					  AGE YELP_
-------------------------------------------------- ---------- -----
REVIEW_ID					       RATING AUTHO PUBLISH_D
-------------------------------------------------- ---------- ----- ---------
FRIEN REVIE BUSIN      FUNNY	   COOL     USEFUL
----- ----- ----- ---------- ---------- ----------
	 5 B15	 Red Stag Lounge
BCT10							   22 Y13
R25							    5 Y13   01-OCT-15
Y8    R     B15 	   0	      1 	 0


    RATING BUSIN BUSINESS_NAME
---------- ----- --------------------------------------------------
BUSINESS_CAT_ID 					  AGE YELP_
-------------------------------------------------- ---------- -----
REVIEW_ID					       RATING AUTHO PUBLISH_D
-------------------------------------------------- ---------- ----- ---------
FRIEN REVIE BUSIN      FUNNY	   COOL     USEFUL
----- ----- ----- ---------- ---------- ----------
	 5 B16	 JJs Blues
BCT10							   22 Y13
R26							    5 Y13   01-OCT-15
Y8    R     B16 	   0	      0 	 1


    RATING BUSIN BUSINESS_NAME
---------- ----- --------------------------------------------------
BUSINESS_CAT_ID 					  AGE YELP_
-------------------------------------------------- ---------- -----
REVIEW_ID					       RATING AUTHO PUBLISH_D
-------------------------------------------------- ---------- ----- ---------
FRIEN REVIE BUSIN      FUNNY	   COOL     USEFUL
----- ----- ----- ---------- ---------- ----------
	 5 B18	 Trials Pub
BCT10							   22 Y13
R28							    5 Y13   01-OCT-15
Y8    R     B18 	   0	      1 	 0


    RATING BUSIN BUSINESS_NAME
---------- ----- --------------------------------------------------
BUSINESS_CAT_ID 					  AGE YELP_
-------------------------------------------------- ---------- -----
REVIEW_ID					       RATING AUTHO PUBLISH_D
-------------------------------------------------- ---------- ----- ---------
FRIEN REVIE BUSIN      FUNNY	   COOL     USEFUL
----- ----- ----- ---------- ---------- ----------
	 5 B19	 Santa Cruz Wine Bar
BCT10							   22 Y13
R29							    5 Y13   01-OCT-15
Y8    R     B19 	   0	      0 	 1


    RATING BUSIN BUSINESS_NAME
---------- ----- --------------------------------------------------
BUSINESS_CAT_ID 					  AGE YELP_
-------------------------------------------------- ---------- -----
REVIEW_ID					       RATING AUTHO PUBLISH_D
-------------------------------------------------- ---------- ----- ---------
FRIEN REVIE BUSIN      FUNNY	   COOL     USEFUL
----- ----- ----- ---------- ---------- ----------
	 5 B20	 Firehouse No 1 Gastropub
BCT10							   22 Y13
R30							    5 Y13   01-OCT-15
Y8    R     B20 	   1	      0 	 0


    RATING BUSIN BUSINESS_NAME
---------- ----- --------------------------------------------------
BUSINESS_CAT_ID 					  AGE YELP_
-------------------------------------------------- ---------- -----
REVIEW_ID					       RATING AUTHO PUBLISH_D
-------------------------------------------------- ---------- ----- ---------
FRIEN REVIE BUSIN      FUNNY	   COOL     USEFUL
----- ----- ----- ---------- ---------- ----------
	 5 B21	 Original Gravity Public House
BCT10							   22 Y13
R31							    5 Y13   01-OCT-15
Y8    R     B21 	   0	      1 	 0


    RATING BUSIN BUSINESS_NAME
---------- ----- --------------------------------------------------
BUSINESS_CAT_ID 					  AGE YELP_
-------------------------------------------------- ---------- -----
REVIEW_ID					       RATING AUTHO PUBLISH_D
-------------------------------------------------- ---------- ----- ---------
FRIEN REVIE BUSIN      FUNNY	   COOL     USEFUL
----- ----- ----- ---------- ---------- ----------
	 5 B22	 Hobees
BCT5							   22 Y13
R32							    5 Y13   01-OCT-15
Y8    R     B22 	   0	      0 	 1


    RATING BUSIN BUSINESS_NAME
---------- ----- --------------------------------------------------
BUSINESS_CAT_ID 					  AGE YELP_
-------------------------------------------------- ---------- -----
REVIEW_ID					       RATING AUTHO PUBLISH_D
-------------------------------------------------- ---------- ----- ---------
FRIEN REVIE BUSIN      FUNNY	   COOL     USEFUL
----- ----- ----- ---------- ---------- ----------
	 5 B12	 Coffee Bar and Bistro
BCT10							   22 Y13
R22							    5 Y13   01-OCT-15
Y8    R     B12 	   0	      1 	 0


    RATING BUSIN BUSINESS_NAME
---------- ----- --------------------------------------------------
BUSINESS_CAT_ID 					  AGE YELP_
-------------------------------------------------- ---------- -----
REVIEW_ID					       RATING AUTHO PUBLISH_D
-------------------------------------------------- ---------- ----- ---------
FRIEN REVIE BUSIN      FUNNY	   COOL     USEFUL
----- ----- ----- ---------- ---------- ----------
	 5 B17	 The Bears Cocktails
BCT10							   22 Y13
R27							    5 Y13   01-OCT-15
Y8    R     B17 	   1	      0 	 0



 10.
 
 YELP_ FIRST_NAME
----- --------------------------------------------------
LAST_NAME
--------------------------------------------------
EMAIL_ID
--------------------------------------------------
STATESVISITED
--------------------------------------------------------------------------------
Y13   Kelley
Abraham
kell@gmail.com
VA,OH,CA,AZ