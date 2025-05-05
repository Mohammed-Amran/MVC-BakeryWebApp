package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.*;
import model.cartItems;

@WebServlet("/addToCartController")
public class addToCartController extends HttpServlet {

	RequestDispatcher disp;
	
	
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession(false);
		
		String email = (String) session.getAttribute("email");
		 
		
		//3 things are required to be inserted into the Cart!, :
		     // I. The itemName
		     // II. The selectedQuantity of the item
		     // III. The id of the user that has added this item into the Cart.
		
	/*I*/ String itemName = req.getParameter("itemName");
	
	/*II*/String strSelectedQuantity = req.getParameter("selectedQuantity");
		  int intSelectedQuantity = Integer.parseInt(strSelectedQuantity);
	
		  
		  
  /*III*/    //retrieving the id of the user:
		
		  //1st: Instantiate an object from the 'DaoUsers' class:
		  DaoUsers daoObj = new DaoUsers();
		
		  //2nd: Access the 'retrieveId()' method via the 'daoObj':
          String strId =  daoObj.retrieveId(email);
		  int intId = Integer.parseInt(strId);
		
		  
		 //Inserting the (id, itemName, selectedQuantity) into the cartItems table.
        		  
         //1st: Instantiating an object from the 'DoaAddToCart' class.
         daoCart daoAddToCartObj = new daoCart();
         
         
         //2nd: calling the 'insertIntoCartItem' method via the 'doaAddToCartObj'.
        boolean isInserted = daoAddToCartObj.insertIntoCartItem(intId, itemName, intSelectedQuantity);
		
       
        
		if(isInserted) {
			
			//1st:
			//retrieving the items number in the 'cartItems' table.
			int itemsCount = daoAddToCartObj.getCartItemCount(intId);
			
			session.setAttribute("cartCounter", itemsCount); 
			
			
			//2nd:
			//getting the Items from the cartItems table.
			
			//I.: Instantiating an object from the daoCart class.
			daoCart daoCartObj = new daoCart();
			
			//II.: Accessing the 'getCartItemsByUserId' method - to retrieve the items in the cart for that specific user.
		    try {
				
		    	List<cartItems> retrievedItems = daoCartObj.getCartItemsByUserId(intId);
		    	
		    	session.setAttribute("retrievedCartItems", retrievedItems);
		    	
		    	resp.sendRedirect(req.getContextPath() + "/forwardingToCustomer");
		    	
		    	
			} 
		    catch (Exception e) {
				
				String failedRetrievingItemsMessage = "Failed to retrieve cartItems!";
				session.setAttribute("itemRetrievalErrorMessage", failedRetrievingItemsMessage);
				
				
				resp.sendRedirect(req.getContextPath() + "/forwardingToCustomer");
			}
			
			
			
			
					 
		}
		else {
			
			String addToCartError = "Failed to Add Item into Cart!";
			
			session.setAttribute("addToCarErrorMessage", addToCartError);
			
			
			 resp.sendRedirect(req.getContextPath() + "/forwardingToCustomer");			
		}
		
		
		
		
		
		
		
	}//closing brace of the 'doPost()' method.
	
	
	
}//closing brace of the class.
