package model;

import java.util.regex.Pattern;

public class Auth {

	
//Email Validation
private static final Pattern EMAIL_REGEX =  Pattern.compile("^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$");


public boolean isEmailValid(String email) {
			    
	          return EMAIL_REGEX.matcher(email).matches();
			
    }//closing brace of the 'isEmailValid()' method.
		
	


		
//Phone Number Validation
private static final Pattern PHONE_REGEX =  Pattern.compile("^07\\d{2}\\d{3}\\d{4}$");  
		

public boolean isPhoneNumValid(String phoneNo) {
		   
	        // Remove all non-digit characters first:
		    String digitsOnly = phoneNo.replaceAll("[^0-9]", "");
		   
		    
		    // Check if it matches 07xx-xxx-xxxx (without hyphens):
		    return PHONE_REGEX.matcher(digitsOnly).matches();
		
   }//closing brace of the 'isPhoneNumValid()' method
		
			
		
	
	
}//closing brace of the class.
	
	
	
	
	

