
<%@ page import="java.sql.*"%>
<%
    
	String username = request.getParameter("username");    
    String password = request.getParameter("password");
    Class.forName("com.mysql.cj.jdbc.Driver");
    //Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gl_work", "root", "Mysql@123");
    Connection con = DriverManager.getConnection("jdbc:mysql://54.211.54.14:6703/gl_work", "root", "mypassword");
    Statement st = con.createStatement();
    ResultSet rs;
    /*if (username.equals("Test")) {
    	session.setAttribute("userid", username);
    	response.sendRedirect("success.jsp");
	} else {
		
		out.println(username);
		out.println("Invalid password <a href='welcome.jsp'>try again</a>");	
	} */
    //out.println("select * from user where userName='" +username+ "' and password='" +password + "'");
    rs = st.executeQuery("select * from USER where username='" + username + "' and password='" +password + "'");
    if (rs.next()) {
        session.setAttribute("userid", username);
        response.sendRedirect("success.jsp");
    } else {
        out.println("Invalid password <a href='welcome.jsp'>try again</a>");
    }
%>