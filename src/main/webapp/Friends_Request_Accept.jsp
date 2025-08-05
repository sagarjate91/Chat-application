<%@include file="connect.jsp"%>
<%
// Check if the user is logged in
if (session.getAttribute("userName") == null) {
    response.sendRedirect("Login.jsp"); // Redirect to login page if not logged in
    return;
}

PreparedStatement ps1 =  getConnection().prepareStatement("UPDATE friend_requests SET status = 'accepted' WHERE id = ?");
ps1.setInt(1, Integer.parseInt(request.getParameter("id"))); // Assuming requestId is passed as a parameter
int result = ps1.executeUpdate();

if (result > 0) {
	out.println("<script>alert('Request accepted successfully!'); window.location.href='Chat.jsp';</script>");
} else {
	out.println(
	"<script>alert('Request accepted failed. Please try again.'); window.location.href='Chat.jsp';</script>");
}
%>