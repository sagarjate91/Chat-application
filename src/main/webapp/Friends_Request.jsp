<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="connect.jsp"%>

<%
       // Check if the user is logged in
        if (session.getAttribute("userName") == null) {
            response.sendRedirect("Login.jsp"); // Redirect to login page if not logged in
            return;
        }
    
        int userId = (int) session.getAttribute("userId");
        String query = "INSERT INTO friend_requests (sender_id, receiver_id, status) VALUES (?, ?, 'Pending')";
        PreparedStatement ps2 =  getConnection().prepareStatement(query);
        ps2.setInt(1, userId);
        ps2.setInt(2, Integer.parseInt(request.getParameter("receiverId")));
        int result = ps2.executeUpdate();
        if (result > 0) {
            out.println("<script>alert('Friend request sent successfully!'); window.location.href='Chat.jsp';</script>");
        } else {
            out.println("<script>alert('Failed to send friend request. Please try again.'); window.location.href='Chat.jsp';</script>");
        }



%>