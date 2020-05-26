<%@ page import="java.sql.*"%>
<%
    
    String ip = request.getParameter("ip");
    String username = request.getParameter("username");    
    String password = request.getParameter("password");
    Class.forName("com.mysql.cj.jdbc.Driver");
    
    String db_host = System.getenv("DB_HOST");
    String db_user = System.getenv("DB_USER");
    String db_password = System.getenv("DB_PASSWORD");
    String db_port = System.getenv("DB_PORT");
    //out.println("DB_USER: " + db_user);
    //session.setAttribute("host", ip);
    //String jdbc = "jdbc:mysql://" + host + ":3306/gl_work";
    String jdbc = "jdbc:mysql://" + db_host + ":" + db_port + "/gl_work";
    Connection con = DriverManager.getConnection(jdbc, db_user, db_password);
    //Connection con = DriverManager.getConnection("jdbc:mysql://54.166.18.212:3306/gl_work", "root", "mypassword");
    //Connection con = DriverManager.getConnection("jdbc:mysql://54.211.54.14:6703/gl_work", "root", "mypassword");
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