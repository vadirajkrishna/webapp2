<%@ page import="java.sql.*"%>
<%
    
	String userName = request.getParameter("userName");    
    String password = request.getParameter("password");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");
    String ip = session.getAttribute("host");
    
    String jdbc = "jdbc:mysql://" + ip + ":3306/gl_work";
    Class.forName("com.mysql.jdbc.Driver");
   
    //Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gl_work", "root", "Mysql@123");
    //Connection con = DriverManager.getConnection("jdbc:mysql://54.211.54.14:6703/gl_work", "root", "mypassword");
    
    Connection con = DriverManager.getConnection(jdbc, "root", "mypassword");
    Statement st = con.createStatement();
    int i = st.executeUpdate("insert into USER(first_name, last_name, email, username, password, regdate) values ('" + firstName + "','" 
    + lastName + "','" + email + "','" + userName + "','" + password + "', CURDATE())");
    if (i > 0) {
        response.sendRedirect("welcome.jsp");
       
    } else {
        response.sendRedirect("index.jsp");
    }
%>