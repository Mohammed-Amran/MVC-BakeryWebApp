<%@ page language="java" session="true" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	

<%


if(session == null || session.getAttribute("fullName") == null){
	
	response.sendRedirect("login.jsp?sessionExpiredMessage=Session+expired+please+logIn+again!");

	return;
}

%>


<!DOCTYPE html>

<html>

<head>

<title>Bakery Order System</title>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<%-- Link to the CSS file for this customer view page --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/customerViewStyle.css">


<%-- Link to the CSS file for this userInfo modal view page --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/userInfoModalStyle.css">


<%-- Link to the CSS file for this customer view page --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/CheckoutModalStyle.css">


<%-- Link to google fonts --%>
<link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
	
	
<link rel = "shortcut icon" href="favicon.ico" type="image/x-icon">
 <link rel="preconnect" href="https://fonts.gstatic.com">
 <link href="https://fonts.googleapis.com/css2?family=Parisienne&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 
 <script src="https://kit.fontawesome.com/815d5311a8.js" crossorigin="anonymous"></script>
 
 <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
 
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <script src="mycart.js"></script>
 <script src="myscript.js"></script>	
	
	
	

</head>


<!--=========================-- Body of the WebPage --========================-->

<body>

	<!--  N A V I G A T I O N   B A R  -->
	<div class="topnav" id="myTopnav">


		<div class="navtop" id="mynavTop">

            <a href="" style="float: right;" data-toggle="modal" data-target="#userModal"> <i class="fas fa-user"></i> </a> 
			
            <a href="" style="float: right;" data-toggle="modal" data-target="#cart"> <i class="fas fa-shopping-cart"></i> <span class="cart-items"> ( 0 ) </span> </a> 

            <a href="" style="float: right;" data-toggle="modal" data-target="#Inbox"> <i class="fas fa-box-open"></i> <span class="inbox-items"> ( 0 ) </span> </a>

		</div>


	</div>


<!-- =========================================================================================================================== -->
<!-- ==============================================MODAL'S(POP-UP WINDOWS)====================================================== -->


<!-- ========- USER INFO MODAL -======= -->

	<!-- Modal(pop-up window) for the User Info -->
	<div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="userModalLabel" aria-hidden="true">

		<div class="modal-dialog" role="document">

			<div class="modal-content">

				<div class="modal-header">

					<h5 class="modal-title" id="userModalLabel">User Information</h5>

				</div>

				<div class="modal-body">

                   
					<c:choose>
					
					<c:when test="${not empty sessionScope.fullName && not empty sessionScope.email && not empty sessionScope.phoneNo }">
					
					<p>
						<strong>Name:</strong>
					    <span style="font-weight: 600; color: #000;"> <c:out value="${sessionScope.fullName}" /> </span>
					</p>
					
					<p>
						<strong>Email:</strong>
						<span style="font-weight: 600; color: #000;"> <c:out value="${sessionScope.email}" /> </span>
					</p>
					
					<p>
						<strong>Phone:</strong>
						<span style="font-weight: 600; color: #000;"> <c:out value="${sessionScope.phoneNo}" /> </span>
					</p>
					
					</c:when>

                    <c:otherwise>
                     
					   <p>User details not available.</p>

                    </c:otherwise>
                     
                     
					</c:choose>

                     

				</div>


				<div class="modal-footer">

					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                 <form name="logOutForm" method="get" action="${pageContext.request.contextPath}/logOutController" style="display:inline;">

					<button type="submit" class="btn btn-danger"> Logout </button>
					
				</form>	

				</div>


			</div>

		</div>

	</div> <!-- Closing tag of the User-info Modal -->



<!-- ################################################################################################################################ -->



<!-- ========- INBOX MODAL -=========== -->


