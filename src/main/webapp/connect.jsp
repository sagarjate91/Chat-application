<%@ page import="java.sql.*" %>
<%

Connection con = null;
PreparedStatement ps = null;
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chatapp", "root", "admin");
   
} catch (Exception e) {
    out.println("<script>alert('Error: " + e.getMessage() + "'); window.location.href='Login.jsp';</script>");
} 


%>