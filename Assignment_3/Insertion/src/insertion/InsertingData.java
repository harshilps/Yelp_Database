package insertion;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.Iterator;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import java.io.BufferedReader;
import java.io.*;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import java.io.BufferedReader;
import java.io.*;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class InsertingData {
 String line = null;
 ArrayList<JSONObject> json = new ArrayList<JSONObject>();
 JSONObject obj;
 static Connection con = null;
 public static void main(String[] args) throws SQLException, IOException, ParseException, java.text.ParseException {

  DBConnection dbconnection = new DBConnection();
  con = dbconnection.openConnection(); 
  InsertingData inserting = new InsertingData();
  inserting.insertUserData();
  inserting.insertBusinessData();
  inserting.insertingReview();
  dbconnection.closeConnection(con);
  
 }
 
 public void insertUserData() throws SQLException, IOException, ParseException, java.text.ParseException{
  FileReader file = new FileReader("C:/Users/Ketha/Desktop/YelpDataset-CptS451/yelp_user.json");
  BufferedReader bufferedReader = new BufferedReader(file);
  con.setAutoCommit(true);
  PreparedStatement userSQL = null;
  long user_count=0;
  while ((line = bufferedReader.readLine()) != null) {
   obj = (JSONObject) new JSONParser().parse(line);
   json.add(obj);
   String date = (String) obj.get("yelping_since");
   long review_count = (long)obj.get("review_count");
   String user_name = (String) obj.get("name");
   String user_id = (String) obj.get("user_id");
   long fans = (long) obj.get("fans");
   double average_stars = (double) obj.get("average_stars");
   String user_type = (String) obj.get("type");
//   System.out.println(date + " "+review_count+" "+user_name+" "+
//     user_id+" "+fans+" "+average_stars+" "+user_type);
 if (userSQL == null) {
    String sql = "INSERT INTO yelp_users VALUES(?,?,?,?,?,?,?)";
    userSQL = con.prepareStatement(sql);
   }
   SimpleDateFormat format = new SimpleDateFormat("yyyy-MM");
   java.util.Date parsed = format.parse(date.toString());
   userSQL.setDate(1,new Date(parsed.getTime()));
   userSQL.setLong(2,review_count);
   userSQL.setString(3, user_name);
   userSQL.setString(4,user_id);
   userSQL.setLong(5, fans);
   userSQL.setDouble(6, average_stars);
   userSQL.setString(7,user_type);
   userSQL.executeUpdate();
user_count ++;
  }
  System.out.println("user_count " +user_count);
  userSQL.close();
  bufferedReader.close();
 }

 void insertBusinessData() throws SQLException, ParseException, IOException{
  FileReader file = new FileReader("C:/Users/Ketha/Desktop/YelpDataset-CptS451/yelp_business.json");
  BufferedReader bufferedReader = new BufferedReader(file);
  con.setAutoCommit(true);
  PreparedStatement businessSQL = null;
  long business_count =0;
  while ((line = bufferedReader.readLine()) != null) {
   obj = (JSONObject) new JSONParser().parse(line);
   json.add(obj);
   String business_id = (String) obj.get("business_id");
   String full_address = (String) obj.get("full_address");
   boolean open1 = (boolean) obj.get("open");
   String city = (String) obj.get("city");
   long review_count = (long) obj.get("review_count");
   String business_name = (String) obj.get("name");
   double longitude = (double) obj.get("longitude");
   double latitude = (double) obj.get("latitude");
   String open = Boolean.toString(open1);
   String state = (String) obj.get("state");
   double stars = (double) obj.get("stars");
   JSONObject attribute = (JSONObject) obj.get("attributes");
   String attributes = attribute.toString();
   String type = (String) obj.get("type");
//   System.out.println(business_id + " " + full_address + " " + city + " " + review_count + " " + business_name
//     + " " + longitude + " " + latitude + " " + open + " " + state + " " + stars + " " + " " + type + " "
//     + attributes);
   if (businessSQL == null) {
    String sql = "INSERT INTO BUSINESS VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
    businessSQL = con.prepareStatement(sql);
   }
   businessSQL.setString(1,business_id);
   businessSQL.setString(2,full_address);
   businessSQL.setString(3,open);
   businessSQL.setString(4,city);
   businessSQL.setLong(5,review_count);
   businessSQL.setString(6,business_name);
   businessSQL.setDouble(7,longitude);
   businessSQL.setString(8,state);
   businessSQL.setDouble(9,stars);
   businessSQL.setDouble(10,latitude);
   businessSQL.setString(11,type);
   businessSQL.setString(12,attributes);
   businessSQL.executeUpdate();
   business_count ++;
  }
  System.out.println("business_count"+business_count);
   businessSQL.close();
   bufferedReader.close();
 }
 
 public void insertingReview() throws SQLException, IOException, ParseException, java.text.ParseException{
  FileReader file = new FileReader("C:/Users/Ketha/Desktop/YelpDataset-CptS451/yelp_review.json");
  BufferedReader bufferedReader = new BufferedReader(file);
  con.setAutoCommit(true);
  PreparedStatement reviewSQL = null;
  long count= 0;
  while ((line = bufferedReader.readLine()) != null) {
   obj = (JSONObject) new JSONParser().parse(line);
   json.add(obj);
   String user_id = (String) obj.get("user_id");
   String review_id =(String)obj.get("review_id");
   long stars = (long) obj.get("stars");
   String date = (String) obj.get("date");
   String text = (String) obj.get("text");
   String type = (String) obj.get("type");
   String business_id = (String) obj.get("business_id");
//   System.out.println(user_id+" "+review_id+" "+stars+" "+
//   text+" "+type+" "+date+" "+type+" "+business_id);
  if(reviewSQL == null){
   String sql="INSERT INTO REVIEWS VALUES(?,?,?,?,?,?,?)";
   reviewSQL = con.prepareStatement(sql);
  }
  SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-DD");
  java.util.Date parsed = format.parse(date.toString());
  reviewSQL.setString(1,user_id);
  reviewSQL.setString(2,review_id);
  reviewSQL.setLong(3, stars);
  reviewSQL.setDate(4,new Date(parsed.getTime()));
  reviewSQL.setString(5,text);
  reviewSQL.setString(6,type);
  reviewSQL.setString(7,business_id);
  reviewSQL.executeUpdate();
  count ++;
  }
  System.out.println("review data:"+count);
  bufferedReader.close();
  reviewSQL.close();
 }

    void insertVotes() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
