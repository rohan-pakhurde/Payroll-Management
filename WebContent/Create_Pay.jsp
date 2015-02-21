
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 


<jsp:include page="FunctionLayout.jsp"></jsp:include>
<script type="text/javascript">

function goBack(){
window.navigate("HrFunctions.jsp");
}


</script>
<div class="Section">
		<div class="iView" id="iView" >
		 
		<% 
		 try
		 {
				Class.forName("com.mysql.jdbc.Driver");  
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll","root","Saibaba1989."); 
		%>
		<form action="CreatePayslip.jsp">
		<table>
		<tr><td>Enter</td></tr>
		<tr><td><label for="eid">Employee ID : </label> </td><td><input type="text" value="" name="txtEmployeeId" id="txtEmployeeId" /></td></tr>
		<tr><td><label for="month">Month : </label> </td><td><select name="Month" id="month"  onchange="">
	   	<option value="-1">Select</option>
		<%
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
		 		con.close();
		 		}	 		
			 %>
		 
		 	</select></td></tr>
		
			<tr><td><label for="year">Year : </label> </td><td><select name="Year" id="year"  onchange="">
	   		<option value="-1">Select</option> 
			<% 
		 
				Class.forName("com.mysql.jdbc.Driver");  
				Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll","root","Saibaba1989."); 
				if(!con1.isClosed()) 
				{ 
		 		
		 		//out.println("Successfully connected to " + "MySQL server using TCP/IP...");
		 		 
				String strProcedure1="{call getYears()}";
				CallableStatement cs1=con1.prepareCall(strProcedure1);
				ResultSet rs1=cs1.executeQuery();
				 while(rs1.next())
				{
			%>
				
				<option value="<%=rs1.getString(1)%>"><%=rs1.getString(1)%></option> 
			<%				
				}		
	 			con1.close();
	 			}
	 		%>
	 		
		 
		 	</select></td></tr>
		 	<tr><td><label for="daysPresent">Number of days worked : </label> </td><td><input type="text" value="" name="da" id="da" /></td></tr>
			<tr><td><label for="noa">Number of arrear days : </label> </td><td><input type="text" value="" name="noa" id="noa" /></td></tr>		
			<tr style="padding:10%;"><td><button class="Button" type="submit" name="" onclick="" style="">Generate Payslip</button></td>
			<td><button class="Button" name="" onclick="goBack()" style="float:right;">Go Back</button></td></tr>			
			</table>
			</form>
			<%
		 		}
		 		catch(Exception e)
		 		{
	 		%>
	 		<p>Error has occured.</p>
	 		<%
	 			}		
		 	%>
			</div>
	</div>




