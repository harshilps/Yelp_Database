package insertion;
import java.util.Iterator;

import javax.swing.plaf.synth.SynthStyle;

import java.io.*;
import java.math.BigDecimal;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
public class InsertingVotes {
 String line = null;
 ArrayList<JSONObject> json = new ArrayList<JSONObject>();
 PreparedStatement businessSQL = null;
 JSONObject obj;
 static Connection con = null;

 public static void main(String[] args) throws SQLException, ParseException, IOException, java.text.ParseException {
  // TODO Auto-generated method stub
  DBConnection dbcontection = new DBConnection();
  con = dbcontection.openConnection();
  InsertingVotes user = new InsertingVotes();
  user.insertVotes();
 }
 public void insertVotes() throws ParseException, IOException, SQLException, java.text.ParseException {
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
}
