<%@ page import="java.sql.*, javax.sql.*, databaseconnection.*, java.util.HashSet, java.util.ArrayList, java.util.Iterator, java.io.*"%>
<html>
<head>
<title>Chennai Sunday</title>
<script language="JavaScript">

</script>
</head>
<body background="Images/clouds_background.jpg">
<%
	
String filename = (String)session.getAttribute("fname");
System.out.println(filename);
session.setAttribute("fname", filename);
	//String mod = (String)session.getAttribute("status");
	Blob file= null;
	
	Connection con1 = null;
	PreparedStatement ps1 = null;
	ResultSet rs1 = null;
	String sql1=null;
	/* if(mod.equals("lock"))
	{
	 response.sendRedirect("keyenter.jsp?msg=lock");
	 }
	
	 else
	 { */
	 sql1 = "select datafile from file where filename ='"+filename+"'";
	 
	try
	{
		con1 = databasecon.getconnection();
		ps1 = con1.prepareStatement("select datafile from file where filename ='"+filename+"'");
		//ps1.setString(1,filename);
		rs1 = ps1.executeQuery();
		while(rs1.next())
		{	
		file = rs1.getBlob(1);
		session.setAttribute("resumeBlob",file);
		response.sendRedirect("agentdownload.jsp");
		}
	}
	
	catch(Exception e)
	{
		out.println("Exception :"+e);
	}
	finally
	{
		if(con1 != null)
			con1.close();
		if(ps1 != null)
			ps1.close();
		if(rs1 != null)
			rs1.close();
	}
	
	//out.print(file);
	//out.print(filename);
 // response.sendRedirect("keyenter.jsp?msg=lock");
	 //}
%>


</body>
</html>