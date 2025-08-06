<%@include file="connect.jsp"%>
<%


if (session.getAttribute("userName") == null) {
 response.sendRedirect("Login.jsp"); // Redirect to login page if not logged in
 return;
}

try{

PreparedStatement ps1 =  getConnection().prepareStatement("INSERT INTO message_box(sender_id,receiver_id,message,date_created,sender_name) VALUES(?,?,?,?,?)");
ps1.setString(1, session.getAttribute("userId").toString());
ps1.setString(2, request.getParameter("receiver_id"));
ps1.setString(3, request.getParameter("message"));
ps1.setString(4, new java.util.Date().toString());
ps1.setString(5, session.getAttribute("userName").toString());
ps1.executeUpdate();
response.sendRedirect("Friends_Chat.jsp?id=" + request.getParameter("receiver_id"));

}catch(Exception e){
    e.printStackTrace();
    out.println("<script>alert('Error occurred while sending message. Please try again later.'); window.location.href='Friends_Chat.jsp?id=" + request.getParameter("receiver_id") + "';</script>");
}

%>