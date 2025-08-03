<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home - Chat Apps</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
        }
        .hero {
            background: url('images/banner.jpg') no-repeat center center/cover;
            color: white;
            height: 40vh;
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
            padding: 40px 20px;
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
                <li class="nav-item"><a class="nav-link active" href="Index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="Login.jsp">Login</a></li>
                <li class="nav-item"><a class="nav-link" href="Register.jsp">Register</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<div class="hero">
    <div>
        <img src="images/chat-bubbles.png" alt="Chat Bubbles" style="width:100px; margin-bottom:20px;">
        <h1>Welcome to Chat Apps</h1>
        <p>Connect, chat, and collaborate instantly!</p>
    </div>
</div>

<!-- About Section -->
<div class="about container text-center">
    <div class="row justify-content-center">
        <div class="col-md-4 mb-4">
            <img src="images/users.png" alt="Users" style="width:80px;">
            <h5 class="mt-3">Connect with Friends</h5>
            <p>Find and chat with your friends anytime, anywhere.</p>
        </div>
        <div class="col-md-4 mb-4">
            <img src="images/devices.png" alt="Devices" style="width:80px;">
            <h5 class="mt-3">Multi-Device Support</h5>
            <p>Access your chats from any device seamlessly.</p>
        </div>
        <div class="col-md-4 mb-4">
            <img src="images/security.png" alt="Security" style="width:80px;">
            <h5 class="mt-3">Secure Messaging</h5>
            <p>Your conversations are private and secure with us.</p>
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