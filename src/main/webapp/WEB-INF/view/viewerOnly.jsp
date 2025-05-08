<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&family=Parisienne&display=swap" rel="stylesheet">
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/viewerOnlyStyle.css">
<title>Viewer Only Page</title>

 <style>
    .carousel-image-wrapper {
      width: 100px;
      height: 900px;
      margin: 20px auto;
      overflow: hidden;
      border-radius: 15px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    }

    .carousel-image-wrapper img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
  </style>


</head>

<body>

<!-- Appbar/Navigation -->
<nav class="appbar">
    <div class="appbar-brand">
        <h1>Bakery Shop</h1>
    </div>
    <div class="appbar-actions">
        <button class="btn signup-btn" onclick="window.location.href='signup.jsp'">
            <i class="fas fa-user-plus"></i> Sign Up
        </button>
        <button class="btn login-btn" onclick="window.location.href='login.jsp'">
            <i class="fas fa-user"></i> Login
        </button>
    </div>
</nav>

<!-- Hero Section with Gallery -->
<section class="hero">

  <div class="hero-content">
  
        <h2>Freshly Baked Delights</h2>
        <p>Discover our artisan breads and pastries made with love</p>
        
    </div>

  <div style="display: flex; justify-content: center;">

    <!-- Carousel inserted here -->
    <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
  
  
  
  <div class="carousel-inner">
  
    <div class="carousel-item active" data-bs-interval="5000">
    
      <img src="${pageContext.request.contextPath}/images/img1.jpg" class="d-block" alt="Bread 1">
      
    </div>
    
    <div class="carousel-item" data-bs-interval="3000">
    
      <img src="${pageContext.request.contextPath}/images/img2.jpg" class="d-block" alt="Croissant">
      
    </div>
    
    <div class="carousel-item">
    
      <img src="${pageContext.request.contextPath}/images/img3.jpg" class="d-block" alt="Pastry">
      
    </div>
    
    <div class="carousel-item">
    
      <img src="${pageContext.request.contextPath}/images/img4.jpg" class="d-block" alt="Pastry">
      
    </div>
    
    <div class="carousel-item">
    
      <img src="${pageContext.request.contextPath}/images/img5.jpg" class="d-block" alt="Pastry">
      
    </div>
    
    <div class="carousel-item">
    
      <img src="${pageContext.request.contextPath}/images/img6.jpg" class="d-block" alt="Pastry">
      
    </div>
    
    
    
  </div>
  
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
  
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
    
  </button>
  
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
  
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
    
  </button>
  
</div>

</div>
    
</section>




<!-- Main Content - Menu Section -->
<main class="menu-container">
    <h2 class="menu-title">Our Menu</h2>
    <div class="menu-items">
        <!-- Menu items will be added here dynamically or statically later -->
    </div>
</main>

<!-- Footer -->
<footer class="footer">
    <p>&copy; 2023 Bakery Shop. All rights reserved.</p>
</footer>

<!-- Font Awesome for icons -->
<script src="https://kit.fontawesome.com/a076d05399.js"></script>


<!-- Bootstrap JS + Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>