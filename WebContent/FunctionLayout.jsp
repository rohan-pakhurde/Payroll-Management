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
	<body>
	<div class="Section"><div class="Banner"><div class="Logo"></div></div></div>
	<%String name=(String)session.getAttribute("Username");%>
	<div class="Section"><div class="User"><p>Welcome, <%= name %></p></div></div>

	<div class="Section">
		<div class="iView" id="FView" >
		
		</div>
	</div>

	<div class="Section"> <div class="Detail">
	<p>Description of function :</p>
	<p id="Detail" >skldjcalksjc samdncsadsnc aksjdncasnds</p>
	</div></div>

	</body>
</html>