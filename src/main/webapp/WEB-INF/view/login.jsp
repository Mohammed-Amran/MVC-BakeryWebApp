<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
	
	
<!DOCTYPE html>

<html>


<head>

<meta charset="UTF-8">
<title>Login Page</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginStyle.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginErrorModalStyle.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</head>



<body>


<!-- If login failed! the 'Login-Error' pop-up window will be shown -->
<c:if test="${not empty loginError}">

  <script type="text/javascript">
  
    window.onload = function () { $('#loginErrorModal').modal('show'); };
 
  </script>
  
</c:if>

 
<!-- If session expired! the 'SessionExpired-alert' pop-up window will be shown --> 
<c:if test="${not empty param.sessionExpiredMessage}">

  <script type="text/javascript">
  
    $(document).ready(function () { $('#sessionExpiredModal').modal('show'); });
    
  </script>
  
</c:if>

  
  
<!-- If the user logged out! the 'Logout-alert' pop-up window will be shown -->  
<c:if test="${not empty requestScope.logOutMessage}">
  
  <script type="text/javascript">
 
   $(document).ready(function () { $('#logoutModal').modal('show'); });
 
   </script>
  
</c:if>
 
  
  

	<div id="main">

		<div id="heading">
		
			<h1>Suli Bakery</h1>
			
			<h4 style="font-weight: bold;" >Please log in to continue</h4>
			
		</div>




		<div class="card">

			<form name="loginForm" action="loginController" method="post">


				<label for="email"> <b>Email</b> </label> 
				<input type="email" id="email" name="email" placeholder="Enter your email" required> 
				
				<label for="password"> <b>Password</b> </label>
				<input type="password" id="password" name="password" placeholder="Enter your password" required>


				<button type="submit" class="btn">Login</button>


			</form>



			<div class="signup-link">
		
               <p>Don't have an account? <a href="${pageContext.request.contextPath}/registerController">Sign Up</a></p>

			</div>

		</div>


	</div>



	<!-- Login Error Modal -->
	<div class="modal fade" id="loginErrorModal" tabindex="-1" role="dialog" aria-labelledby="loginErrorModalLabel" aria-hidden="true">
		
		<div class="modal-dialog" role="document">
			
			<div class="modal-content">

				<div class="modal-header">
				
					<h5 class="modal-title" id="loginErrorModalLabel">Login Failed</h5>
					
						
				</div>


				<div class="modal-body">
				
					<p> <c:out value="${loginError}" /> </p>
					
				</div>



				<div class="modal-footer">
				
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					
				</div>


			</div>
			
		</div>
		
	</div>
	<!-- closing brace of the error message pop-up modal -->


    <!-- Session Expired Modal -->
	<div class="modal fade" id="sessionExpiredModal" tabindex="-1" role="dialog" aria-labelledby="sessionExpiredModalLabel" aria-hidden="true">
		
		<div class="modal-dialog" role="document">

			<div class="modal-content">

				<div class="modal-header">
					
					<h5 class="modal-title" id="sessionExpiredModalLabel">Session Expired</h5>
				
				</div>

				<div class="modal-body">
					
					<p> <c:out value="${param.sessionExpiredMessage}" /> </p>
					
				</div>

				<div class="modal-footer">
				
					<button type="button" class="btn btn-secondary" data-dismiss="modal"> Close </button>
					
				</div>

			</div>

		</div>
		
	</div> <!-- Closing tag of the 'Session Expired' modal -->


   <!-- Logout Message Modal -->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="logoutModalLabel" aria-hidden="true">
		
		<div class="modal-dialog" role="document">

			<div class="modal-content">

				<div class="modal-header">
				
					<h5 class="modal-title" id="logoutModalLabel">Logged Out</h5>
					
				</div>

				<div class="modal-body">
					
					<p> <c:out value="${requestScope.logOutMessage}" /> </p>
				
				</div>

				<div class="modal-footer">
					
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					
				</div>

			</div>

		</div>
		
	</div> <!-- Closing tag of the 'Logout Message' modal -->



</body>


</html>