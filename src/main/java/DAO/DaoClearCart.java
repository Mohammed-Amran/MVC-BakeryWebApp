package DAO;


import java.sql.*;

public class DaoClearCart {

	
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
	
	
	
	

	
	//This method will clear out all added items related to user with id = ?
	public void clearCart(int userId) {
		
	    String sql = "DELETE FROM cartItems WHERE id = ?";

	    try (Connection conn = getConnection();
	    		
	         PreparedStatement stmt = conn.prepareStatement(sql)) {
	         
	        stmt.setInt(1, userId);
	        stmt.executeUpdate();

	    } 
	    catch (SQLException e) {
	    	
	        e.printStackTrace();
	    }
	    
	}//closing brace of the 'clearCart()' method.	
	
	
	
	
	
}//closing brace of the class.
