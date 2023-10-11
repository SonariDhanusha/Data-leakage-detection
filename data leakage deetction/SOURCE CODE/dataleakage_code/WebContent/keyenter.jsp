
<%@ page import="databaseconnection.*"%>
<%@page import="java.sql.*" %>
<html>
<head>
<title>Agent Distributor File </title>

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
</head>
<script type="text/javascript">
function valid()
{
var a = document.form.key.value;

if(a=="")
{
alert("Enter SecretKey");
document.form.key.focus();
return false;
}
}
</script>
<body>

<%
String filename = request.getParameter("msg");
session.setAttribute("fname", filename);
%>



  <div id="wrapper"> 
    <!-- Header -->
    <div id="header"> 
      <!-- Your website name  -->
     <h1><font color="#FFFFFF"> Data Leakage Detection</font></h1>
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
      <li class="first"><a href="Userhome.jsp">HOME</a></li>
      <li><a href="Agentdistributorfiles.jsp"  class="active">Distributor Files</a></li>
	  <!-- <li><a href="viewkey.jsp">View Key</a></li>  -->
      <li><a href="agentfile.jsp">User Files</a></li>
      <li><a href="agentsend.jsp">Compose</a></li> 
      <li><a href="agetdetails.jsp">My Account</a></li>
      <li><a href="index.html">LogOut</a></li>
    </ul>
    <!-- Menu end -->
    <hr class="noscreen" />
    <div id="content-box"> 
      <div id="content-box-in"> 
        <!-- Content left -->
        <div class="content-box-left"> 
          <div class="content-box-left-in"> 
            <h4>ENTER SECRET KEY</h4>
            <div align="center" style="background-color: #FFF2EF"> 
            <form name="form" action="keycheck.jsp" method="post" onSubmit="return valid();" >
              <table border="1" width="500" height="" cellpadding="5" cellspacing="5">
                <tr>&nbsp;</tr>
                <tr> 
                  <td  height="10" class="paragraping"><font color="#FF0000" size="+2"><img src="img/enter.jpeg" width="71" height="65">Enter 
                    Secret Key</font></td>
                </tr>
                <tr> 
                  <td  height="" class="paragraping">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <input name="key" type="password" ></td>
                </tr>
                <tr> 
                  <td > </td>
                </tr>
                <tr> 
                  <td >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    <input style="background: url('../img/submit.jpeg')" type="submit" name="download" value="Download" ></td>
                </tr>
                <tr> </tr>
              </table>
              </form>
              <%
              String msg = request.getParameter("msg");
              
              if(msg!=null)
              {
              if(msg.equalsIgnoreCase("invalid"))
              {
            	  %>
            	  <h5 i style="color: red">You entered Invalid Key. Please check key once and try again! </h5>
            	  <%
              }
              if(msg.equalsIgnoreCase("lock"))
              {
            	  %>
            	  <h4 i style="color: white">File is Locked! </h4>
            	 <a href="fileunlock.jsp"> Click Here to Unlock the File</a>
            	  <%
              }
              }
              %>
            </div>
          </div>
        </div>
        <!-- Content left end -->
        <hr class="noscreen" />
        <!-- Content right -->
        <div class="content-box-right"> 
          <h4>Welcome 
            <%=session.getAttribute("username")%>
            !</h4>
          <div class="content-box-right-in"> 
            <dl>
              <dt><br />
                <a href="#"><img src="img/user2.jpeg" width="120" height="90" " /></a> 
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
  </form>
</body>
</html>
