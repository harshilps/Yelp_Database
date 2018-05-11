/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package insertion;


import java.io.BufferedReader;
import java.io.*;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class InsertBusiness {
 String line = null;
 ArrayList<JSONObject> json = new ArrayList<JSONObject>();
 PreparedStatement businessSQL = null;
 JSONObject obj;
 static Connection con = null;

 public static void main(String[] args) throws SQLException, ParseException, IOException {
  // TODO Auto-generated method stub
  DBConnection dbcontection = new DBConnection();
  con = dbcontection.openConnection();
  System.out.println("Inside ");
  InsertBusiness business = new InsertBusiness();
  business.insertBusiness();

 }

 public void insertBusiness() throws ParseException, IOException, SQLException {
  FileReader file = new FileReader("C:/Users/Ketha/Desktop/YelpDataset-CptS451/yelp_business.json");
  BufferedReader bufferedReader = new BufferedReader(file);
  con.setAutoCommit(true);
  PreparedStatement businessSQL = null;
  System.out.println("Here");
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
   System.out.println(business_id + " " + full_address + " " + city + " " + review_count + " " + business_name
     + " " + longitude + " " + latitude + " " + open + " " + state + " " + stars + " " + " " + type + " "
     + attributes);
   if (businessSQL == null) {
//    String sql = "INSERT INTO BUSINESS (BUSINESS_ID, FULL_ADDRESS, OPEN, CITY,"
//      + " REVIEW_COUNT, BUSINESS_NAME, LONGITUDE, STATE, STARS, LATITUDE, TYPE, ATTRIBUTES) "
//      + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
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
  }
   businessSQL.close();
   bufferedReader.close();

 }
}

