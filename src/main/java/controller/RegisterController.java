package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/registerController")
public class RegisterController extends HttpServlet {

	// Instantiating an object from the RequestDispatcher class.
	RequestDispatcher disp;

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
		
		
		
	}//closing brace of the 'doPost()' method.
	
	
	
	
	
	
	
	
	
	
	
}// closing brace of the class.