<!-- Inbox Modal -->
	<div class="modal fade" id="Inbox" tabindex="-1" role="dialog"
		aria-hidden="true">

		<div class="modal-dialog modal-lg" role="document">

			<div class="modal-content">

				<div class="modal-header">

					<h3 class="modal-title" style="font-weight: bold;">Your Orders</h3>

				</div>

				<div class="modal-body"
					style="display: flex; justify-content: space-between; gap: 20px;">

					<!-- Left Section: Cart Items -->
					<div style="width: 50%;">

						<h5>Your Ordered Items</h5>

						<div class="checkout-cart-body"></div>

						<p style="font-size: 20px; margin-top: 10px;">

							<strong>Total Price: </strong><span id="checkoutTotalPrice">0</span>
							IQD

						</p>

					</div>


					<!-- Right Section: User Info Form -->
					<div style="width: 40%;">

						<h5>Status</h5>



					</div>

				</div>


				<div class="modal-footer">

					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>

				</div>


			</div>

		</div>

	</div> <!-- Closing Tag of the Inbox Modal -->



<!-- ################################################################################################################################ -->



<!-- ========- CART MODAL -=========== -->

<!-- Cart Modal -->
	<div class="modal fade" id="cart" tabindex="-1" role="dialog" aria-hidden="true">
		
		<div class="modal-dialog modal-lg" role="document">
			
			<div class="modal-content">
				
				<div class="modal-header">
					
					<h3 class="modal-title" style="font-weight: bold;">Your Cart</h3>
				
				</div>
				
				<div class="modal-body">
					
					<div class="cart-body"></div>
					
					<p style="font-size: 20px; margin-top: 5px;">
						
						<strong>Total Price: </strong><span id="totalPrice">0</span> IQD
					
					</p>
				
				</div>
				
				
				<div class="modal-footer">
					
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					
					<button type="button" class="btn btn-primary checkout-btn" onclick="Checkout()">Checkout</button>
				
				</div>
				
				
			</div>
			
		</div>
		
	</div> <!-- Closing Tag of the Cart Modal -->




<!-- ################################################################################################################################ -->



<!-- ========- CHECKOUT MODAL -=========== -->


<!-- Checkout Modal -->
	<div class="modal fade" id="checkoutModal" tabindex="-1" role="dialog" aria-hidden="true">

		<div class="modal-dialog modal-lg" role="document">

			<div class="modal-content">

				<div class="modal-header">

					<h3 class="modal-title" style="font-weight: bold;">Checkout</h3>

				</div>

				<div class="modal-body" style="display: flex; justify-content: space-between; gap: 20px;">

					<!-- Left Section: Cart Items -->
					<div style="width: 50%;">

						<h5>Your Items</h5>

						<div class="checkout-cart-body"></div>

						<p style="font-size: 20px; margin-top: 10px;">

							<strong>Total Price: </strong><span id="checkoutTotalPrice">0</span> IQD

						</p>

					</div>


					<!-- Right Section: User Info Form -->
					<div style="width: 40%;">

						<h5>Delivery Information</h5>

						<form id="deliveryForm">

							<div class="form-group">

								<label for="citySelect">City</label> <select id="citySelect" class="form-control" required>

									<option value="">Select District</option>
									<option value="Sulaymaniyah">Sulaymaniya</option>
									<option value="Erbil">Erbil</option>
									<option value="Duhok">Duhok</option>

								</select>

							</div>

							<div class="form-group">

								<label for="addressInput">Address</label>

								<textarea id="addressInput" class="form-control" rows="3" placeholder="Enter your address" required></textarea>

							</div>

							<button type="button" class="btn btn-success" onclick="processDelivery()">Order</button>

						</form>

					</div>

				</div>


				<div class="modal-footer">

					<button type="button" class="btn btn-secondary" data-dismiss="modal"> Close </button>

				</div>


			</div>


		</div>

	</div> <!-- Closing Tag of the Checkout Modal -->



