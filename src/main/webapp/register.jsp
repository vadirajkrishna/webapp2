<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
String ip = request.getParameter("ip");
session.setAttribute("host", ip);
out.println(session.getAttribute("host"));
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
    </head>
    <body bgcolor="silver">
        <form method="GET" action="userRegistration.jsp">

		Enter Information Here
		<br />
		First Name 	<input type="text" name="firstName"/> <br />
        Last Name 	<input type="text" name="lastName"/> <br />
        Email 		<input type="text" name="email" /> <br />
		User Name 	<input type="text" name="userName" /> <br />
		Password	<input type="password" name="password" /> <br />
		<input type="submit" value="Submit" /> <br />
		<input type="reset" value="Reset" /> <br />
		Already registered!! <a href="index.jsp">Login Here</a>
               
        </form>
    </body>
</html>