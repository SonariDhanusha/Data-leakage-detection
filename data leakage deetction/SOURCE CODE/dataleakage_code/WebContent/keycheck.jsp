<%@ page import="java.sql.*,databaseconnection.*"%>
<html>
    <head>
	<title>login</title>
    </head>
    <body>
	<form>
	<% 
	String filename = (String)session.getAttribute("fname");
	System.out.println(filename);
	session.setAttribute("fname", filename);
	String key1=request.getParameter("key");		
	Connection con=null;
	PreparedStatement pst=null;
	ResultSet rs=null;
	String k=null;
	String mod=null;
	//String sql="select * from  file  where filename='"+filename+"'";

/* 	try
	{
	   con=databasecon.getconnection();
	    st=con.createStatement();
	    rs=st.executeQuery(sql);
				
		
	    while(rs.next())
		{
		k=rs.getString(1);
		mod = rs.getString("mode");
		if(k.equals(key))
		{
		 session.setAttribute("status",mod);	
		 response.sendRedirect("userfileview.jsp"); 
		}
		else
		{
			response.sendRedirect("keyenter.jsp?msg=invalid");
		}
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
         */    
         try
         {
        	 con=databasecon.getconnection();
        	 pst = con.prepareStatement("select * from  file  where filename='"+filename+"'");
        	 rs = pst.executeQuery();
        	 while(rs.next())
        	 {
        		 k = rs.getString("key1");
        		 System.out.println(k);
        		 mod = rs.getString("mode"); 
        		 if(key1.equalsIgnoreCase(k) && mod.equalsIgnoreCase("unlock"))
        		 {
        			 //session.setAttribute("status",mod);	
        			 response.sendRedirect("userfileview.jsp"); 
        		 }
        		 else if(mod.equalsIgnoreCase("lock"))
        		 {
        			 response.sendRedirect("keyenter.jsp?msg=lock");
        		 }
        		 
        	 }
        	 
        	 %>
        	 <jsp:forward page="keyenter.jsp?msg=invalid"></jsp:forward>
        	 <%
        	 
         }
         catch(Exception e)
         {
        	 e.printStackTrace();
         }
         %>
             </form>
       </body> 	
</html>