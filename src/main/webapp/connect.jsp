<%@ page import="java.sql.*" %>
<%!

    public Connection getConnection() throws SQLException {
	Connection con = null;
	PreparedStatement ps = null;
	try {
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chatapp", "root", "admin");
	   
	} catch (Exception e) {

        e.printStackTrace();
	} 
	return con;
    }
	

        
        


%>