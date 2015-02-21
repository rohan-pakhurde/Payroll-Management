

<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
		 
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll","root","Saibaba1989."); 
			if(!con.isClosed()) 
			{ 
	 		
	 		//out.println("Successfully connected to " + "MySQL server using TCP/IP...");
	 		 
	 		 //proc = conn.prepareCall("{ call sp_InsertEmployee('"+EmployeeCode+"','"+EmployeeNa me+"','"+Designation+"', '"+Department+"') }");
 				//proc.execute();
	 		 
	 		 
	 		 
			String strProcedure="{call viewPayslip(1,1)}";
			int a=1;
			
			CallableStatement cs=con.prepareCall("{call viewPayslip('"+a+"','"+a+"')}");
			
			ResultSet rs=cs.executeQuery();
			rs.next();
			
			%>
			<%=rs.getString(1)%>
			<%
			}
			 %>
</body>
</html>