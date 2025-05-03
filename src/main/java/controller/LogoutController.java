package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/logOutController")
public class LogoutController extends HttpServlet {

	//Instantiating an object from the 'RequestDispatcher' class.
	RequestDispatcher disp;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		HttpSession session = req.getSession(false); //That false within the 'getSession(false)' is to not create if not exists
		
        if(session != null) {
        	
            session.invalidate(); // kill the session
        }

        // Redirect to login page with a logout message
       String logOutMessage = "You have been logged out!";
       
       req.setAttribute("logOutMessage", logOutMessage);
		
       
	   disp = req.getRequestDispatcher("/WEB-INF/view/login.jsp");
	   disp.forward(req, resp);
	   
       
		
	}//closing brace of the 'doGet()' method.
	
	
	
	
}//closing brace of the class.
