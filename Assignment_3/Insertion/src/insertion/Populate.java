package insertion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
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

class DBConnection1 {

public void closeConnection(Connection con) {
  try {
   con.close();
  } catch (SQLException e) {
   // TODO Auto-generated catch block
   e.printStackTrace();
  }
  
 }

public Connection openConnection() throws SQLException {
  // Load the Oracle database driver 
    DriverManager.registerDriver(new oracle.jdbc.OracleDriver()); 

     String host = "localhost"; 
           String port = "1521"; 
           String dbName = "xe"; 
           String userName = "SYSTEM"; 
           String password = "oracle"; 

     // Construct the JDBC URL 
     String dbURL = "jdbc:oracle:thin:@" + host + ":" + port + ":" + dbName; 
     return DriverManager.getConnection(dbURL, userName, password); 

 }
 
}

public class Populate 
{
    String line = null;
    ArrayList<JSONObject> json = new ArrayList<JSONObject>();
    JSONObject obj;
    static Connection con = null;
    
    public static void main(String[] args) throws SQLException, IOException, ParseException, java.text.ParseException {
        DBConnection dbconnection = new DBConnection();
        con = dbconnection.openConnection(); 
        //JSONParser jp = new JSONParser();//ADDED
        Populate insert = new Populate();
        insert.populateYelp_Users();
        insert.populateBusiness();
        insert.populateReviews();
        insert.populateFriends();
       insert.populateVotes();
        insert.populateBusiness_Category();
        insert.populateCategory();
        insert.insertVotes();
        insert.populateBAC();
        dbconnection.closeConnection(con);
  }
 
