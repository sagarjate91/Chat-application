
<%@include file="connect.jsp"%>
<%
// Check if the user is logged in
if (session.getAttribute("userName") == null) {
    response.sendRedirect("Login.jsp"); // Redirect to login page if not logged in
    return;
}

PreparedStatement ps1 =  getConnection().prepareStatement("UPDATE users SET status = 'Offline' WHERE email = ?");
ps1.setString(1, session.getAttribute("userEmail").toString());
ps1.executeUpdate();
session.invalidate(); // Invalidate the session to log out the user
response.sendRedirect("Index.jsp"); // Redirect to the home page after logout
%>