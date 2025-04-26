package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	    
	    //Setting a specific name for the email & password, in order to use them in the .jsp file:
	    req.setAttribute("email", email);
	    req.setAttribute("password", password);
		
		
		
		
		
		
		
		
		
		
		
	}//closing brace of the 'doPost()' method.
	
	
	
	
	
	
	
	
	
	
	
}//closing brace of the class.
