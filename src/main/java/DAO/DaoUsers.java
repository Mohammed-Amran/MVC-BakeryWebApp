package DAO;

import java.sql.*;

import model.UserRegistration;

public class DaoUsers {

	   //This below URL is used to connect my Java app to Mysql, with the name of the DB.
	    private final String jdbcURL = "jdbc:mysql://localhost:3306/bakeryweb";
	  
	    private final String jdbcUsername = "root";  
	    private final String jdbcPassword = "";      

	   
	    private Connection getConnection() throws SQLException {
	        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
	    }

	    
	    public boolean insertUser(UserRegistration user) {
	    	
	    	
	        String sql = "INSERT INTO users (fullName, email, pass, phoneNo) VALUES (?, ?, ?, ?)";

	        
	        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
	        	
	            stmt.setString(1, user.getFullName());
	            stmt.setString(2, user.getEmail());
	            stmt.setString(3, user.getPassword());
	            stmt.setString(4, user.getPhoneNo());
	            
	            int rowsInserted = stmt.executeUpdate();
	            
	            return rowsInserted > 0;
	        } 
	        catch (SQLException e) {
	            e.printStackTrace();
	            
	            return false;
	        }
	        
	        
	    }//closing curly brace of the 'insertUser' method.
	
	
	
	
	
}//closing curly brace of the class.
