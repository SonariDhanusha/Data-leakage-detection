<%@page import="java.sql.*"%>
<%@ page import="databaseconnection.*"%>
<html>
<head>
<title>SERVER Home Page</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Your website name | Homepage</title>

<!-- This template was created by Mantis-a [http://www.mantisa.cz/]. For more templates visit Free website templates [http://www.mantisatemplates.com/]. -->

<meta name="Description" content="..." />
<meta name="Keywords" content="..." />
<meta name="robots" content="all,follow" />
<meta name="author" content="..." />

<!-- Javascript -->
<meta http-equiv="Content-Script-Type" content="text/javascript" />

<!-- CSS -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen, projection, tv" />
<link rel="stylesheet" href="css/style-print.css" type="text/css" media="print" />

<!-- Favicon -->
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />


<script type="text/javascript">


function valid()
{
var a = document.form.filename.value;
var b = document.form.subject.value;
var c = document.form.datafile.value;

if(document.form.user.selectedIndex==0)
{
alert("Select User");

document.form.user.focus();

return false;
}
if(b=="")
{
alert("Enter Subject");
document.form.subject.focus();
return false;
}
if(a=="")
{
alert("Enter FileName");
document.form.filename.focus();
return false;
}

if(c=="")
{
alert("Select File to Uploads");
document.form.datafile.focus();
return false;
}

}
function open1(){
    window.location = "http://localhost:8080/dataleakage/agenthome.jsp"
}

</script>

</head>

<body>
<form name="form" enctype="multipart/form-data" action="uploadedfile.jsp" onSubmit="return valid();" method="post"  >


<%

 Connection con=null;
	Statement st=null;
	
	ResultSet rs=null;
	
	
	String sql="select username  from register ";
	try
	{
		con=databasecon.getconnection();
		st=con.createStatement();
		rs=st.executeQuery(sql);
		
		//session.setAttribute( "id", n );
		

	
	%>

  <div id="wrapper"> 
    <!-- Header -->
    <div id="header"> 
      <!-- Your website name  -->
      <h1><font color="#FFFFFF">Data Leakage Detection</font></h1>
      <!-- Your website name end -->
      <!-- Your slogan -->
      <h2></h2>
      <!-- Your slogan end -->
      <div id="header-arrow"></div>
    </div>
    <!-- Header end -->
    <!-- Menu -->
    <a href="#skip-menu" class="hidden">Skip menu</a> 
    <ul id="menu" class="cleaning-box">
      <li class="first"><a href="distributorhome.jsp" >HOME</a></li>
      <li><a href="distributorsend.jsp">Send Files</a></li>
      <li><a href="distributorviewfiles.jsp"  class="active">View Files</a></li>
      <li><a href="distributorleakfiles.jsp">Leak Files</a></li> 
      <li><a href="index.html">LogOut</a></li>
    </ul>
    <!-- Menu end -->
    <hr class="noscreen" />
    <div id="content-box"> 
      <div id="content-box-in"> 
        <!-- Content left -->
        <div class="content-box-left"> 
          <div align="center" class="content-box-left-in"> 
            <h4>DISTRIBUTOR VIEW FILES </h4>
            <div align="center" style="background-color: #FFF2EF"> 
     		 <table border="1" width="500" height="" cellpadding="1" cellspacing="1">
                <tr>&nbsp;</tr>
                <tr> 
                  <td  height="10" class="paragraping"><font color="#FF0000"><strong>ID</strong></font></td>
                  <td  height="" class="paragraping"><font color="#FF0000"><strong>UserName</strong></font></td>
                  <td  class="paragraping"> <font color="#FF0000"><strong>File Name</strong></font></td>
                  <td  class="paragraping"><font color="#FF0000"> <strong>Subject</strong></font></td>
                  <td  class="paragraping"><font color="#FF0000"> <strong>Date</strong></font></td>
                </tr>
               <%
           	
           	
           	String sql1="select * from file";
           	try
           	{
           		con=databasecon.getconnection();
           		st=con.createStatement();
           		rs=st.executeQuery(sql1);
           		while(rs.next())
           		{
           			int a = rs.getInt(5);
           			String b = rs.getString(1);
           			String c =rs.getString(4);
           			String d =rs.getString(2);
           			String e =rs.getString(6);
           			%>
           			<tr> 
                  <td  height="10" class="paragraping"><font size="2" > 
                    <%=a%>
                    </font></td>
                  <td  height="" class="paragraping"><font size="2"  > 
                    <%=b%>
                    </font></td>
                  <td  class="paragraping"> <font size="2" > 
                    <%=c%>
                    </font></td>
                  <td  class="paragraping"><font size="2" > 
                    <%=d%>
                    </font></td>
                  <td  class="paragraping"><font size="2" > 
                    <%=e%>
                    </font></td>
                </tr>
           			<%
           		}
           	}
           	catch(Exception e)
           	{
           		e.printStackTrace();
           	}
               %>
     		</table>
            </div>
          </div>
        </div>
        <!-- Content left end -->
        <hr class="noscreen" />
        <!-- Content right -->
        <div class="content-box-right"> 
          <h4>Welcome Distributor!</h4>
          <div class="content-box-right-in"> 
            <dl>
              <dt><br />
                <a href="#"><img src="img/user1.jpg" width="120" height="90" " /></a> 
              </dt>
            </dl>
          </div>
          <div class="content-box-right-in"></div>
          <div id="column-right-bottom">&nbsp;</div>
        </div>
        <!-- Content right end -->
        <div class="cleaner">&nbsp;</div>
      </div>
    </div>
    <hr class="noscreen" />
    <!-- Footer -->
    <!-- Footer end -->
  </div>
<%
}
catch(Exception e)
	{
		System.out.println(e);
	}
	  finally
	{
		con.close();
		
		st.close();
	}
 
  %>
  </form>
</body>
</html>
