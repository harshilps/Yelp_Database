CREATE TABLE Yelp_User(
			Yelp_Id varchar(5) PRIMARY KEY,
			Email_Id varchar(50) NOT NULL,
			First_Name varchar(50) NOT NULL,
			Last_Name varchar(50) NOT NULL,
			Birthdate date NOT NULL,
			Birthplace varchar(50) NOT NULL,
			Gender char(1) check (gender in ('F','M')) 
			);
CREATE TABLE Business(
			Business_Id varchar(50) PRIMARY KEY,
			Business_Name varchar(50) NOT NULL,
			City varchar(50) NOT NULL,
			State varchar(50) NOT NULL,
			Phone_No varchar(50) NOT NULL,
            Business_Cat_Id varchar(50),
			Open varchar(1) check (open in ('T','F')),
            Review_Count NUMBER(10)
			);
CREATE TABLE Reviews(
			Review_Id varchar(50) PRIMARY KEY,
			Rating NUMBER(5) CHECK (Rating >=1 and Rating <=5) NOT NULL,
			Author varchar(5) NOT NULL,
			Publish_Date date NOT NULL,
			Friend_list_vote varchar(5) NOT NULL,
			Review_type varchar(5) NOT NULL,
			Business_Id varchar(5) NOT NULL,
			Funny NUMBER(1)NOT NULL,
			Cool NUMBER(1) NOT NULL,
			Useful NUMBER(1) NOT NULL,
 			FOREIGN KEY (Author) REFERENCES Yelp_User(Yelp_Id)
            ON DELETE SET NULL,
			FOREIGN KEY (Business_Id) REFERENCES Business(Business_Id)
            ON DELETE SET NULL 
			);

CREATE TABLE Business_Category(
			Business_Cat_Id varchar(50) PRIMARY KEY,
			Name varchar(50) NOT NULL);

CREATE TABLE Business_Has_Category(
			Business_Id varchar(50) NOT NULL,
			BC_Id varchar(50) NOT NULL,
			FOREIGN KEY (BC_Id)REFERENCES Business_Category(Business_Cat_Id),
			FOREIGN KEY (Business_Id)REFERENCES Business(Business_Id) ON DELETE SET NULL
			);
CREATE TABLE Photo(
			Photo_Id varchar(50) PRIMARY KEY,
			Photo_Description varchar(50) NOT NULL,
			location varchar(50) NOT NULL
			);
CREATE TABLE List_Of_Friends(
			Yelp_Id varchar(5) NOT NULL,
			Friends_ID varchar(5) NOT NULL,
			FOREIGN KEY (Yelp_Id) REFERENCES Yelp_User(Yelp_Id) ON DELETE SET NULL,
			FOREIGN KEY (Friends_Id) REFERENCES Yelp_User(Yelp_Id) ON DELETE SET NULL
			);
CREATE TABLE Complimented_Friends(
			Yelp_Id varchar(5) NOT NULL,
			Friends_ID varchar(5) NOT NULL,
			Compliment varchar(50) NOT NULL,
			FOREIGN KEY (Yelp_Id) REFERENCES Yelp_User(Yelp_Id) ON DELETE SET NULL,
			FOREIGN KEY (Friends_Id) REFERENCES Yelp_User(Yelp_Id) ON DELETE SET NULL
			);

CREATE TABLE Business_Has_Rec_Review(
			Business_Id varchar(50) NOT NULL,
			Rec_notRec varchar(50) NOT NULL,
			FOREIGN KEY (Business_Id)REFERENCES Business(Business_Id) ON DELETE SET NULL
			);



CREATE TABLE User_Has_Review(
			Yelp_Id varchar(50) NOT NULL,
			Review_Id varchar(50) NOT NULL,
			FOREIGN KEY (Yelp_Id) REFERENCES Yelp_User(Yelp_Id) ON DELETE SET NULL,
			FOREIGN KEY (Review_Id) REFERENCES Reviews(Review_Id) ON DELETE SET NULL
			);
