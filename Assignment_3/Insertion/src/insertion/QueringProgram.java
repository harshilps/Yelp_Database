package insertion;


import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Scanner;

import org.json.simple.JSONObject;



import oracle.sql.NUMBER;

public class QueringProgram {
 String line = null;
 ArrayList<JSONObject> json = new ArrayList<JSONObject>();
 JSONObject obj;
 
 static Connection con = null;
 
 public static void main(String[] args) throws SQLException, ParseException {
  DBConnection dbconnection = new DBConnection();
  con = dbconnection.openConnection();
  QueringProgram query = new QueringProgram();
  query.queringData();
 }
 
 public void queringData() throws SQLException, ParseException{
  Scanner sc = new Scanner(System.in);
  
  System.out.println("Enter the user_yelping since value:");
//  String date = sc.nextLine();
//  System.out.println(yelping_since);
//    SimpleDateFormat format = new SimpleDateFormat("YYYY-MM");
//    System.out.println(format);
//     Date parsed = format.parse(date.toString());
//     System.out.println(parsed);
//     Date yelping_since = new Date(parsed.getTime());
//  java.sql.Date yelping_since = java.sql.Date.valueOf(date);
  String yelping_since = sc.nextLine();
  System.out.println(yelping_since);
     System.out.println("Review count");
  String counts = sc.nextLine();
  BigDecimal count = new BigDecimal(counts);
  System.out.println("Average stars");
  String star = sc.nextLine();
  System.out.println("Number of Friends");
  String number_of_friends = sc.nextLine();
  System.out.println("Select And or OR operation");
  String andOr = sc.nextLine();
  System.out.println("select the number of votes by user");
String votes = sc.nextLine();
 BigDecimal stars =new BigDecimal(star);
 BigDecimal votes_count=new BigDecimal(votes);
  java.sql.Statement stmt = null;
//  so fAR quering for yelping since, review count, average rating,friends count
//  System.out.println("yelping since"+yelping_since +"review count"+ count+"Stars"+stars);
  String query = "select * from (select * from  yelp_users where to_char((YELPING_SINCE),'YYYY-MM')='"+yelping_since+"' "+andOr+" review_count = '"
    +count+"' "+andOr+" average_stars='"+stars+"') x,(select count(friends_id)as number_of_friends,user_id from friends group by user_id) y ,(select SUM(cool+funny+useful) as number_of_votes,user_id from votes group by user_id) z where x.user_id = y.user_id and x.user_id =z.user_id "+
    andOr + " y.number_of_friends ='"+number_of_friends+"' "+andOr+" number_of_votes ='"+votes_count+"'";
//  String query = "select * from yelp_user where yelping_since='"+yelping_since +"' and review_count='"
//      +count+"' and average_stars='"+stars+"'";
    System.out.println(query);
    stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(query);
    while(rs.next()){
     Date dates = rs.getDate(1);
     BigDecimal review_count = rs.getBigDecimal(2);
    String user_name = rs.getString(3);
    String average_star = rs.getString(6);
    System.out.println("dates "+ dates+"review_count "+ review_count+"user_name "+user_name+" average_star "+average_star );
    }   
  }

}

