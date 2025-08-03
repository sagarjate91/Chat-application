<%@include file="connect.jsp"%>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");

ResultSet rs = null;

String query = "SELECT * FROM users WHERE email = ? AND password = ?";
ps = con.prepareStatement(query);
ps.setString(1, email);
ps.setString(2, password);
rs = ps.executeQuery();

if (rs.next()) {
	// User authenticated successfully
	session.setAttribute("userId", rs.getInt("id"));
	session.setAttribute("userName", rs.getString("first_name") + " " + rs.getString("last_name"));
	session.setAttribute("userEmail", rs.getString("email"));
	session.setAttribute("userMobile", rs.getString("mobile"));
	session.setAttribute("userAddress", rs.getString("address"));
	PreparedStatement ps1=con.prepareStatement("UPDATE users SET status = 'Online' WHERE email = ?");
	ps1.setString(1, email);
	ps1.executeUpdate();
	response.sendRedirect("User-Home.jsp");
} else {
	out.println(
	"<script>alert('Invalid email or password. Please try again.'); window.location.href='Login.jsp';</script>");
}
%>