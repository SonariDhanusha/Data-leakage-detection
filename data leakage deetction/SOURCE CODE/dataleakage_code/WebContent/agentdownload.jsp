<%@ page import="java.sql.*, javax.sql.*, databaseconnection.*, java.util.HashSet, java.util.ArrayList, java.util.Iterator, java.io.*"%>
<html>
<head>
<title>Chennai Sunday</title>
<script language="JavaScript">

</script>
</head>

<body>		
<%String filename = (String)session.getAttribute("fname");
System.out.println(filename);
session.setAttribute("fname", filename);
         try{
		 
		Blob b = (Blob)session.getAttribute("resumeBlob");
		
		if(b != null)
		{
			//String fileName =(String)session.getAttribute("fname");

			filename+=".doc";
			byte[] ba = b.getBytes(1, (int)b.length());
			response.setContentType("application/msword");
			response.setHeader("Content-Disposition","attachment; filename=\""+filename+"\"");
			OutputStream os = response.getOutputStream();
			os.write(ba);
			os.close();
			ba = null;
			
			//session.removeAttribute("document1");
			}
			else
		{
			//response.sendRedirect("agentsuccess.jsp");
		}
			}
			catch(Exception e)
			{
			out.println("Exception :"+e);
			}
		
		
		
%>

</body>
</html>