<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<% 

String name=request.getParameter("User");
String pwd=request.getParameter("Pwd");


/*
Authentication logic and retrieve user type
*/
try
{
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll","root","Saibaba1989.");
	
	String strProcedure="{call validateEmployee('"+name+"','"+pwd+"')}"; 
	CallableStatement cs=con.prepareCall(strProcedure); 
	ResultSet rs=cs.executeQuery(strProcedure);
	
	if(rs.next())
	{
			if(rs.getInt("Active")==1)
			{
				session.setAttribute("UserId", rs.getString("EmployeeId"));
				session.setAttribute("Username",rs.getString("FirstName")+" "+rs.getString("LastName"));
				session.setAttribute("Type", rs.getString("EmpType"));
				response.sendRedirect("Home.jsp");
			}
			else
			{
				session.setAttribute("Message", "Soory. You cannot be granted acess as your status with company is inactive.");
				response.sendRedirect("Login.jsp");
			}
	}
	else
	{
		session.setAttribute("Message", "Please enter a valid username and password.");
		response.sendRedirect("Login.jsp");
	}

	con.close();
}
catch(Exception e)
{
	session.setAttribute("Message", e.getMessage());
	response.sendRedirect("Login.jsp");
}
%>