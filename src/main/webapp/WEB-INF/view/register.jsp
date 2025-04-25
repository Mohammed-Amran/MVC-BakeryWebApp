<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Register Page</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/registerStyle.css">

</head>

<body>

 <div id="main">

        <div id="heading">
            <h1>Sign Up</h1>
            <h4>Create your account</h4>
        </div>

        <div class="card">

            <form name="registerForm" method="post" action="registerController">

                <label for="fullname"> Full Name: </label>
                <input type="text" id="fullname" name="fullname" placeholder="Enter your full name" required>

                <label for="email"> Email: </label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>

                <label for="password"> Password: </label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>

                <label for="phone"> Phone: </label>
                <input type="tel" id="phone" name="phoneNo" placeholder="Enter your phone number" required>

                <div class="button-container">
                
              <button type="submit" name="register" value="signup" class="btn">Sign Up</button>
                    
              <button type="button" class="cancel" onclick="window.location.href='${pageContext.request.contextPath}/loginController'"> Cancel </button>
                </div>

            </form>

        </div>

    </div>



</body>
</html>