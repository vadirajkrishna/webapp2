<%@ page import="java.sql.*"%>
<%
    
	String userName = request.getParameter("userName");    
    String password = request.getParameter("password");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");
    
    String db_host = System.getenv("DB_HOST");
    String db_user = System.getenv("DB_USER");
    String db_password = System.getenv("DB_PASSWORD");
    String db_port = System.getenv("DB_PORT");
    String jdbc = "jdbc:mysql://" + db_host + ":" + db_port + "/gl_work";
    Class.forName("com.mysql.jdbc.Driver");
   
    Connection con = DriverManager.getConnection(jdbc, db_user, db_password);
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