 public void populateYelp_Users() throws SQLException, IOException, ParseException, java.text.ParseException
 {
    FileReader file = new FileReader("C:/Users/Ketha/Desktop/YelpDataset-CptS451/yelp_user.json");
     BufferedReader bufferedReader = new BufferedReader(file);
    con.setAutoCommit(true);
    PreparedStatement userSQL = null;
    long user_count=0;
    while ((line = bufferedReader.readLine()) != null)
    {
        obj = (JSONObject) new JSONParser().parse(line);
        json.add(obj);
        String date = (String) obj.get("yelping_since");
        long review_count = (long)obj.get("review_count");
        String user_name = (String) obj.get("name");
        String user_id = (String) obj.get("user_id");
        long fans = (long) obj.get("fans");
        double average_stars = (double) obj.get("average_stars");
        String user_type = (String) obj.get("type");
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
public void populateBusiness() throws SQLException, ParseException, IOException
{
  FileReader file = new FileReader("C:/Users/Ketha/Desktop/YelpDataset-CptS451/yelp_business.json");
  BufferedReader bufferedReader = new BufferedReader(file);
  con.setAutoCommit(true);
  PreparedStatement businessSQL = null;
  long business_count =0;
  while ((line = bufferedReader.readLine()) != null) 
  {
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
        if (businessSQL == null)
            {
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
 public void populateReviews() throws SQLException, IOException, ParseException, java.text.ParseException{
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
 public void populateFriends() throws ParseException, IOException, SQLException, java.text.ParseException {
  FileReader file = new FileReader("C:/Users/Ketha/Desktop/YelpDataset-CptS451/yelp_user.json");
  BufferedReader bufferedReader = new BufferedReader(file);
  con.setAutoCommit(true);
  PreparedStatement userSQL = null;

  while ((line = bufferedReader.readLine()) != null) {
   obj = (JSONObject) new JSONParser().parse(line);
   json.add(obj);
   String user_name=(String) obj.get("name");
   String user_id = (String) obj.get("user_id");
  // String friends = (String) obj.get("user_id");
    JSONArray friendsList = (JSONArray) obj.get("friends");
   Iterator<String> iterator = friendsList.iterator();
            while (iterator.hasNext()) 
            {
               String friend=iterator.next();
       System.out.println(user_name+" "+user_id+" "+friend+" ");
            if (userSQL == null) {
             String sql = "INSERT INTO FRIENDS VALUES(?,?)";
            userSQL = con.prepareStatement(sql);
             }
        
   userSQL.setString(1,user_id);
   userSQL.setString(2, friend);
   userSQL.executeUpdate();
      
            }
   

   

  }
  userSQL.close();
  bufferedReader.close();
 }
public void populateVotes() throws ParseException, IOException, SQLException, java.text.ParseException {
  FileReader file = new FileReader("C:/Users/Ketha/Desktop/YelpDataset-CptS451/yelp_user.json");
  BufferedReader bufferedReader = new BufferedReader(file);
  con.setAutoCommit(true);
  PreparedStatement votesSQL = null;
    long count =0;                      
  while ((line = bufferedReader.readLine()) != null) {
   obj = (JSONObject) new JSONParser().parse(line);
   json.add(obj);
   String user_id = (String) obj.get("user_id");
   String votes = (String) obj.get("votes").toString();
//   System.out.println(user_name+user_id+votes);
   JSONObject votes_obj = (JSONObject) new JSONParser().parse(votes);
//   System.out.println(votes_obj);
   long cool =(long) votes_obj.get("cool");
//System.out.println(cool);
   long useful = (long) votes_obj.get("useful");
   long funny = (long) votes_obj.get("funny");
//   System.out.println("user_id "+user_id+" cool "+cool+" useful "+useful+" funny "+funny);
 if(votesSQL == null ){
  String query = "INSERT INTO VOTES VALUES(?,?,?,?)";
  votesSQL = con.prepareStatement(query);
 }
 votesSQL.setString(1, user_id);
 votesSQL.setLong(2, funny);
 votesSQL.setLong(3,useful);
 votesSQL.setLong(4, cool);
 
 votesSQL.executeQuery();
 count++;
  }
  bufferedReader.close();
  System.out.println("count:" + count);
 }
public void populateBusiness_Category() throws ParseException, IOException, SQLException, java.text.ParseException {
  FileReader file = new FileReader("C:/Users/Ketha/Desktop/YelpDataset-CptS451/business_category.json");
  BufferedReader bufferedReader = new BufferedReader(file);
  con.setAutoCommit(true);
  PreparedStatement BCSQL = null;
    long count =0;                      
  while ((line = bufferedReader.readLine()) != null) {
   obj = (JSONObject) new JSONParser().parse(line);
   json.add(obj);
   String main_category = (String) obj.get("cat");
  
 if(BCSQL == null ){
  String query = "INSERT INTO BUSINESS_CATEGORY2 VALUES(?)";
  BCSQL = con.prepareStatement(query);
 }
 BCSQL.setString(1, main_category);
BCSQL.executeQuery();
 count++;
  }
  bufferedReader.close();
  System.out.println("count:" + count);
 }
public void populateCategory() throws SQLException, ParseException, IOException
{
  FileReader file = new FileReader("C:/Users/Ketha/Desktop/YelpDataset-CptS451/yelp_business.json");
  BufferedReader bufferedReader = new BufferedReader(file);
  con.setAutoCommit(true);
  PreparedStatement businessSQL = null;
  long business_count =0;
  while ((line = bufferedReader.readLine()) != null) 
  {
        obj = (JSONObject) new JSONParser().parse(line);
        json.add(obj);

JSONArray sub = (JSONArray) obj.get("categories");
	 for(int i=0;i<sub.size();i++)
      {
            String subcats = (String) sub.get(i);
           
      
     
       
        if (businessSQL == null)
            {
                String sql = "INSERT INTO sub VALUES(?)";
                businessSQL = con.prepareStatement(sql);
            }
       businessSQL.setString(1,subcats);
       businessSQL.executeUpdate();
       business_count ++;
    }
  System.out.println("business_count"+business_count);
  }
  businessSQL.close();
  bufferedReader.close();
 }


public void populateBAC()throws ParseException, IOException, SQLException, java.text.ParseException{
String[] CatList = {"Active Life\n" ,"Arts & Entertainment\n", "Automotive", "Car Rental", "Cafes", "Transportation",
                                "Beauty & Spas", "Convenience Stores", "Dentists", "Doctors", "Drugstores", "Department Stores", "Education", 
                                "Event Planning & Services", "Flowers & Gifts", "Food", "Health & Medical", "Home Services", "Home & Garden", 
                                "Hospitals", "Hotels & Travel", "Hardware Stores", "Grocery", "Medical Centers", "Nurseries & Gardening", "Shopping",
                                "Nightlife", "Medical Centers", "Nurseries & Gardening", "Nurseries & Gardening", "Nightlife", "Restaurants"};
 
                            BufferedReader br = new BufferedReader(new FileReader("C:/Users/Ketha/Desktop/YelpDataset-CptS451/yelp_business.json"));
                            String line = br.readLine();
                            int ibus = 0;
                            int ibuscat = 0;
                            int ibusAttr = 0;
                            int iNeighbour = 0;
                            int iOphrs = 0;
                            PreparedStatement psBusnCat = con.prepareStatement("INSERT INTO BUSINESSCATEGORY (BID, BUSNCATGNAME, BUSNSUBCAT) VALUES (?,?,?)");
                            PreparedStatement psBusAttr = con.prepareStatement("INSERT INTO BUSNATTR (BID, ATTRJSON) VALUES (?, ?)");
                            while (line != null) {
                                //JSONObject obj = (JSONObject) JSONParser.parse(line);
                                 obj = (JSONObject) new JSONParser().parse(line);
                                String sBusnID = (String)obj.get("business_id");
                                JSONArray alCategories = (JSONArray)obj.get("categories");
                                JSONObject sAttributes = (JSONObject)obj.get("attributes");
                                if(sAttributes !=null){
                                    psBusAttr.setString(1, sBusnID);
                                    psBusAttr.setString(2, sAttributes.toJSONString());
                                    psBusAttr.addBatch();
                                    ibusAttr++;
                                    if(ibusAttr>500){
                                       
                                        ibus = 0;
                                        psBusAttr.executeBatch();
                                        ibusAttr = 0;
                                    }
                                }
                               
                                
                                if(alCategories!=null){
                                    ArrayList<String> sBusCat = new ArrayList();
                                    ArrayList<String> sBusSubCat = new ArrayList();
                                    for(int i = 0; i< alCategories.size(); i++){
                                        String str = (String)alCategories.get(i);
                                        boolean isCat = false;
                                        for(int j = 0; j< CatList.length; j++){
                                            if(str.equals(CatList[j])){
                                                isCat = true;
                                                break;
                                            }
                                        }
                                        if(isCat)
                                            sBusCat.add(str);
                                        else
                                            sBusSubCat.add(str);
                                    }
                                    for(String sCat : sBusCat){
                                        for(String sSubCat : sBusSubCat){
                                            psBusnCat.setString(1, sBusnID);
                                            psBusnCat.setString(2, sCat);
                                            psBusnCat.setString(3, sSubCat);
                                            psBusnCat.addBatch();
                                            ibuscat++;
                                            if(ibuscat>500){
                                               
                                                ibus = 0;
                                                psBusnCat.executeBatch();
                                                ibuscat = 0;
                                            }
                                        }
                                    }
                                }
                              
                              
                                psBusAttr.executeBatch();
                               
                                psBusnCat.executeBatch();
                                
                                line = br.readLine();
                            }
                           
                        }
  public void insertVotes() throws ParseException, IOException, SQLException, java.text.ParseException {//FOR REVIEWS
   FileReader file = new FileReader("C:/Users/Ketha/Desktop/YelpDataset-CptS451/yelp_review.json");
   BufferedReader bufferedReader = new BufferedReader(file);
   con.setAutoCommit(true);
   PreparedStatement votesSQL = null;
     long count =0;                      
   while ((line = bufferedReader.readLine()) != null) {
    obj = (JSONObject) new JSONParser().parse(line);
    json.add(obj);
    String user_id = (String) obj.get("user_id");
    String votes = (String) obj.get("votes").toString();
 //   System.out.println(user_name+user_id+votes);
    JSONObject votes_obj = (JSONObject) new JSONParser().parse(votes);
 //   System.out.println(votes_obj);
    long cool =(long) votes_obj.get("cool");
 //System.out.println(cool);
    long useful = (long) votes_obj.get("useful");
    long funny = (long) votes_obj.get("funny");
    String review_id = (String) obj.get("review_id");
    String business_id = (String) obj.get("business_id");
 //   System.out.println("user_id "+user_id+" cool "+cool+" useful "+useful+" funny "+funny);
  if(votesSQL == null ){
   String query = "INSERT INTO VOTES_REVIEW VALUES(?,?,?,?,?,?)";
   votesSQL = con.prepareStatement(query);
  }
  
  votesSQL.setLong(1, funny);
  votesSQL.setLong(2,useful);
  votesSQL.setLong(3, cool);
  votesSQL.setString(4, user_id);
  votesSQL.setString(5,review_id);
  votesSQL.setString(6, business_id);
  
  votesSQL.executeQuery();
  count++;
   }
   bufferedReader.close();
   System.out.println("count:" + count);
  }
 

}


