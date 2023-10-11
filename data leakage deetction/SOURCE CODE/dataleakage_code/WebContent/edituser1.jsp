<%@ page import="java.sql.*,databaseconnection.*"%>
<html>
    <head>
	<title>login</title>
    </head>
    <body>
	<form>
	<% 
	 String username=(String)session.getAttribute("username");
	 String email=request.getParameter("emailid");
	String pass=request.getParameter("pass");
	Connection con=null;
	Statement st=null;
	ResultSet rs=null;
	String sql="update register set password='"+pass+"',emailid='"+email+"' where username='"+username +"' ";
	try
	{
	   con=databasecon.getconnection();
	    st=con.createStatement();
	   
		
	    int x=st.executeUpdate(sql);
		if(x!=0){
		response.sendRedirect("Userhome.jsp?msg=success");
		}
		
	}
	catch(SQLException e1)
	{
		
		System.out.println(e1);
	
	 }

	finally
	{
	     st.close();
	      con.close();
	}
            %>
             </form>
       </body> 	
</html>