<!-- =========================================================================================================================== -->
<!-- =========================================================================================================================== -->






	<!--=========================--  M A I N   C O N T E N T  --====================-->

	<div id="heading">

		<h1 id="heading-title" style="margin-top: 40px;">Suly Bakery</h1>

	</div>


	<!--  I T E M   C A R D S  -->

	<div id="main" style="margin-top: 40px;">


		<!-- Item 1 -->
		<div class="card">
		
			<div class="card-content">
			
				<img src="https://www.homestratosphere.com/wp-content/uploads/2020/07/baguette-bread-july222020-min-e1595406425983.jpg" class="item-img">
				
				<h1 style="margin-top: 78px;">Baguette Bread</h1>
				
			</div>
			
			<div class="card-action">
			
				<button class="btn btn-primary" onclick="openModal('1', 'Baguette Bread', 'Savour the taste of French sticks; made from flour, water, yeast and salt!')"> Select </button>
			
			</div>
			
		</div>


		<!-- Item Selection Modal for Item 1 -->
		<div class="modal fade" id="itemModal" tabindex="-1" role="dialog" aria-hidden="true">

			<div class="modal-dialog" role="document">

				<div class="modal-content">

					<div class="modal-header">

						<h5 class="modal-title" id="itemModalLabel"></h5>

					</div>


					<div class="modal-body">

						<p id="itemDescription"></p>

						<form id="itemForm">

							<select id="itemDropdown" class="price-dropdown" name="selectQuantity">

								<option value="2 pieces ~ 250iqd">2 pieces ~ 250iqd</option>
								<option value="4 pieces ~ 500iqd">4 pieces ~ 500iqd</option>
								<option value="8 pieces ~ 1000iqd">8 pieces ~ 1000iqd</option>
								<option value="12 pieces ~ 1500iqd">12 pieces ~ 1500iqd</option>

							</select>

						</form>

					</div>


					<div class="modal-footer">

						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>

						<button type="button" class="btn btn-primary"
							onclick="addToCart()">Add to Cart</button>

					</div>

				</div>

			</div>

		</div> <!-- Closing tag of Item Selection Modal for Item 1 -->


	<!--********************************************************************************************************-->

		<!-- Item 2 -->
		<div class="card">
		
			<div class="card-content">
				
				<img src="https://www.homestratosphere.com/wp-content/uploads/2020/07/brioche-bread-july222020-min.jpg" class="item-img">
				
				<h1>Brioche Bread</h1>
				
			</div>
			
			<div class="card-action">
			
				<button class="btn btn-primary" onclick="openModal('2', 'Brioche Bread', 'Unique French bread made with butter and eggs!')"> Select </button>
			
			</div>
			
		</div>


		<!-- Item Selection Modal for Item 2 -->
		<div class="modal fade" id="itemModal" tabindex="-1" role="dialog" aria-hidden="true">
		
			<div class="modal-dialog" role="document">
			
				<div class="modal-content">
				
					<div class="modal-header">
					
						<h5 class="modal-title" id="itemModalLabel"></h5>
						
					</div>
					
					
					<div class="modal-body">
					
						<p id="itemDescription"></p>
						
						<form id="itemForm">
						
							<select id="itemDropdown" class="price-dropdown" name="selectQuantity">
							
								<option value=" 2 pieces ~ 250iqd"> 2 pieces ~ 250iqd </option>
								<option value="4 pieces ~ 500iqd"> 4 pieces ~ 500iqd </option>
								<option value="8 pieces ~ 1000iqd"> 8 pieces ~ 1000iqd </option>
								<option value="12pieces ~ 1500iqd"> 12 pieces ~ 1500iqd </option>
								
							</select>
							
						</form>
						
					</div>
					
					
					<div class="modal-footer">
					
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						
						<button type="button" class="btn btn-primary" onclick="addToCart()">Add to Cart</button>
						
					</div>
					
				</div>
				
			</div>
			
		</div> <!-- Closing tag of Item Selection Modal for Item 2 -->


	<!--********************************************************************************************************-->

		<!-- Item 3 -->
		<div class="card">
		
			<div class="card-content">
				
				<img src="https://www.homestratosphere.com/wp-content/uploads/2020/07/ciabatta-bread-july222020-min.jpg" class="item-img">
				
				<h1>Ciabatta Bread</h1>
			
			</div>
			
			<div class="card-action">
			
				<button class="btn btn-primary" onclick="openModal('3', 'Ciabatta Bread', 'Perfect for paninis and sandwiches; consists of water, yeast, salt and flour!')"> Select </button>
			
			</div>
			
		</div>



		<!-- Item Selection Modal for Item 3 -->
		<div class="modal fade" id="itemModal" tabindex="-1" role="dialog" aria-hidden="true">
			
			<div class="modal-dialog" role="document">
				
				<div class="modal-content">
					
					<div class="modal-header">
					
						<h5 class="modal-title" id="itemModalLabel"></h5>
						
					</div>
					
					<div class="modal-body">
					
						<p id="itemDescription"></p>
						
						<form id="itemForm">
						
							<select id="itemDropdown" class="price-dropdown" name="selectQuantity">
							
								<option value=" 2 pieces ~ 250iqd">2 pieces ~ 250iqd</option>
								<option value="4 pieces ~ 500iqd">4 pieces ~ 500iqd</option>
								<option value="8 pieces ~ 1000iqd">8 pieces ~ 1000iqd</option>
								<option value="12pieces ~ 1500iqd">12 pieces ~ 1500iqd </option>
								
							</select>
							
						</form>
						
					</div>
					
					<div class="modal-footer">
					
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						
						<button type="button" class="btn btn-primary" onclick="addToCart()">Add to Cart</button>
						
					</div>
					
				</div>
				
			</div>
			
		</div> <!-- Closing tag of Item Selection Modal for Item 3 -->


	<!--********************************************************************************************************-->


		<!-- Item 4 -->
		<div class="card">
		
			<div class="card-content">
			
				<img src="https://www.homestratosphere.com/wp-content/uploads/2020/07/multigrain-bread-july222020-min.jpg" class="item-img">
				
				<h1>Multigrain Bread</h1>
			
			</div>
			
			<div class="card-action">
				
				<button class="btn btn-primary" onclick="openModal('4', 'Multigrain Bread', 'Specially for fitness freaks-contains oats, barley, flax, millet, and more!')"> Select </button>
			
			</div>
			
		</div>


		<!-- Item Selection Modal for Item 4 -->
		<div class="modal fade" id="itemModal" tabindex="-1" role="dialog" aria-hidden="true">
			
			<div class="modal-dialog" role="document">
				
				<div class="modal-content">
					
					<div class="modal-header">
						
						<h5 class="modal-title" id="itemModalLabel"></h5>
					
					</div>
					
					
					<div class="modal-body">
						
						<p id="itemDescription"></p>
						
						<form id="itemForm">
							
							<select id="itemDropdown" class="price-dropdown"name="selectQuantity">
								
								<option value=" 2 pieces ~ 250iqd">2 pieces ~ 250iqd</option>
								<option value="4 pieces ~ 500iqd">4 pieces ~ 500iqd</option>
								<option value="8 pieces ~ 1000iqd">8 pieces ~ 1000iqd</option>
								<option value="12pieces ~ 1500iqd">12 pieces ~ 1500iqd</option>
							
							</select>
							
						</form>
						
					</div>
					
					
					<div class="modal-footer">
					
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						
						<button type="button" class="btn btn-primary" onclick="addToCart()">Add to Cart</button>
					
					</div>
				
				</div>
			
			</div>
		
		</div> <!--Closing tag Item Selection Modal for Item 4 -->


	<!--********************************************************************************************************-->

		<!--Item 5 -->
		<div class="card">
		
			<div class="card-content">
			
				<img src="https://www.homestratosphere.com/wp-content/uploads/2020/07/whole-wheat-bread-july222020-min.jpg" class="item-img">
				
				<h1>Whole Wheat</h1>
				
			</div>
			
			<div class="card-action">
			
				<button class="btn btn-primary" onclick="openModal('5', 'Whole Wheat', 'Nutritious and has more fibre than regular bread!')"> Select </button>
			
			</div>
			
		</div>


		<!-- Item Selection Modal for Item 5 -->
		<div class="modal fade" id="itemModal" tabindex="-1" role="dialog" aria-hidden="true">
			
			<div class="modal-dialog" role="document">
				
				<div class="modal-content">
					
					<div class="modal-header">
					
						<h5 class="modal-title" id="itemModalLabel"></h5>
					
					</div>
					
					<div class="modal-body">
						
						<p id="itemDescription"></p>
						
						<form id="itemForm">
						
							<select id="itemDropdown" class="price-dropdown" name="selectQuantity">
								
								<option value=" 2 pieces ~ 250iqd">2 pieces ~ 250iqd</option>
								<option value="4 pieces ~ 500iqd">4 pieces ~ 500iqd</option>
								<option value="8 pieces ~ 1000iqd">8 pieces ~ 1000iqd</option>
								<option value="12pieces ~ 1500iqd">12 pieces ~ 1500iqd</option>
								
							</select>
							
						</form>
						
					</div>
					
					<div class="modal-footer">
					
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						
						<button type="button" class="btn btn-primary" onclick="addToCart()">Add to Cart</button>
						
					</div>
					
				</div>
				
			</div>
			
		</div> <!-- Closing tag of Item Selection Modal for Item 5 -->


	<!--********************************************************************************************************-->
		
		<!-- Item 6 -->
		<div class="card">
		
			<div class="card-content">
				
				<img src="https://www.homestratosphere.com/wp-content/uploads/2020/07/lavash-bread-july222020-min.jpg" class="item-img">
				
				<h1>Lavash Bread</h1>
			
			</div>
			
			<div class="card-action">
			
				<button class="btn btn-primary"	onclick="openModal('6', 'Lavash Bread', 'Low in fat and made with flour, salt and water!')"> Select</button>
			
			</div>
			
		</div>


		<!-- Item Selection Modal for Item 6 -->
		<div class="modal fade" id="itemModal" tabindex="-1" role="dialog" aria-hidden="true">
		
			<div class="modal-dialog" role="document">
			
				<div class="modal-content">
				
					<div class="modal-header">
					
						<h5 class="modal-title" id="itemModalLabel"></h5>
						
					</div>
					
					<div class="modal-body">
					
						<p id="itemDescription"></p>
						
						<form id="itemForm">

							<select id="itemDropdown" class="price-dropdown" name="selectQuantity">
							
								<option value=" 2 pieces ~ 250iqd">2 pieces ~ 250iqd</option>
								<option value="4 pieces ~ 500iqd">4 pieces ~ 500iqd</option>
								<option value="8 pieces ~ 1000iqd">8 pieces ~ 1000iqd</option>
								<option value="12 pieces ~ 1500iqd">12 pieces ~ 1500iqd
								</option>

							</select>
							
						</form>
						
					</div>
					
					
					<div class="modal-footer">
					
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						
						<button type="button" class="btn btn-primary" onclick="addToCart()">Add to Cart</button>
						
					</div>
					
					
				</div>
				
			</div>
			
		</div> <!--Closing tag of Item Selection Modal for Item 6 -->


	<!--********************************************************************************************************-->

		<!-- Item 7 -->
		<div class="card">
		
			<div class="card-content">
			
				<img src="https://www.homestratosphere.com/wp-content/uploads/2020/07/matzo-bread-july222020-min.jpg" class="item-img">
				
				<h1>Thin Bread</h1>
				
			</div>
			
			<div class="card-action">
			
				<button class="btn btn-primary" onclick="openModal('7', 'Thin Bread', 'Tasty jewish bread made from wheat, barley, rice, oats and spelt!')"> Select </button>
			
			</div>
			
		</div>


		<!-- Item Selection Modal for Item 7 -->
		<div class="modal fade" id="itemModal" tabindex="-1" role="dialog" aria-hidden="true">
			
			<div class="modal-dialog" role="document">
				
				<div class="modal-content">
					
					<div class="modal-header">
						
						<h5 class="modal-title" id="itemModalLabel"></h5>
					
					</div>
					
					<div class="modal-body">
					
						<p id="itemDescription"></p>
						
						<form id="itemForm">
							
							<select id="itemDropdown" class="price-dropdown" name="selectQuantity">
								
								<option value=" 2 pieces ~ 250iqd">2 pieces ~ 250iqd</option>
								<option value="4 pieces ~ 500iqd">4 pieces ~ 500iqd</option>
								<option value="8 pieces ~ 1000iqd">8 pieces ~ 1000iqd</option>
								<option value="12pieces ~ 1500iqd">12 pieces ~ 1500iqd</option>

							</select>
							
						</form>
						
					</div>
					
					<div class="modal-footer">
					
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						
						<button type="button" class="btn btn-primary" onclick="addToCart()">Add to Cart</button>
						
					</div>
					
				</div>
				
			</div>
			
		</div> <!--Closing tag of Item Selection Modal for Item 7 -->


		<!--********************************************************************************************************-->

		<!-- Item 8 -->
		<div class="card">
		
			<div class="card-content">
				
				<img src="https://www.homestratosphere.com/wp-content/uploads/2020/07/naan-bread-july222020-min.jpg" class="item-img">
				
				<h1>Naan Bread</h1>
			
			</div>
			
			<div class="card-action">
			
				<button class="btn btn-primary" onclick="openModal('8', 'Naan Bread', 'Delicious naan that uses yogurt as its main ingredient!')"> Select</button>
			
			</div>
			
		</div>


		<!-- Item Selection Modal for Item 8 -->
		<div class="modal fade" id="itemModal" tabindex="-1" role="dialog" aria-hidden="true">
			
			<div class="modal-dialog" role="document">
				
				<div class="modal-content">
					
					<div class="modal-header">
						
						<h5 class="modal-title" id="itemModalLabel"></h5>
					
					</div>
					
					<div class="modal-body">
						
						<p id="itemDescription"></p>
						
						<form id="itemForm">
							
							<select id="itemDropdown" class="price-dropdown" name="selectQuantity">
								
								<option value=" 2 pieces ~ 250iqd">2 pieces ~ 250iqd</option>
								<option value="4 pieces ~ 500iqd">4 pieces ~ 500iqd</option>
								<option value="8 pieces ~ 1000iqd">8 pieces ~ 1000iqd</option>
								<option value="12pieces ~ 1500iqd">12 pieces ~ 1500iqd</option>

							</select>
							
						</form>
						
					</div>
					
					<div class="modal-footer">
					
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						
						<button type="button" class="btn btn-primary" onclick="addToCart()">Add to Cart</button>
					
					</div>
				
				</div>
			
			</div>
		
		</div> <!--Closing tag of Item Selection Modal for Item 8 -->


		<!--********************************************************************************************************-->


		<!-- Item 9 -->
		<div class="card">
		
			<div class="card-content">
			
				<img src="https://www.homestratosphere.com/wp-content/uploads/2020/07/tortilla-bread-july222020-min-e1595407483238.jpg" class="item-img">
				
				<h1>Tortilla</h1>
			
			</div>
			
			<div class="card-action">
				
				<button class="btn btn-primary" onclick="openModal('9', 'Tortilla', 'Soft, thin flatbreads utilised in various Mexican dishes, wraps and tacos!')"> Select</button>
			
			</div>
		
		</div>



		<!-- Item Selection Modal for Item 9 -->
		<div class="modal fade" id="itemModal" tabindex="-1" role="dialog" aria-hidden="true">
			
			<div class="modal-dialog" role="document">
				
				<div class="modal-content">
					
					<div class="modal-header">
						
						<h5 class="modal-title" id="itemModalLabel"></h5>
					
					</div>
					
					<div class="modal-body">
						
						<p id="itemDescription"></p>
						
						<form id="itemForm">
							
							<select id="itemDropdown" class="price-dropdown" name="selectQuantity">
								
								<option value=" 2 pieces ~ 250iqd">2 pieces ~ 250iqd</option>
								<option value="4 pieces ~ 500iqd">4 pieces ~ 500iqd</option>
								<option value="8 pieces ~ 1000iqd">8 pieces ~ 1000iqd</option>
								<option value="12pieces ~ 1500iqd">12 pieces ~ 1500iqd</option>

							</select>
							
						</form>
						
					</div>
					
					<div class="modal-footer">
						
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						
						<button type="button" class="btn btn-primary" onclick="addToCart()">Add to Cart</button>
					
					</div>
				
				</div>
			
			</div>
		
		</div> <!--Closing tag of Item Selection Modal for Item 9 -->


		<!--********************************************************************************************************-->



 <script>

 let selectedItem = {}; // Object to hold the selected item details

 // Function to open the modal and populate details
 function openModal(id, title, description) {
	 
                                              selectedItem.id = id; // Save item ID
                                              
                                              selectedItem.title = title; // Save item title
                                              
                                              document.getElementById('itemModalLabel').textContent = title;
                                              
                                              document.getElementById('itemDescription').textContent = description;

   
                                              // Open the modal
                                              $('#itemModal').modal('show');
                                              
                     }//closing brace of the 'openModal()' method.


                     
  //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                   
                     
                     
                     
 // Function to add the item to the cart
 function addToCart() {

    const selectedOption = document.getElementById('itemDropdown').value; // Get selected option
    
    selectedItem.quantity = selectedOption; // Save selected quantity in selectedItem

    // Extract the quantity and price (e.g., "2 pieces ~ 250iqd")
    const [quantity, price] = selectedOption.split(" ~ ");
    
    // Call the existing add_to_cart function with item details
    add_to_cart(selectedItem.id, selectedItem.title, price);

   
    // Close the modal
    $('#itemModal').modal('hide');

 }//closing brace of the 'addToCart()' method.


 
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 

