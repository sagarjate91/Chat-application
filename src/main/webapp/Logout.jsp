
<%@include file="connect.jsp"%>
<%
PreparedStatement ps1 = con.prepareStatement("UPDATE users SET status = 'Offline' WHERE email = ?");
ps1.setString(1, session.getAttribute("userEmail").toString());
ps1.executeUpdate();
session.invalidate(); // Invalidate the session to log out the user
response.sendRedirect("Index.jsp"); // Redirect to the home page after logout
%>