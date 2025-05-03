package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.DaoUsers;

@WebServlet("/loginController")
public class LoginController extends HttpServlet {

	//Instantiating an object from the RequestDispatcher class.
	RequestDispatcher disp;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		disp = req.getRequestDispatcher("/WEB-INF/view/login.jsp");
		disp.forward(req, resp);
		
	}//closing brace of the doGet() method.
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		//Saving the user inputs.
	    String email = req.getParameter("email");
	    String password = req.getParameter("password");
	    
	    
	    DaoUsers DaoObj = new DaoUsers();
	    
	    //Checking if the user has already Registered?
	    if(DaoObj.CheckUser(email, password)) {
	    	
	    	//if the user has Registered already,so:
	    	
	    	
	    	//bring-in the users fullName from the DB:
	    	String fullName = DaoObj.retrieveFullName(email, password);
	    	
	    	//bring-in the users phoneNo from the DB:
	    	String phoneNo = DaoObj.retrievePhoneNo(email, password);
	    	
	    	
	    	
	    	//Initializing a Session object:
	    	HttpSession session = req.getSession(true);
	    	
	    	
	    	
	    	//Setting the essential user-info's to the session object! would be required for further steps:
	    	session.setAttribute("fullName", fullName);
	    	session.setAttribute("email", email);
	    	session.setAttribute("phoneNo", phoneNo);
	    	
	    	disp = req.getRequestDispatcher("/WEB-INF/view/customer.jsp");
	    	disp.forward(req, resp);
	    }
	    else {
	    	
	    	//setting an error message!
	    	req.setAttribute("loginError", "Login failed! Please check your email and password");
	    	
	    	disp = req.getRequestDispatcher("/WEB-INF/view/login.jsp");
	    	disp.forward(req, resp);
	    }
		
		
		
		
		
		
		
		
		
		
		
	}//closing brace of the 'doPost()' method.
	
	
	
	
	
	
	
	
	
	
	
}//closing brace of the class.
