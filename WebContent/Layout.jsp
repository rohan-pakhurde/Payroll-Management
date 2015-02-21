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
	<% session.removeAttribute("Page"); %>
	<div class="Section"><div class="Banner"><div class="Logo"></div></div></div>
	
		<%String name=(String)session.getAttribute("Username");%>
		
	<div class="Section"><div class="User"><p>Welcome, <%= name %></p></div></div>

	<div class="Section" id="Menu">
		<div class="Menu" >
			<ul>
			<li><a  href="Home.jsp">Home</a></li>
			<li><a  href="GetInfo.jsp">My Info</a></li>
			<li><a  href="MyPayslipGen.jsp">My Payslip</a></li>
			<% String Type=(String)session.getAttribute("Type");
			if (Type.equals("HR"))
			{%>
			<li><a href="HrFunctions.jsp">My HR</a></li>
			<%} %>
			<li><a href="Logout.jsp">Logout</a></li>
			
			</ul>
		</div>
	</div>

<!-- 	<div class="Section">
		<div class="iView" id="iView" >
		
		</div>
	</div>
	-->
<!--

	<div class="Section"> <div class="Detail">
	<p>Description of function :</p>
	<p id="Detail" >skldjcalksjc samdncsadsnc aksjdncasnds</p>
	</div></div>
 -->
	</body>
</html>