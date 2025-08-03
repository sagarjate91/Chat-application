<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="connect.jsp"%>

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
    <div class="card mx-auto mb-4" style="max-width: 450px;">
        <div class="card-body">
            <h5 class="card-title">Online Users</h5>
            <!-- Responsive Online Users List -->
            <div class="table-responsive">
                <table class="table table-striped table-hover mb-0">
                    <thead class="table-light">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Username</th>
                            <th scope="col">Status</th>
                            <th scope="col">Send Friend Request</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%-- Example dynamic data, replace with actual user list from database --%>
                        <%
                            // Example: Fetch online users from the database
                            String query = "SELECT * FROM users where email!='"+session.getAttribute("userEmail")+"'";
                            ps = con.prepareStatement(query);
                            ResultSet rs = ps.executeQuery();
                            int count = 1;
                            while (rs.next()) {
                                String username = rs.getString("first_name") + " " + rs.getString("last_name");
                                String status = rs.getString("status");
                                %>
                        <!-- Example static data, replace with dynamic user list -->
                        <tr>
                            <th scope="row"><%=count %></th>
                            <td><%=username %></td>
                            
                            <%
                            
                            if(status.equals("Online")) {
                                %>
                                 <td><span class="badge bg-success"><%=status %></span></td>
                                <% 
                            } else {
                            	  %>
                                  <td><span class="badge bg-danger"><%=status %></span></td>
                                 <% 
                            }
                            
                            %>
                            
                           
                            
                            
                            <td><span class="badge bg-success">Send</span></td>
                        </tr>
                        
                        <%
                        count++;
                            }
                        
                        %>
                       
                        <!-- End example -->
                    </tbody>
                </table>
            </div>
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