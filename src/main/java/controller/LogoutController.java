package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.*;



@WebServlet("/logOutController")
public class LogoutController extends HttpServlet {

	//Instantiating an object from the 'RequestDispatcher' class.
	RequestDispatcher disp;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		HttpSession session = req.getSession(false); //That false within the 'getSession(false)' is to not create if not exists
		
		
		String email = (String) session.getAttribute("email");
		
		
		  //1st: Instantiate an object from the 'DaoUsers' class:
		  DaoUsers daoObj = new DaoUsers();
		
		  //2nd: Access the 'retrieveId()' method via the 'daoObj':
          String strId =  daoObj.retrieveId(email);
		  int intId = Integer.parseInt(strId);
		
		  
		  
		
        if(session != null) {
        	
            session.invalidate(); // kill the session
            
            
            daoCart daoClearObj = new daoCart();
            
            daoClearObj.clearCart(intId);
            
            
        }

        // Redirect to login page with a logout message
       String logOutMessage = "You have been logged out!";
       
       req.setAttribute("logOutMessage", logOutMessage);
		
       
	   disp = req.getRequestDispatcher("/WEB-INF/view/login.jsp");
	   disp.forward(req, resp);
	   
       
		
	}//closing brace of the 'doGet()' method.
	
	
		
	
	
}//closing brace of the class.
