COEN 280
Assignment 3
Yelp Database Challenge 


Environment: NetBeans IDE for Java Developers
Oracle Database 11g Express Edition
SQL Developer IDE

Introduction:

Part 1: Design and population of yelp database:

This assignment is a cumulation of the construction and design of the previous two assignments. In this assignment, a relational database schema is designed by modeling the json files provided in the yelp dataset. This data was then input into a java program to parse the jsons and enter them into the correct tables so that queries may be performed on them. As the dataset is very large, the program takes up to 30 minutes to parse all the json files and enter them into the database.

Part 2: Construction of GUI using Java Swing:
Using Java Swing the front end GUI was constructed for two different query builders. Business Query and User Query analysis were constructed as two different tabbed panes so that users can differentiate between the two queries. In the business query form, the form is dynamically generated based on user selection of checkboxes. After the entire form is generated dynamically the user can then view the dynamically generated query based on the input and the result set of that query is displayed in the table. Upon clicking on a row in the table, the table will then display the records for that particular row’s business Id. The user query form is also similar to this except that user’s details are presented instead of the business details.

The front end and back end are connected through a JDBC connection.

Note: Due to the multitude of data being processed by the database, the query takes some time to be processed and for the result set to be displayed. 



