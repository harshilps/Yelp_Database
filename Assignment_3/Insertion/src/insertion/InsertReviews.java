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
public class InsertReviews {


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
  InsertReviews business = new InsertReviews();
  business.insertBusiness();

 }

 public void insertBusiness() throws ParseException, IOException, SQLException {
  FileReader file = new FileReader("C:/Users/Ketha/Desktop/YelpDataset-CptS451/yelp_review.json");
  BufferedReader bufferedReader = new BufferedReader(file);
  con.setAutoCommit(true);
  PreparedStatement businessSQL = null;
  System.out.println("Here");
  while ((line = bufferedReader.readLine()) != null) {
   obj = (JSONObject) new JSONParser().parse(line);
   json.add(obj);
   String review_id = (String) obj.get("review_id");
   String user_id = (String) obj.get("user_id");
   String business_id = (String) obj.get("business_id");
   String text = (String) obj.get("text");
   String type = (String) obj.get("type");
  // double stars = (double) obj.get("stars");
   JSONObject attribute = (JSONObject) obj.get("attributes");
   System.out.println(business_id + " " + review_id + " " + user_id + " " + business_id + " " + type
     + " " );
   if (businessSQL == null) {
//    String sql = "INSERT INTO REVIEW (BUSINESS_ID, FULL_ADDRESS, OPEN, CITY,"
//      + " REVIEW_COUNT, BUSINESS_NAME, LONGITUDE, STATE, STARS, LATITUDE, TYPE, ATTRIBUTES) "
//      + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
    String sql = "INSERT INTO REVIEWS VALUES(?,?,?,?,?)";
    businessSQL = con.prepareStatement(sql);
   }
   businessSQL.setString(1,user_id);
   businessSQL.setString(2,review_id);
  // businessSQL.setDouble(3,stars);
   //businessSQL.setString(4,date);
   businessSQL.setString(3,text);
   businessSQL.setString(4,type);
   businessSQL.setString(5,business_id);
   businessSQL.executeUpdate();
  }
  while ((line = bufferedReader.readLine()) == null) {

   businessSQL.close();
   bufferedReader.close();

  }

 }
}


