<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Login Page</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginStyle.css">

</head>


<body>



	<div id="main">

		<div id="heading">
			<h1>Suli Bakery</h1>
			<h4>Please log in to continue</h4>
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








</body>
</html>