<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String unFE = request.getParameter("loginID");
String pwdFE = request.getParameter("password");

System.out.println("....   "+unFE+"....  "+pwdFE);
%>

<% 
	Class.forName("com.mysql.jdbc.Driver");
	Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/dataleakage","root","");
	System.out.println(".... Connected  ");
	try
	{
	   Statement st=con.createStatement();
	  ResultSet  rs=st.executeQuery("select * from register where username='"+unFE+"' AND password='"+pwdFE+"'");
		if(unFE.equalsIgnoreCase("distributor") && pwdFE.equalsIgnoreCase("distributor"))
		{
		session.setAttribute( "username", unFE );
		response.sendRedirect("distributorhome.jsp");  // distributer hme.jsop
		}
		else if(rs.next())
	     {
		 session.setAttribute( "username", unFE );
		 response.sendRedirect("agenthome.jsp");   // agentHome.jsp
	    } 
		else
		{
			response.sendRedirect("you hacker.jsp");
		}
	  out.println("Login Error-please check ur ID and password");
	}
	catch(Exception e1)
	{
		System.out.println(e1);
	 }

            %>


</body>
</html>