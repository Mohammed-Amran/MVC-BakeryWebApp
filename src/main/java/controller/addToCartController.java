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

@WebServlet("/addToCartController")
public class addToCartController extends HttpServlet {

	RequestDispatcher disp;
	
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession(false);
		
		String email = (String) session.getAttribute("email");
		 
		
		//3 things required to the into the Cart!, :
		     // I. The itemName
		     // II. The selectedQuantity of the item
		     // III. The id of the user that has added this item into the Cart.
		
	/*I*/ String itemName = req.getParameter("itemName");
	
	/*II*/String strSelectedQuantity = req.getParameter("selectedQuantity");
		  int intSelectedQuantity = Integer.parseInt(strSelectedQuantity);
	
	      //retrieving the id of the user:
		
		  //1st: Instantiate an object from the 'DaoUsers' class:
		  DaoUsers daoObj = new DaoUsers();
		
		  //2nd: Access the 'retrieveId()' method via the 'daoObj':
 /*III*/  String strId =  daoObj.retrieveId(email);
		  int intId = Integer.parseInt(strId);
		
		 //Inserting the (id, itemName, selectedQuantity) into the cartItems table.
        
         //1st: Instantiating an object from the 'DoaAddToCart' class.
         DoaAddToCart daoAddToCartObj = new DoaAddToCart();
         
         
         //2nd: calling the 'insertIntoCartItem' method via the 'doaAddToCartObj'.
        boolean isInserted = daoAddToCartObj.insertIntoCartItem(intId, itemName, intSelectedQuantity);
		
       
        
		if(isInserted) {
			
			
			//retrieving the items number in the 'cartItems' table.
			int itemsCount = daoAddToCartObj.getCartItemCount(intId);
			
			session.setAttribute("cartCounter", itemsCount); 
			
			
			 disp = req.getRequestDispatcher("/WEB-INF/view/customer.jsp");
			 disp.forward(req, resp);
			 
		}
		else {
			
			String addToCartError = "Failed to Add Item into Cart!";
			
			session.setAttribute("addToCarErrorMessage", addToCartError);
			
			disp = req.getRequestDispatcher("/WEB-INF/view/customer.jsp");
			disp.forward(req, resp);
			
		}
		
		
	}//closing brace of the 'doGet()' method.
	
	
	
}//closing brace of the class.
