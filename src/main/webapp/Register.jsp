<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - My WebApp</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f8f9fa;
        }
        .form-container {
            margin-top: 50px;
            max-width: 500px;
            padding: 30px;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
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
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="Index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="Login.jsp">Login</a></li>
                <li class="nav-item"><a class="nav-link active" href="Register.jsp">Register</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Registration Form -->
<div class="container d-flex justify-content-center">
    <div class="form-container">
        <h3 class="text-center mb-4">Register</h3>
        <form action="Register-User.jsp" method="post">
            <div class="mb-3">
                <label class="form-label">First Name</label>
                <input type="text" name="firstName" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Last Name</label>
                <input type="text" name="lastName" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" name="email" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Mobile</label>
                <input type="text" name="mobile" class="form-control" pattern="[0-9]{10}" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Address</label>
                <textarea name="address" class="form-control" rows="3" required></textarea>
            </div>
            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-success w-100">Register</button>
            <div class="text-center mt-3">
                <a href="Login.jsp">Already have an account? Login</a>
            </div>
        </form>
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
