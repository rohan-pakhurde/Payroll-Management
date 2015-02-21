 <%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

 <jsp:include page="FunctionLayout.jsp"></jsp:include>

<% 
session.setAttribute("Page", "HRPage");
 %>
 <script type="text/javascript">
<!--
function submitform()
{
var employeeId= document.getElementById('txtEmployeeId').value; 
var month=document.getElementById('months').value;
var year=document.getElementById('years').value;
if(employeeId!=""&&month!=-1&&year!=-1)
{
var temp = document.getElementById('form'); 
temp.submit();
}
}
//-->
</script>
	<div class="Section">

		<div class="iView" id="FView" >
		<form id="form" action="GetPayslip.jsp" method="post">
		<table>
		
		<!-- Populate months list -->
		<tr><td><h2>Select employee id, month and year</h2></td></tr>
		
		<tr><td>Enter Employee Id</td><td><input type="text" name="txtEmployeeId" onchange="submitform()" /></td></tr>
		<tr><td><label for="months">Month : </label> </td>
		<td><select name="months" onchange="submitform()" >
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
		<td><select name="years" onchange="submitform()" >
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
			<tr><td><button class="Button" name="" onclick="goBack()" style="float:right;">Go Back</button></td></tr>
		</table>
		</form>
		</div>
</div>

