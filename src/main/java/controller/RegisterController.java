package controller;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.*;
import model.*;

@WebServlet("/registerController")
public class RegisterController extends HttpServlet {

	// Instantiating an object from the RequestDispatcher class.
	RequestDispatcher disp;
	
	
	

	//This 'doGet()' method below is to handle the Request from the 'login.jsp' page
	//that just wants to access the 'register.jsp' page via the 'href' link.
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
		
		
		
	   //Checking the correctness of the email & phone number:
		String emailError = null;
		String phoneNoError = null;
		
		
		//1:Instantiating an object from the Auth class.
		Auth authObj = new Auth();
		
		
			
		if( !authObj.isEmailValid(email) ) {
			
			emailError = "Invalid Email Format!";
		}
		
		if(!authObj.isPhoneNumValid(phoneNo)) {
			
			phoneNoError = "Invalid Phone No. Format";
		}
	
		
		if(emailError != null || phoneNoError != null) {
			
			//so here, if the one of the Email & PhoneNum (or both) weren't correct!
			//user will be returned back to the register.jsp page.
			
			//setting the already inputed fields, so that user do not required to re-enter them!			
			req.setAttribute("fullName", fullName);
			req.setAttribute("email", email);
			req.setAttribute("password", password);
			req.setAttribute("phoneNo", phoneNo);
			
			
			req.setAttribute("emailError", emailError);
			req.setAttribute("phoneError", phoneNoError);
			
			disp = req.getRequestDispatcher("/WEB-INF/view/register.jsp");
			disp.forward(req, resp);
			
		}
		else {
			
			
			//If the email & phoneNo were fine!, then:
			
			//Create an object from the 'UserRegistration' class:
			UserRegistration userObj = new UserRegistration();
			
			userObj.setFullName(fullName);
			userObj.setEmail(email);
			userObj.setPassword(password);
			userObj.setPhoneNo(phoneNo);
			
				
			
			//Saving the user info into the database:
			
			//1st: Instantiating an object from the DAO class:
			DaoUsers dao = new DaoUsers();
			
			//Passing the userObj object into the insertUser method:
		    boolean insertSuccess =	dao.insertUser(userObj);
			
		    
		    //So, if the Insertion success:
		    if(insertSuccess) {
		    	
		    	//Initializing the Session Object:
		    	HttpSession session = req.getSession(true); //Exactly same as: HttpSession session = req.getSession();
		       
		    	
		    	//Setting the essential user-info's to the session object! would be required for further steps:
		    	session.setAttribute("fullName", fullName);
		    	session.setAttribute("email", email);
		    	session.setAttribute("phoneNo", phoneNo);
		    	
		    	
		    	//Setting the session time-out to 2 hours:
		    	session.setMaxInactiveInterval(2 * 60 * 60);
		    	
		    	
		    	
		    	//Finally, Forwarding the user to the main view(customerView):
				disp = req.getRequestDispatcher("/WEB-INF/view/customer.jsp");
				disp.forward(req, resp);
		    	
		    }
		    else {
		    	
		    	//setting an error message!
		    	req.setAttribute("insertingError", "Failed to Register, Please try again!");
		    	
		    	disp = req.getRequestDispatcher("/WEB-INF/view/register.jsp");
		    	disp.forward(req, resp);
		    	
		    }
			
			
			
		}//closing brace of the else.
		
		
		
		
		
		
		
		
		
		
	}//closing brace of the 'doPost()' method.
	
	
	
	
	
	
	
	
	
	
	
}// closing brace of the class.
