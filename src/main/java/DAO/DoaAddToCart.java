package DAO;

import java.sql.*;


public class DoaAddToCart {

	
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
	
	
	
		    
		 // Insert item into 'cartItems' table
		    public boolean insertIntoCartItem(int id, String itemName, int selectedQuantity) {
		        
		        String sql = "INSERT INTO cartItems (id, itemName, selectedQuantity) VALUES (?, ?, ?)";

		        try (Connection conn = getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
		            
		            stmt.setInt(1, id);
		            stmt.setString(2, itemName);
		            stmt.setInt(3, selectedQuantity);

		            System.out.println("Trying to insert into cartItems: ID=" + id + ", Item=" + itemName + ", Quantity=" + selectedQuantity);

		            int rowsInserted = stmt.executeUpdate();

		            return rowsInserted > 0; // return true if insertion was successful

		        }
		        catch (SQLException e) {
		        	
		            e.printStackTrace();
		            
		            return false;
		        }
		        
		        
		    }//closing brace of the 'insertIntoCartItem()' method.
	    
	
		    
   //=====================================================================================================-=============		    
		    
		    //Retrieving the numbers of items in the 'carItems' table.
		    public int getCartItemCount(int userId) {
		        
		    	String sql = "SELECT COUNT(*) FROM cartItems WHERE id = ?";

		        try (Connection conn = getConnection();
		             
		        		PreparedStatement stmt = conn.prepareStatement(sql)) {
		             
		            stmt.setInt(1, userId);
		            
		            ResultSet rs = stmt.executeQuery();

		            if (rs.next()) {
		            	
		                return rs.getInt(1);
		            }

		        } 
		        catch (SQLException e) {
		        	
		            e.printStackTrace();
		        }

		        return 0; // Return 0 if error occurs
		        
		    }//closing brace of the 'getCartItemCount()' method.	    
		    
		    
		    
		    
		    
		    
		    
	
	
}//closing brace of the class.
