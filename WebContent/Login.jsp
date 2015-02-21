<html>
	<head>
	<title>   Payroll System   </title>
	<script type="text/javascript">
	function home()
	{
	alert("Home");
	}
	</script>
	<link rel="stylesheet" href="Templatestyle.css" type="text/css" media="screen" />
	</head>
	<body >
	<div class="Section"><div class="Banner"><div class="Logo"></div></div></div>	
	<div style="position:absolute; top: 60%; left: 43%; "> <img alt="" src="Images/Login13.gif" style="height: 200px;"> </div>
	<div class="Login" id="Login" style="top: 150px;">
		<form method="post" name="Sign_In" id="xxx" action="Authenticate.jsp">
		<table>
		<tr><td><label for="user">User ID :</label></td><td><input type="text" value="" name="User" id="user" /></td></tr>
	    <tr><td><label for="pwd">Password :</label></td><td><input type="password" value="" name="Pwd" id="pwd"  /></td></tr>
		</table>
	   	<div class="but"><button class="Button" type="submit" name="" onclick="" style="">Login</button></div>
	    </form>
	</div>
	
	<div class="Notice">
	
	<p>
	<%
	
	String msg=(String)session.getAttribute("Message");
	if(msg!=null)
	{
	 %>
	<%= msg%></p>
	<% }String Message="";
	session.setAttribute("Message", Message); %>
	</div>

	</body>
</html>