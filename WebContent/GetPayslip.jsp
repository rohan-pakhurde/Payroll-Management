 <%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%
String prevpage=(String)session.getAttribute("Page");
if(prevpage!=null&&prevpage.equals("HRPage")){
 %>
 <jsp:include page="FunctionLayout.jsp"></jsp:include>
 <%
 }
 else{ %>
  <jsp:include page="Layout.jsp"></jsp:include>
 <%
 }
  %>
 <style>
<!--
.payslip
	{
	border:1px solid #000000;
	}
	
	.payslip td 
	{
	font-size:1em;
	border:1px solid #000000;
	padding:3px 7px 2px 7px;
	}
-->
</style>



			







		<div class="Section">
		<div class="iView" id="FView" >
		<form action="GetPayslip.jsp" method="post">
		<table>
		
		<!-- Populate months list -->
		<tr><td><h2>Select month and year</h2></td></tr>
		
		<%
		String type=(String)session.getAttribute("Page");
		if(type!=null&&type.equals("HRPage")){ %>
		<tr><td>Enter Employee Id</td><td><input type="text" name="txtEmployeeId"/></td></tr>		
		<%} %>
		<tr><td><label for="months" >Month : </label> </td>
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
			<td><button class="Button" name="" onclick="" style="float:right;">Go Back</button></td></tr>
		</table>
		</form>
		<% 
		 
			Class.forName("com.mysql.jdbc.Driver");  
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll","root","Saibaba1989."); 
			if(!con.isClosed()) 
			{ 
	 		
	 		//out.println("Successfully connected to " + "MySQL server using TCP/IP...");
	 		 
			String strProcedure="{call viewPayslip(?,?,?)}";
			
			CallableStatement cs=con.prepareCall(strProcedure);
			String month=(String)request.getParameter("months");
			int year= Integer.parseInt(request.getParameter("years"));
			
			int employeeId;
			String temp;
			temp=request.getParameter("txtEmployeeId");
			if(temp==null)
			{
			 employeeId = Integer.parseInt((String)session.getAttribute("UserId"));
			}
			else
			{
				employeeId=Integer.parseInt(temp);
			}
			cs.setInt(1, employeeId);
			cs.setString(2, month);
			cs.setInt(3, year);
			ResultSet rs=cs.executeQuery();
			rs.next();
			%>

		<form action="">
		<table class="payslip" style="text-align: center; max-width: 70%; border-style:solid ;border-width: 2px; border-color: black; top:10px;">
		<tr><td colspan="4"> <img alt="" src="Images/Logo.png" align="middle"> </td></tr>
		<tr><td colspan="4"> <p>Employee Information</p> </td></tr>
		<tr><td>Name</td><td><input type="text" value="<%= rs.getString("FirstName") %> <%= rs.getString("MiddleName") %> <%= rs.getString("LastName") %>" readonly="readonly" name="" id="" /></td><td>Employee Id</td><td><input type="text" value="<%= rs.getString("EmployeeId") %>" readonly="readonly" name="" id="" /></td></tr>
		<tr><td>Designation</td><td><input type="text" value="<%= rs.getString("Designation") %>" readonly="readonly" name="" id="" /></td><td>Grade</td><td><input type="text" value="<%= rs.getString("Grade") %>" readonly="readonly" name="" id="" /></td></tr>
		<tr><td>Bank Name</td><td><input type="text" value="<%= rs.getString("BankName") %>" readonly="readonly" name="" id="" /></td><td>Account Number</td><td><input type="text" value="<%= rs.getString("AccountNo") %>" readonly="readonly" name="" id="" /></td></tr>
		<tr><td>Bank Key</td><td><input type="text" value="<%= rs.getString("BankIFSC") %>" readonly="readonly" name="" id="" /></td><td>Transfer Type</td><td><input type="text" value="<%= rs.getString("TransferType") %>" readonly="readonly" name="" id="" /></td></tr>

		<tr><td colspan="4"> <p>Payment Detail</p> </td></tr>
		<tr><td>Earnings</td><td>Amount</td><td>Deductions</td><td>Amount</td></tr>
		<tr><td>Basic Salary</td><td><input type="text" value="<%= rs.getString("BasicSalary") %>" readonly="readonly" name="" id="" /></td><td>Income Tax</td><td><input type="text" value="<%= rs.getString("IncomeTax") %>" readonly="readonly" name="" id="" /></td></tr>
		<tr><td>HRA</td><td><input type="text" value="<%= rs.getString("HRA") %>" readonly="readonly" name="" id="" /></td><td>Professional Tax</td><td><input type="text" value="<%= rs.getString("ProfessionalTax") %>" readonly="readonly" name="" id="" /></td></tr>
		<tr><td>DA</td><td><input type="text" value="<%= rs.getString("DA") %>" readonly="readonly" name="" id="" /></td><td>Provident Fund</td><td><input type="text" value="<%= rs.getString("ProvidentFund") %>" readonly="readonly" name="" id="" /></td></tr>
		<tr><td colspan="4"> <p>Arrears</p> </td></tr>
		<tr><td>Number of arrear days</td><td><input type="text" value="<%= rs.getString("ArrearsDays") %>" readonly="readonly" name="" id="" /></td><td>Arrears amount</td><td><input type="text" value="<%= rs.getString("Arrears") %>" readonly="readonly" name="" id="" /></td></tr>
		
		
		<tr><td colspan="2"><p>Net Salary</p> </td><td colspan="2"><input type="text" value="<%= rs.getString("NetSalary") %>" name="" id="" /></td></tr>
		
		</table>
		</form>
		
				<%
				con.close();
	 		}
		
		 %>
		</div>
</div>

		
















		