</script>




<!--********************************************************************************************************-->



 </div>
	<!-- End of Main Div -->



	




<!--********************************************************************************************************-->



	
<!-- JS Codes -->

	<!-- Checkout modal JS code -->
	<script>

    // Open Checkout Modal
    function Checkout() {
    	
                         updateCheckoutModal();
                         
                         $('#checkoutModal').modal('show');
                         
    }//closing brace of the 'Checkout()' method.

    
    // Update Checkout Modal Content
    function updateCheckoutModal() {
    	
        const checkoutCartBody = document.querySelector('.checkout-cart-body');
        
        checkoutCartBody.innerHTML = '';
        
        let checkoutTotal = 0;

        cart.forEach((item, index) => {
        	
            checkoutTotal += item.price;
            
            checkoutCartBody.innerHTML += `
            
                <div style="display: flex; justify-content: space-between; align-items: center;">
                
                    <p><strong>${item.title}</strong> - ${item.quantity} pieces - ${item.price} IQD</p>
                    
                    <div>
                    
                        <button class="btn btn-sm btn-danger" onclick="removeItem(${index}); updateCheckoutModal();">Remove</button>
                        
                    </div>
                    
                </div>`;
        });

        
        document.getElementById('checkoutTotalPrice').textContent = checkoutTotal;
        
        
    }//closing brace of the 'updateCheckoutModal()' method.

    
    let x = 0;

    // Process Delivery (Placeholder for your backend integration)
    function processDelivery() {
        const city = document.getElementById('citySelect').value;
        const address = document.getElementById('addressInput').value;

        if (!city || !address) {
            alert('Please fill in all the fields.');
            return;
        }

        alert(`Order placed successfully!\nCity: ${city}\nAddress: ${address}`);
        
        // Reset cart and modal
        cart = [];
        updateCart();
        $('#checkoutModal').modal('hide');
        $('#cart').modal('hide');


       

        document.querySelector('.inbox-items').textContent = `( ${x += 1} )`;

    }




