package insertion;
import java.util.Iterator;
import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
public class InsertFriends {
 String line = null;
 ArrayList<JSONObject> json = new ArrayList<JSONObject>();
 PreparedStatement businessSQL = null;
 JSONObject obj;
 static Connection con = null;

 public static void main(String[] args) throws SQLException, ParseException, IOException, java.text.ParseException {
  // TODO Auto-generated method stub
  DBConnection dbcontection = new DBConnection();
  con = dbcontection.openConnection();
  InsertFriends user = new InsertFriends();
  user.insertFriends();
 }
 public void insertFriends() throws ParseException, IOException, SQLException, java.text.ParseException {
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

}


 
