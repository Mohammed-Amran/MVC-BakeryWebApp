package controller;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DaoUsers;
import model.UserRegistration;

@WebServlet("/registerController")
public class RegisterController extends HttpServlet {

	// Instantiating an object from the RequestDispatcher class.
	RequestDispatcher disp;
	
	
	//Email Validation
	private static final Pattern EMAIL_REGEX = 
		    Pattern.compile("^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$");

	public boolean isEmailValid(String email) {
		    return EMAIL_REGEX.matcher(email).matches();
		}
	
	//--------------------------------------------------------------------------------------------------------------
	
	//Phone Number Validation
	private static final Pattern PHONE_REGEX = 
		    Pattern.compile("^07\\d{2}\\d{3}\\d{4}$");  // Ignores hyphens
	
	public boolean isPhoneNoValid(String phoneNo) {
	    // Remove all non-digit characters first
	    String digitsOnly = phoneNo.replaceAll("[^0-9]", "");
	    // Check if it matches 07xx-xxx-xxxx (without hyphens)
	    return PHONE_REGEX.matcher(digitsOnly).matches();
	}
	
	//--------------------------------------------------------------------------------------------------------------
	
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		disp = req.getRequestDispatcher("/WEB-INF/view/register.jsp");
		disp.forward(req, resp);

	}// closing brace of the 'doGet()' method.

	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//Saving the user inputs into variables.
		String fullName = req.getParameter("fullName");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String phoneNo = req.getParameter("phoneNo");
		
		req.setAttribute("fullName", fullName);
		req.setAttribute("email", email);
		req.setAttribute("password", password);
		req.setAttribute("phoneNo", phoneNo);
		
		
	   //Checking the correctness of the email & phone number:
		String emailError = null;
		String phoneNoError = null;
		
		
		if(!isEmailValid(email)) {
			
			emailError = "Invalid Email Format!";
		}
		
		if(!isPhoneNoValid(phoneNo)) {
			
			phoneNoError = "Invalid Phone No. Format";
		}
	
		
		if(emailError != null || phoneNoError != null) {
			
			req.setAttribute("emailError", emailError);
			req.setAttribute("phoneError", phoneNoError);
			
			disp = req.getRequestDispatcher("/WEB-INF/view/register.jsp");
			disp.forward(req, resp);
			
		}
		
		
		//if the email & phoneNo were fine!, then:
		//Creating an object from the 'UserRegistration' class.
		UserRegistration userObj = new UserRegistration();
		
		userObj.setFullName(fullName);
		userObj.setEmail(email);
		userObj.setPassword(password);
		userObj.setPhoneNo(phoneNo);
		
		
		//Saving the user info into the database:
		DaoUsers dao = new DaoUsers();
		
	    boolean insertSuccess =	dao.insertUser(userObj);
		
	    if(insertSuccess) {
	    	
	    	//Then send the user to the customerView:
			disp = req.getRequestDispatcher("/WEB-INF/view/customer.jsp");
			disp.forward(req, resp);
	    	
	    }
	    else {
	    	
	    	//setting an error message!
	    	req.setAttribute("insertingError", "Users couldn’t be inserted into the database. Please try again!");
	    	
	    	disp = req.getRequestDispatcher("/WEB-INF/view/login.jsp");
	    	disp.forward(req, resp);
	    	
	    }
		
		
		
		
		
		
		
		
	}//closing brace of the 'doPost()' method.
	
	
	
	
	
	
	
	
	
	
	
}// closing brace of the class.