CREATE TABLE Vote_Review(
			Review_Id varchar(50) NOT NULL,
			Yelp_Id varchar(50) NOT NULL,
			Funny varchar(50) NOT NULL,
			Cool varchar(50) NOT NULL,
			Useful varchar(50) NOT NULL,
			FOREIGN KEY (Yelp_Id) REFERENCES Yelp_User(Yelp_Id) ON DELETE SET NULL,
			FOREIGN KEY (Review_Id) REFERENCES Reviews(Review_Id) ON DELETE SET NULL
			);

CREATE TABLE Yelp_Photo(
			Photo_Id varchar(50) NOT NULL,
            Yelp_Id varchar(50) NOT NULL,
            Business_Id varchar(50) NOT NULL,
			FOREIGN KEY (Yelp_Id) REFERENCES Yelp_User(Yelp_Id),
			FOREIGN KEY (Photo_Id) REFERENCES Photo(Photo_Id) ON DELETE SET NULL,
            FOREIGN KEY (Business_Id) REFERENCES Business(Business_Id) ON DELETE SET NULL
			);


insert into Yelp_User values('Y1','john@yahoo.com','John','Smith',TO_DATE('12/12/1992','MM/DD/YYYY'),'LAKE CITY,FL 32056','M');
insert into Yelp_User values('Y2','juan@gmail.com','Juan','Carlos',TO_DATE('2/7/1988','MM/DD/YYYY'),'Adak,AK 99546','M');
insert into Yelp_User values('Y3','Jane@gmail.com','Jane','Chapel',TO_DATE('6/1/1980','MM/DD/YYYY'),'VERNON HILLS,IL 60061','F');
insert into Yelp_User values('Y4','adi@yahoo.com','Aditya','Awasthi',TO_DATE('4/12/1964','MM/DD/YYYY'),'SAN FRANCISCO, CA 94102','M');
insert into Yelp_User values('Y5','james@hotmail.com','James','Williams',TO_DATE('5/5/1991','MM/DD/YYYY'),'NEW YORK ,NY 10010','M');
insert into Yelp_User values('Y6','mike@yahoo.com','Mike','Brown',TO_DATE('3/1/1988','MM/DD/YYYY'),'CEDAR FALLS, NC 27230','M');
insert into Yelp_User values('Y7','bob@yahoo.com','Bob','Jones',TO_DATE('2/19/1970','MM/DD/YYYY'),'FISHERS ISLAND,NY 06390','M');
insert into Yelp_User values('Y8','wei@gmail.com','Wei','Zhang',TO_DATE('3/18/1975','MM/DD/YYYY'),'LAS VEGAS,NV 89030','F');
insert into Yelp_User values('Y9','mark@gmail.com','Mark','Davis',TO_DATE('11/2/1945','MM/DD/YYYY'),'LOS ANGELES,CA 90007','M');
insert into Yelp_User values('Y10','daniel@yahoo.com','Daniel','Garcia',TO_DATE('5/10/1984','MM/DD/YYYY'),'CALDWELL,NJ 07004','M');
insert into Yelp_User values('Y11','maria@hotmail.com','Maria','Rodriguez',TO_DATE('8/12/1985','MM/DD/YYYY'),'LOS ANGELES,CA 90007','F');
insert into Yelp_User values('Y12','freya@yahoo.com','Freya','Wilson',TO_DATE('10/5/1990','MM/DD/YYYY'),'CLIFFSIDE PARK ,NJ 07010','F');
insert into Yelp_User values('Y13','kell@gmail.com','Kelley','Abraham',TO_DATE('11/27/1995','MM/DD/YYYY'),'REDONDO BEACH,CA 90278','F');

