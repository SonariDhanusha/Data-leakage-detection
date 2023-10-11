<%@ page import="java.sql.*,databaseconnection.*"%>
<html>
    <head>
	<title>login</title>
    </head>
    <body>
	<form>
	<% 
	String filename =(String)session.getAttribute("fname");
	String uname=(String)session.getAttribute("username");
    //String pass=request.getParameter("pass");
	String key1=request.getParameter("key");		
	//System.out.println(pass);
	System.out.println(filename);
	
	Connection con=null;
	PreparedStatement pst=null,pst1=null;
	ResultSet rs=null;
	String k=null,p=null;
	String sql2=null;
	
	
	
	/* String sql1="select * from  file  where key1='"+key+"'";
	try
	{
	   con=databasecon.getconnection();
	    st=con.createStatement();
	    rs=st.executeQuery(sql1);
	    while(rs.next())
	    {
	    	k=rs.getString("key1");
	    	if(k.equals(key))
	    	{
	    		PreparedStatement ps = con.prepareStatement("update file set mode = 'unlock'  where filename = ?");
	    		ps.setString(1, filename);
	    		int i = ps.executeUpdate();
	    		if(i>0)
	    		{
	    			response.sendRedirect("fileunlock.jsp?msg=success");
	    		}	
	    	}	
	    	else
	    	{
	    		response.sendRedirect("fileunlock.jsp?msg='fail'");
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
	} */
	
	
	try
	{
		con=databasecon.getconnection();
		pst = con.prepareStatement("select * from  file  where filename='"+filename+"'");
		rs = pst.executeQuery();
		while(rs.next())
		{
			k = rs.getString("key1");
			if(k.equalsIgnoreCase(key1))
			{
				pst1 = con.prepareStatement("update file set mode = 'unlock'  where filename = '"+filename+"'");
				int i = pst1.executeUpdate();
				if(i>0)
				{
					response.sendRedirect("fileunlock.jsp?msg=success");
				}	
			}	
			else
			{
				response.sendRedirect("fileunlock.jsp?msg=invalid");
			}
		}
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
            %>
             </form>
       </body> 	
</html>