<%@ page import="java.sql.*"%>
<%
    
    String ip = request.getParameter("ip");
    String username = request.getParameter("username");    
    String password = request.getParameter("password");
    Class.forName("com.mysql.cj.jdbc.Driver");
    
    String db_user = System.getenv("db_user");
    out.println("DB_USER: " + db_user);
    session.setAttribute("host", ip);
    String jdbc = "jdbc:mysql://" + ip + ":3306/gl_work";
    Connection con = DriverManager.getConnection(jdbc, "root", "mypassword");
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