</script>



	<script>

 let cart = [];
 let totalPrice = 0;

 function openModal(id, title, description) {
        document.getElementById('itemModalLabel').textContent = title;
        document.getElementById('itemDescription').textContent = description;
        $('#itemModal').modal('show');
  }


 function addToCart() {
        const selectedOption = document.getElementById('itemDropdown').value;
        const [quantityText, priceText] = selectedOption.split(" ~ ");
        const quantity = parseInt(quantityText);
        const price = parseInt(priceText.replace("iqd", "").trim());

        const newItem = {
            id: Date.now(),
            title: document.getElementById('itemModalLabel').textContent,
            quantity,
            price
        };

        cart.push(newItem);
        updateCart();
        $('#itemModal').modal('hide');
 }


 function updateCart() {

    const cartBody = document.querySelector('.cart-body');
    cartBody.innerHTML = '';
    totalPrice = 0;

    cart.forEach((item, index) => {
       
        totalPrice += item.price;

        cartBody.innerHTML += `
            <div style="display: flex; justify-content: space-between; align-items: center;">
                <p><strong>${item.title}</strong> - ${item.quantity} pieces - ${item.price} IQD</p>
                <div>
                    <button class="btn btn-sm btn-success" onclick="increaseQuantity(${index})">Increase</button>
                    <button class="btn btn-sm btn-warning" onclick="decreaseQuantity(${index})">Decrease</button>
                    <button class="btn btn-sm btn-danger" onclick="removeItem(${index})">Remove</button>
                </div>
            </div>`;
    });

    document.getElementById('totalPrice').textContent = totalPrice;
    document.querySelector('.cart-items').textContent = `( ${cart.length} )`;
  }


  function increaseQuantity(index) {
    const item = cart[index];
    const dropdown = document.getElementById('itemDropdown');
    const options = Array.from(dropdown.options).map(option => option.value.split(" ~ "));

    const currentOption = options.find(([qty]) => parseInt(qty) === item.quantity);
    const currentIndex = options.indexOf(currentOption);

    if (currentIndex < options.length - 1) {
        const [newQuantity, newPrice] = options[currentIndex + 1];
        item.quantity = parseInt(newQuantity);
        item.price = parseInt(newPrice.replace("iqd", "").trim());
    }
    updateCart();
 }


  function decreaseQuantity(index) {
    const item = cart[index];
    const dropdown = document.getElementById('itemDropdown');
    const options = Array.from(dropdown.options).map(option => option.value.split(" ~ "));

    const currentOption = options.find(([qty]) => parseInt(qty) === item.quantity);
    const currentIndex = options.indexOf(currentOption);

    if (currentIndex > 0) {
        const [newQuantity, newPrice] = options[currentIndex - 1];
        item.quantity = parseInt(newQuantity);
        item.price = parseInt(newPrice.replace("iqd", "").trim());
    }
    updateCart();
 }


  function removeItem(index) {
    cart.splice(index, 1);
    updateCart();
  }


  function logoutUser() {
    
	  // Send a logout request to the server
    
	  fetch('mainPage.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'logout=true',
    })
        .then((response) => response.json())
        .then((data) => {
            if (data.status === 'success') {
                // Redirect to the login page
                window.location.href = 'login.html';
            } else {
                alert('Error logging out: ' + (data.message || 'Please try again.'));
            }
        })
        .catch((error) => {
            console.error('Logout failed:', error);
            alert('Error logging out. Please try again.');
        });
  }


</script>


	


<!--********************************************************************************************************-->



	<!-- Footer -->
	<div id="footer" style="margin-top: 40px;">

		<!-- Phone Numbers -->
		<div class="footer__contact">
		
			<i>+964 750 141 8006</i> <br> <i>+964 771 152 8011</i>
			
		</div>

		<!-- Social Media Icons -->
		<div class="footer__social">
		
			<ul class="horizontal-list text-center social-icons">
			
				<!-- Instagram Icon -->
				<li> <a href="#"> <i class="fab fa-instagram"></i> </a> </li>
				
				<!-- YouTube Icon -->
				<li> <a href="#"> <i class="fab fa-youtube"></i> </a> </li>
				
				<!-- Facebook Icon -->
				<li> <a href="#"> <i class="fab fa-facebook"></i> </a> </li>
				
			</ul>
			
		</div>

		<!-- Email -->
		<div class="footer__mail">
		
			<i>SulyBakery@gmail.com</i>
			
		</div>

	</div>




</body>

</html>