insert into Business values('B1','Big Surf','San Jose','CA','(520)622-6400','BCT1','T','6');
insert into Business values('B2','AirBorne COFFEE','San Jose','CA','(408) 524-3580','BCT2','T','6');
insert into Business values('B3','Pedley Richard Architect','San Jose','CA','(419)-244-5200','BCT3','T','6');
insert into Business values('B4','Safelite AutoGlass','San Jose','CA','(520)-465-5225' ,'BCT4','T','6');
insert into Business values('B5','SMITH THOMSON' ,'San Jose','CA','(855)-808-1480','BCT5','T','6');
insert into Business values('B6','Catch Your Big Break','San Jose','CA','(408)-827-8383','BCT6','T','6');
insert into Business values('B7','Bay Area Coffee Shop','Santa Clara','CA','(408)-876 7785','BCT7','T','2');
insert into Business values('B8','China  Coffee Toffee','Santa Clara','CA','(408)-261-9000','BCT8','T','2');
insert into Business values('B9','Hastings Water Works','Brecksville','OH','(440)-832-7700','BCT9','T','2');
insert into Business values('B10','The Cinebar','Torrance','CA','(408)-465-8308','BCT10','T','2');
insert into Business values('B11','In-N-Out Burger','San Jose','CA','(408)-804-8782','BCT11','F','1');
insert into Business values('B12','Coffee Bar and Bistro','Santa Clara','CA','(408)-465-8208','BCT10','T','1');
insert into Business values('B13','Renegades','Santa Clara','CA','(408)-465-8108','BCT10','T','1');
insert into Business values('B14','Alexs 49er Inn','Columbus','OH','(419)-465-8018','BCT10','T','1');
insert into Business values('B15','Red Stag Lounge','Brecksville','OH','(419)-465-8028','BCT10','T','1');
insert into Business values('B16','JJs Blues','Brecksville','OH','(419)-465-8108','BCT10','T','1');
insert into Business values('B17','The Bears Cocktails','Vienna','VA','(844)-465-8028','BCT10','T','1');
insert into Business values('B18','Trials Pub','Vienna','VA','(844)-465-8038','BCT10','T','1');
insert into Business values('B19','Santa Cruz Wine Bar','Vienna','VA','(844)-465-8048','BCT10','T','1');
insert into Business values('B20','Firehouse No 1 Gastropub','Tempe','AZ','(520)-465-8058','BCT10','T','1');
insert into Business values('B21','Original Gravity Public House','Tempe','AZ','(520)-465-8068','BCT10','T','1');
insert into Business values('B22','Hobees','San Jose','CA','(408)-465-8078','BCT5','F','5');
insert into Business values('B23','The Table','San Jose','CA','(408)-465-8908','BCT5','T','6');
insert into Business values('B24','Top Nosh Cafe','San Jose','CA','(408)-465-8098','BCT5','T','6');
insert into Business values('B25','Breakfast Place','San Jose','CA','(408)-465-8808','BCT5','F','6');
insert into Business values('B26','Cafe Rosalena','San Jose','CA','(408)-465-8708','BCT5','F','6');
insert into Business values('B27','Southern Kitchen','San Jose','CA','(408)-465-8608','BCT5','F','5');
insert into Business values('B28','Holders Country Inn','San Jose','CA','(408)-465-8508','BCT5','F','5');

