/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package insertion;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

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

