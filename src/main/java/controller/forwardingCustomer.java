package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/forwardingToCustomer")
public class forwardingCustomer extends HttpServlet {

	
	//Instantiating an object from the RequestDispatcher.
	RequestDispatcher disp;
	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		disp = req.getRequestDispatcher("/WEB-INF/view/customer.jsp");
		disp.forward(req, resp);
		
		
		
	}//closing brace of the 'doGet()' method.
	
	
	
	
	
}//closing brace of the class.
