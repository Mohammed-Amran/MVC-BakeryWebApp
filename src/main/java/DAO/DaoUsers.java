package DAO;

import java.sql.*;

import model.UserRegistration;

public class DaoUsers {

	
//==================================================================================================================	

	 //JDBC URL for MySQL connection
    private final String jdbcURL = "jdbc:mysql://localhost:3306/bakeryweb?useSSL=false&serverTimezone=UTC";
    private final String jdbcUsername = "root"; // Our MySQL username
    private final String jdbcPassword = "1234"; // Our MySQL password (

    
    // Method to get connection to MySQL Database
    private Connection getConnection() throws SQLException {
       
    	try {
    		
            Class.forName("com.mysql.cj.jdbc.Driver"); // Loading the MySQL JDBC driver
            
        } 
    	catch (ClassNotFoundException e) {
    		
            e.printStackTrace();
        }
    	
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        
    }//closing brace of the 'getConnection()' method.

    
//================================================================================================================== 
    
    
    
    
    // Insert User into 'users' table
    public boolean insertUser(UserRegistration user) {
    	
    	//The below Table column(attribute) names! must be exactly the same of the Actual table column(attribute) names!
        String sql = "INSERT INTO users (fullName, email, pass, phoneNo) VALUES (?, ?, ?, ?)";

        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, user.getFullName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getPhoneNo());

            System.out.println("Trying to insert: " + user.getFullName() + ", " 
                + user.getEmail() + ", " + user.getPassword() + ", " + user.getPhoneNo());

            int rowsInserted = stmt.executeUpdate();

            return rowsInserted > 0; // true if at least one row inserted

        } 
        
        catch (SQLException e) {
        	
            e.printStackTrace();
            return false;
            
        }
        
        
    }//closing brace of the 'insertUser'.
	
	
//==================================================================================================================     
    
    
    //Check if a user exist in the db or not!? :
    //This is for the Logging in Authentication:
    public boolean CheckUser(String email, String password) {
    	
        String sql = "SELECT * FROM users WHERE email = ? AND pass = ?";
        
        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setString(1, email);
            stmt.setString(2, password);
            
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();  // If there is a result, return true, else false
            }
            
        } 
        catch (SQLException e) {
        	
            e.printStackTrace();
            return false;
            
        }
        
    }//closing brace of the 'CheckUser()' method.

  //================================================================================================================== 
    
    
   
    //Retrieving the Fullname of user.
    public String retrieveFullName(String email, String pass) {
    	
    	
    	String sql = "SELECT fullName FROM users WHERE email = ? AND pass = ?";
    	
    	
    	try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            stmt.setString(2, pass);

            try (ResultSet rs = stmt.executeQuery()) {
            	
                if (rs.next()) {
                	
                    return rs.getString("fullName");
                    
                }
                
            }

        } 
    	catch (SQLException e) {
    		
            e.printStackTrace();
        }
    	

        return "Unknown Name"; // return Unknown Name if not found or error occurs
    	
    	
 
    }//closing brace of the 'retrieveFullName()' method
    
    
   
//================================================================================================================== 
    
    
//Retrieving the PhoneNo of user.
public String retrievePhoneNo(String email, String pass) {
	
	
	String sql = "SELECT phoneNO FROM users WHERE email = ? AND pass = ?";
	
	try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

        stmt.setString(1, email);
        stmt.setString(2, pass);

        try (ResultSet rs = stmt.executeQuery()) {
        	
            if (rs.next()) {
            	
                return rs.getString("phoneNo");
                
            }
        }

    } 
	catch (SQLException e) {
		
        e.printStackTrace();
    }

    return "Unknown phoneNo"; // return Unknown phoneNo if not found or error occurs
	
	
	
}//closing brace of the 'retrievePhoneNo()' method.
    
    
    
//==================================================================================================================   



//Retrieving the id of user.
public String retrieveId(String email) {
	
	
	String sql = "SELECT id FROM users WHERE email = ?";
	
	try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

      stmt.setString(1, email);
     

      try (ResultSet rs = stmt.executeQuery()) {
      	
          if (rs.next()) {
          	
              return rs.getString("id");
              
          }
      }

  } 
	catch (SQLException e) {
		
      e.printStackTrace();
  }

  return "Unknown id"; // return Unknown phoneNo if not found or error occurs
	
	
	
}//closing brace of the 'retrieveId()' method.
  
  
  
//==================================================================================================================
	
	
}//closing curly brace of the class.
