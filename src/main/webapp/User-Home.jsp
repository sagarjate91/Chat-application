<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%

       // Check if the user is logged in
        if (session.getAttribute("userName") == null) {
            response.sendRedirect("Login.jsp"); // Redirect to login page if not logged in
            return;
        }

%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - My WebApp</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f8f9fa;
        }
        .form-container {
            margin-top: 80px;
            max-width: 400px;
            padding: 30px;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        }
          .hero {
            background: url('images/banner.jpg') no-repeat center center/cover;
            color: white;
            height: 10vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }
        .hero h1 {
            font-size: 3rem;
            font-weight: bold;
            
        }
        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2rem;
            }
        }
        .about {
            padding: 100px 20px;
        }
        footer {
            background-color: #343a40;
            color: white;
            padding: 20px 0;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <%@include file="ProjectName.jsp"%>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" 
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
             
        </button>
        <!-- Login Session Name Div -->
            <% if(session.getAttribute("userName") != null) { %>
                <div class="ms-3 text-white">
                    <strong style="color:green;">Login: <%= session.getAttribute("userName") %></strong>
                </div>
            <% } %>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link active" href="User-Home.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="Chat.jsp">Chat</a></li>
                <li class="nav-item"><a class="nav-link" href="Logout.jsp">Logout</a></li>
            </ul>
           
        </div>
    </div>
</nav>




<!-- Hero Section -->
<div class="hero">
    <div>
      
    </div>
</div>

<!-- About Section -->
<div class="about container text-center">
    <!-- User Details Div -->
    <div class="card mx-auto mb-4" style="max-width: 350px;">
        <div class="card-body">
            <h5 class="card-title">User Details</h5>
            <ul class="list-group list-group-flush text-start">
                <li class="list-group-item"><strong>Name:</strong> <%=session.getAttribute("userName") %></li>
                <li class="list-group-item"><strong>Email:</strong> <%=session.getAttribute("userEmail")%></li>
                <li class="list-group-item"><strong>Mobile:</strong> <%=session.getAttribute("userMobile")%></li>
                <li class="list-group-item"><strong>Address:</strong> <%=session.getAttribute("userAddress")%></li>
            </ul>
        </div>
    </div>
</div>
<!-- Footer -->
<footer class="text-center">
    <div class="container">
        &copy; 2025 Chat Apps | All rights reserved.
    </div>
</footer>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>