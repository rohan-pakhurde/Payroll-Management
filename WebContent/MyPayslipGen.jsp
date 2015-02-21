 <%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

 <jsp:include page="Layout.jsp"></jsp:include>

	<div class="Section">
		<div class="iView" id="FView" >
		<form action="GetPayslip.jsp" method="post">
		<table>
		
		<!-- Populate months list -->
		<tr><td>Select payslip details </td>
		<tr><td><label for="months">Month : </label> </td>
		<td><select name="months">
	   	<option value="-1">Select Month</option> 
		<% 
		 
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll","root","Saibaba1989."); 
			if(!con.isClosed()) 
			{ 
	 		
	 		//out.println("Successfully connected to " + "MySQL server using TCP/IP...");
	 		 
			String strProcedure="{call getMonths()}";
			CallableStatement cs=con.prepareCall(strProcedure);
			ResultSet rs=cs.executeQuery();
			 while(rs.next())
			{
				%>
				
				<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option> 
				<%
				
				
			}
			//cs.execute();
			
	 		con.close();
	 		}
		
		 %>
		 </select></td></tr>
		<tr><td><label for="years">Year : </label> </td>
		<td><select name="years" >
	   	<option value="-1">Select Year</option> 
		<% 
		 
			Class.forName("com.mysql.jdbc.Driver");  
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll","root","Saibaba1989."); 
			if(!con.isClosed()) 
			{ 
	 		
	 		//out.println("Successfully connected to " + "MySQL server using TCP/IP...");
	 		 
			String strProcedure="{call getYears()}";
			CallableStatement cs=con.prepareCall(strProcedure);
			ResultSet rs=cs.executeQuery();
			 while(rs.next())
			{
				%>
				
				<option value="<%=rs.getInt(1)%>"><%=rs.getInt(1)%></option> 
				<%
				
				
			}
			//cs.execute();
			
	 		con.close();
	 		}
		
		 %>
		 </select></td></tr>
		<tr style="padding:10%;"><td><button class="Button" type="submit" name="" style="">View Payslip</button></td>
			<td><button class="Button" name="" onclick="goBack()" style="float:right;">Go Back</button></td></tr>
		</table>
		</form>
		</div>
</div>