insert into Reviews values('R1','2','Y1',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B1','1','0','0');
insert into Reviews values('R2','3','Y2',to_timestamp_tz('Oct-02-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B2','0','1','0');
insert into Reviews values('R3','2','Y3',to_timestamp_tz('Oct-03-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','R','B3','0','0','1');
insert into Reviews values('R4','2','Y4',to_timestamp_tz('Oct-11-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','R','B4','1','0','0');
insert into Reviews values('R5','4','Y5',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y9','R','B5','0','1','0');
insert into Reviews values('R6','4','Y6',to_timestamp_tz('Oct-02-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B6','0','0','1');
insert into Reviews values('R7','3','Y7',to_timestamp_tz('Oct-03-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B7','1','0','0');
insert into Reviews values('R8','2','Y8',to_timestamp_tz('Oct-04-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y10','R','B8','0','1','0');
insert into Reviews values('R9','1','Y9',to_timestamp_tz('Oct-05-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B9','0','0','1');
insert into Reviews values('R10','1','Y10',to_timestamp_tz('Oct-06-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','R','B10','1','0','0');
insert into Reviews values('R11','2','Y1',to_timestamp_tz('Oct-07-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B11','0','1','0');
insert into Reviews values('R12','2','Y2',to_timestamp_tz('Oct-08-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B1','1','0','0');
insert into Reviews values('R13','2','Y3',to_timestamp_tz('Oct-09-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','R','B2','0','1','0');
insert into Reviews values('R14','3','Y4',to_timestamp_tz('Oct-10-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','R','B3','0','0','1');
insert into Reviews values('R15','4','Y5',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y9','R','B4','1','0','0');
insert into Reviews values('R16','4','Y6',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B5','0','1','0');
insert into Reviews values('R17','1','Y1',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B6','0','0','1');
insert into Reviews values('R18','2','Y7',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B7','1','0','0');
insert into Reviews values('R19','3','Y8',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y10','R','B8','0','1','0');
insert into Reviews values('R20','4','Y9',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B9','0','0','1');
insert into Reviews values('R21','4','Y10',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','R','B10','1','0','0');
insert into Reviews values('R22','5','Y13',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y8','R','B12','0','1','0');
insert into Reviews values('R23','5','Y13',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y8','R','B13','0','0','1');
insert into Reviews values('R24','5','Y13',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y8','R','B14','1','0','0');
insert into Reviews values('R25','5','Y13',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y8','R','B15','0','1','0');
insert into Reviews values('R26','5','Y13',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y8','R','B16','0','0','1');
insert into Reviews values('R27','5','Y13',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y8','R','B17','1','0','0');
insert into Reviews values('R28','5','Y13',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y8','R','B18','0','1','0');
insert into Reviews values('R29','5','Y13',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y8','R','B19','0','0','1');
insert into Reviews values('R30','5','Y13',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y8','R','B20','1','0','0');
insert into Reviews values('R31','5','Y13',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y8','R','B21','0','1','0');
insert into Reviews values('R32','5','Y13',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y8','R','B22','0','0','1');
insert into Reviews values('R33','2','Y3',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','R','B1','1','0','0');
insert into Reviews values('R34','3','Y4',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','R','B2','0','1','0');
insert into Reviews values('R35','2','Y5',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y9','R','B3','0','0','1');
insert into Reviews values('R36','2','Y6',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B4','1','0','0');
insert into Reviews values('R37','4','Y1',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B5','0','1','0');
insert into Reviews values('R38','4','Y2',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B6','0','0','1');
insert into Reviews values('R39','2','Y4',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','R','B1','1','0','0');
insert into Reviews values('R40','3','Y5',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y9','R','B2','0','1','0');
insert into Reviews values('R41','2','Y6',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B3','0','0','1');
insert into Reviews values('R42','2','Y1',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B4','1','0','0');
insert into Reviews values('R43','4','Y2',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B5','0','1','0');
insert into Reviews values('R44','4','Y3',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','R','B6','0','0','1');
insert into Reviews values('R45','2','Y5',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y9','R','B1','1','0','0');
insert into Reviews values('R46','3','Y6',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B2','0','1','0');
insert into Reviews values('R47','2','Y1',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B3','0','0','1');
insert into Reviews values('R48','2','Y2',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B4','1','0','0');
insert into Reviews values('R49','4','Y3',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','R','B5','0','1','0');
insert into Reviews values('R50','4','Y4',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','R','B6','0','0','1');
insert into Reviews values('R51','2','Y6',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B1','1','0','0');
insert into Reviews values('R52','3','Y1',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B2','0','1','0');
insert into Reviews values('R53','2','Y2',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B3','0','0','1');
insert into Reviews values('R54','2','Y3',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','R','B4','1','0','0');
insert into Reviews values('R55','4','Y4',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','R','B5','0','1','0');
insert into Reviews values('R56','4','Y5',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y9','R','B6','0','0','1');
insert into Reviews values('R57','4','Y1',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B23','0','0','1');
insert into Reviews values('R58','4','Y2',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B23','0','1','0');
insert into Reviews values('R59','4','Y3',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','R','B23','0','0','1');
insert into Reviews values('R60','4','Y4',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','R','B23','1','0','0');
insert into Reviews values('R61','4','Y5',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y9','R','B23','0','1','0');
insert into Reviews values('R62','4','Y6',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B23','0','0','1');
insert into Reviews values('R63','4','Y1',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B24','1','0','0');
insert into Reviews values('R64','4','Y2',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B24','0','1','0');
insert into Reviews values('R65','4','Y3',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','R','B24','0','0','1');
insert into Reviews values('R66','4','Y4',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','R','B24','1','0','0');
insert into Reviews values('R67','4','Y5',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y9','R','B24','0','1','0');
insert into Reviews values('R68','4','Y6',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B24','0','0','1');
insert into Reviews values('R69','4','Y1',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B25','1','0','0');
insert into Reviews values('R70','4','Y2',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B25','0','1','0');
insert into Reviews values('R71','4','Y3',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','R','B25','0','0','1');
insert into Reviews values('R72','4','Y4',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','R','B25','1','0','0');
insert into Reviews values('R73','4','Y5',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y9','R','B25','0','1','0');
insert into Reviews values('R74','4','Y6',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B25','0','0','1');
insert into Reviews values('R75','4','Y1',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B26','1','0','0');
insert into Reviews values('R76','4','Y2',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B26','0','1','0');
insert into Reviews values('R77','4','Y3',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','R','B26','0','0','1');
insert into Reviews values('R78','4','Y4',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','R','B26','1','0','0');
insert into Reviews values('R79','4','Y5',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y9','R','B26','0','1','0');
insert into Reviews values('R80','4','Y6',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B26','0','0','1');
insert into Reviews values('R81','4','Y2',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B27','1','0','0');
insert into Reviews values('R82','5','Y3',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','R','B27','0','1','0');
insert into Reviews values('R83','5','Y4',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','R','B27','0','0','1');
insert into Reviews values('R84','5','Y5',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y9','R','B27','1','0','0');
insert into Reviews values('R85','5','Y6',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B27','0','1','0');
insert into Reviews values('R86','5','Y1',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B22','0','0','1');
insert into Reviews values('R87','5','Y2',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B22','1','0','0');
insert into Reviews values('R88','5','Y3',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y6','R','B22','0','1','0');
insert into Reviews values('R89','5','Y4',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y7','R','B22','0','0','1');
insert into Reviews values('R90','5','Y5',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y9','R','B28','1','0','0');
insert into Reviews values('R91','5','Y6',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y2','R','B28','0','1','0');
insert into Reviews values('R92','5','Y7',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B28','0','0','1');
insert into Reviews values('R93','5','Y8',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y10','R','B28','1','0','0');
insert into Reviews values('R94','5','Y9',to_timestamp_tz('Oct-01-15 09:11:17 PDT','Mon-DD-YY HH24:MI:SS TZD'),'Y1','R','B28','0','1','0');

insert into Business_category values('BCT1','Amusement Parks');
insert into Business_category values('BCT2','Gymnastics');
insert into Business_category values('BCT3','Architects');
insert into Business_category values('BCT4','Windshield');
insert into Business_category values('BCT5','Breakfast and Brunch');
insert into Business_category values('BCT6','Career Counseling');
insert into Business_category values('BCT7','Coffee Shops');
insert into Business_category values('BCT8','Food and More');
insert into Business_category values('BCT9','Pool Cleaners');
insert into Business_category values('BCT10','Bars');
insert into Business_category values('BCT11','Burgers');

insert into business_has_category values('B1','BCT1');
insert into business_has_category values('B2','BCT2');
insert into business_has_category values('B3','BCT3');
insert into business_has_category values('B4','BCT4');
insert into business_has_category values('B5','BCT5');
insert into business_has_category values('B6','BCT6');
insert into business_has_category values('B7','BCT7');
insert into business_has_category values('B8','BCT8');
insert into business_has_category values('B9','BCT9');
insert into business_has_category values('B10','BCT10');
insert into business_has_category values('B11','BCT11');
insert into business_has_category values('B12','BCT10');
insert into business_has_category values('B13','BCT10');
insert into business_has_category values('B14','BCT10');
insert into business_has_category values('B15','BCT10');
insert into business_has_category values('B16','BCT10');
insert into business_has_category values('B17','BCT10');
insert into business_has_category values('B18','BCT10');
insert into business_has_category values('B19','BCT10');
insert into business_has_category values('B20','BCT10');
insert into business_has_category values('B21','BCT10');
insert into business_has_category values('B22','BCT5');
insert into business_has_category values('B23','BCT5');
insert into business_has_category values('B24','BCT5');
insert into business_has_category values('B25','BCT5');
insert into business_has_category values('B26','BCT5');
insert into business_has_category values('B27','BCT5');
insert into business_has_category values('B28','BCT5');

insert into List_of_Friends values('Y1','Y2');
insert into List_of_Friends values('Y2','Y1');
insert into List_of_Friends values('Y3','Y6');
insert into List_of_Friends values('Y4','Y7');
insert into List_of_Friends values('Y5','Y9');
insert into List_of_Friends values('Y5','Y10');
insert into List_of_Friends values('Y6','Y2');
insert into List_of_Friends values('Y6','Y1');
insert into List_of_Friends values('Y7','Y1');
insert into List_of_Friends values('Y8','Y10');
insert into List_of_Friends values('Y9','Y1');
insert into List_of_Friends values('Y10','Y6');
insert into List_of_Friends values('Y11','Y12');
insert into List_of_Friends values('Y12','Y11');
insert into List_of_Friends values('Y13','Y8');

insert into Complimented_Friends values('Y1','Y2','Place is Good');
insert into Complimented_Friends values('Y2','Y1','Place is Nice');
insert into Complimented_Friends values('Y4','Y7','Place is Wonderful');
insert into Complimented_Friends values('Y6','Y2','Good Place');
insert into Complimented_Friends values('Y7','Y1','Wonderful Place');
insert into Complimented_Friends values('Y8','Y10','Nice Place');
insert into Complimented_Friends values('Y9','Y1','Place is Good');
insert into Complimented_Friends values('Y11','Y12','Place is Moderate');
insert into Complimented_Friends values('Y12','Y11','Place is Nice');
insert into Complimented_Friends values('Y13','Y8','Wonderful Place');

insert into Photo values('P1','Scenic','CA');
insert into Photo values('P2','Scenic','OH');
insert into Photo values('P3','Scenic','CA');
insert into Photo values('P4','Scenic','CA');
insert into Photo values('P5','Scenic','CA');
insert into Photo values('P6','Scenic','AZ');
insert into Photo values('P7','Scenic','CA');
insert into Photo values('P8','Scenic','OH');
insert into Photo values('P9','Scenic','CA');
insert into Photo values('P10','Scenic','CA');
insert into Photo values('P11','Scenic','AZ');
insert into Photo values('P12','Scenic','OH');
insert into Photo values('P13','Scenic','OH');
insert into Photo values('P14','Scenic','OH');

insert into Yelp_Photo values('P1','Y1','B1');
insert into Yelp_Photo values('P2','Y2','B2');
insert into Yelp_Photo values('P3','Y3','B3');
insert into Yelp_Photo values('P4','Y4','B4');
insert into Yelp_Photo values('P5','Y5','B5');
insert into Yelp_Photo values('P6','Y6','B6');
insert into Yelp_Photo values('P7','Y7','B7');
insert into Yelp_Photo values('P8','Y8','B8');
insert into Yelp_Photo values('P9','Y9','B9');
insert into Yelp_Photo values('P10','Y10','B10');
insert into Yelp_Photo values('P11','Y1','B11');
insert into Yelp_Photo values('P12','Y2','B1');
insert into Yelp_Photo values('P13','Y3','B1');
insert into Yelp_Photo values('P14','Y4','B3');


CREATE TYPE list_type AS OBJECT( 
	yelp_id  VARCHAR2(5)  , 
	friend_id VARCHAR2(5)
) 
NOT FINAL; 
/ 

CREATE TYPE compliment_type UNDER list_type( 	 
	compliment VARCHAR2(30) ) 
NOT FINAL; 
/ 

CREATE TYPE vote_type UNDER list_type( 	 
	funny VARCHAR2(1) ,
    cool VARCHAR2(1) ,
    useful VARCHAR2(1) ) 
NOT FINAL; 
/ 

CREATE TYPE helpful_type UNDER list_type( 	 
	helpful VARCHAR2(20) 
     ) 
NOT FINAL; 
/ 

CREATE TYPE businessreview_type UNDER list_type( 	 
	visible VARCHAR2(20) 
    ) 
NOT FINAL; 
/ 

CREATE TABLE list_of_user OF list_type;

INSERT INTO list_of_user VALUES (
list_type('Y13','Y8'));
INSERT INTO list_of_user VALUES (
list_type('Y2','Y1'));
INSERT INTO list_of_user VALUES (
list_type('Y3','Y6'));
INSERT INTO list_of_user VALUES (
list_type('Y4','Y7'));



INSERT INTO list_of_user VALUES (
compliment_type('Y1','Y2','Place is Goood'));
INSERT INTO list_of_user VALUES (
compliment_type('Y2','Y1','Place is Nice'));
INSERT INTO list_of_user VALUES (
compliment_type('Y4','Y7','Place is Wonderful'));
INSERT INTO list_of_user VALUES (
compliment_type('Y6','Y2','Good Place'));



INSERT INTO list_of_user VALUES (
vote_type('Y6','Y6','1','0','1'));
INSERT INTO list_of_user VALUES (
vote_type('Y5','Y9','1','0','1'));
INSERT INTO list_of_user VALUES (
vote_type('Y1','Y3','1','0','1'));
INSERT INTO list_of_user VALUES (
vote_type('Y8','Y5','1','0','1'));

INSERT INTO list_of_user VALUES (
helpful_type('Y1','Y4','HELPFUL'));
INSERT INTO list_of_user VALUES (
helpful_type('Y1','Y2','HELPFUL'));
INSERT INTO list_of_user VALUES (
businessreview_type('Y2','Y4','VISIBLE'));
INSERT INTO list_of_user VALUES (
businessreview_type('Y8','Y3','VISIBLE'));



CREATE TYPE businesscat_type AS OBJECT( 
	bc_id  VARCHAR2(15) , 
	bcname_id VARCHAR2(50) 
) 
NOT FINAL; 
/ 

CREATE TYPE restaurant_type UNDER businesscat_type( 
    name VARCHAR2(20)
	) 
NOT FINAL; 
/
CREATE TYPE music_type UNDER businesscat_type( 	 name VARCHAR2(20)
	) 
NOT FINAL; 
/ 

CREATE TYPE departmental_type UNDER businesscat_type( 
name VARCHAR2(20)
	) 
NOT FINAL; 
/ 



CREATE TABLE business_category_table OF businesscat_type;

INSERT INTO business_category_table VALUES (
restaurant_type('BCT1','Olive Garden','Restaurant'));
INSERT INTO business_category_table VALUES (
restaurant_type('BCT2','PF Chang','Restaurant'));
INSERT INTO business_category_table VALUES (
music_type('BCT3','Spotify','Music'));
INSERT INTO business_category_table VALUES (
departmental_type('BCT4','Bed Bath and Beyond','Departmental Store'));




CREATE TYPE review_type AS OBJECT( 
	       Review_Id varchar(50) ,
			Rating varchar(5) ,
			Author varchar(5) ,
			Publish_Date varchar(30)
) 
NOT FINAL; 
/ 

CREATE TYPE recommended_type UNDER review_type( 	 name VARCHAR2(20)
	) 
NOT FINAL; 
/ 

CREATE TYPE notrecommended_type UNDER review_type( 
name VARCHAR2(20)
	) 
NOT FINAL; 
/ 

CREATE TABLE review_table OF review_type;

INSERT INTO review_table VALUES (
recommended_type('R1','2','Y1','March 25,1996','R'));
INSERT INTO review_table VALUES (
recommended_type('R2','5','Y2','March 25,1996','R'));
INSERT INTO review_table VALUES (
recommended_type('R3','3','Y3','March 25,1996','R'));
INSERT INTO review_table VALUES (
recommended_type('R4','4','Y4','March 25,1996','R'));

