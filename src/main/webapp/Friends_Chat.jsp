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
            height: 1vh;
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
   
    <!-- Responsive Chat Box -->
    <div class="card mx-auto chat-card" style="max-width: 600px; min-height: 400px;">
        <div class="card-header bg-primary text-white">Chat Box</div>
        <div class="card-body chat-body" id="chatBody" style="height: 300px; overflow-y: auto; background: #f4f6fb;">
            <div id="messagesArea">
            <% 
            String chat_sql = "SELECT * FROM message_box where (sender_id="+Integer.parseInt(session.getAttribute("userId").toString())+" AND receiver_id="+Integer.parseInt(request.getParameter("id"))+ ") OR (sender_id="+Integer.parseInt(request.getParameter("id"))+" AND receiver_id="+Integer.parseInt(session.getAttribute("userId").toString())+") ORDER BY date_created DESC";
            ResultSet rs_friend_requests_list = getConnection().prepareStatement(chat_sql).executeQuery();
            while(rs_friend_requests_list.next()) {
                String senderName = rs_friend_requests_list.getString("sender_name");
                String message = rs_friend_requests_list.getString("message");
                String dateCreated = rs_friend_requests_list.getString("date_created");
                int senderId = rs_friend_requests_list.getInt("sender_id");
                if (senderId == Integer.parseInt(session.getAttribute("userId").toString())) {
                    out.println("<div class='text-end mb-2'>");
                    out.println("<span class='badge bg-success'>You</span> <span class='ms-2'>" + message + "</span>");
                    out.println("<div class='small text-muted mt-1'>" + dateCreated + "</div>");
                    out.println("</div>");
                } else {
                    out.println("<div class='text-start mb-2'>");
                    out.println("<span class='badge bg-info'>" + senderName + "</span> <span class='ms-2'>" + message + "</span>");
                    out.println("<div class='small text-muted mt-1'>" + dateCreated + "</div>");
                    out.println("</div>");
                }
            }
            %>
            </div>
        </div>
        <div class="card-footer bg-white">
            <form action="Chat-Message-Insert.jsp" method="post" class="d-flex gap-2" >
                <input type="text" id="chatInput" class="form-control" name="message" placeholder="Type your message..." required>
                <input type="hidden" name="receiver_id" value="<%= request.getParameter("id") %>">
                <button type="submit" class="btn btn-primary">Send</button>
            </form>
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
<script>
// Auto-refresh the messagesArea div every 5 seconds
setInterval(function() {
    fetch('Friends_Chat.jsp?id=<%= request.getParameter("id") %>&ajax=1')
        .then(response => response.text())
        .then(html => {
            // Extract only the messagesArea content from the response
            const parser = new DOMParser();
            const doc = parser.parseFromString(html, 'text/html');
            const newMessages = doc.getElementById('messagesArea');
            if (newMessages) {
                document.getElementById('messagesArea').innerHTML = newMessages.innerHTML;
            }
        });
}, 1000);
</script>

</body>
</html>