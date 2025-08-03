
<%@include file="connect.jsp"%>

<%
String firstName = request.getParameter("firstName");
String lastName = request.getParameter("lastName");
String email = request.getParameter("email");
String password = request.getParameter("password");
String mobile = request.getParameter("mobile");
String address = request.getParameter("address");

String query = "INSERT INTO users (first_name, last_name, email, password, mobile, address) VALUES (?, ?, ?, ?, ?, ?)";

ResultSet rs = con.createStatement().executeQuery("SELECT COUNT(*) FROM users WHERE email = '" + email + "'");
if (rs.next() && rs.getInt(1) > 0) {
	out.println(
	"<script>alert('Email already exists. Please use a different email.'); window.location.href='Register.jsp';</script>");
	return;
}

ps = con.prepareStatement(query);
ps.setString(1, firstName);
ps.setString(2, lastName);
ps.setString(3, email);
ps.setString(4, password);
ps.setString(5, mobile);
ps.setString(6, address);

int result = ps.executeUpdate();

if (result > 0) {
	out.println("<script>alert('Registration successful!'); window.location.href='Login.jsp';</script>");
} else {
	out.println(
	"<script>alert('Registration failed. Please try again.'); window.location.href='Register.jsp';</script>");
}
%>


