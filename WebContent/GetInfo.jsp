<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

 <%
	String prevpage=(String)session.getAttribute("Page");
	if(prevpage!=null&&prevpage.equals("HRPage")){
%>
 	<jsp:include page="FunctionLayout.jsp"></jsp:include>
<%
 	}
	else{ 
%>
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
 
<script type="text/javascript" src="JavaScriptFunctions.js.jsp">
<!--

//-->
</script>


<% 
		 
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll","root","Saibaba1989."); 
			if(!con.isClosed()) 
			{ 	 		 
			String strProcedure="{call getEmployee(?)}";			
			CallableStatement cs=con.prepareCall(strProcedure);
			String temp;
			temp=request.getParameter("txtEmployeeId");
			int employeeId;
			if(temp==null)
			{
				employeeId = Integer.parseInt((String)session.getAttribute("UserId"));
			}
			else
			{
				employeeId=Integer.parseInt(temp);
			}
			cs.setInt(1, employeeId);
			ResultSet rs=cs.executeQuery();
			rs.next();
			%>

		<div class="Section">
		<div class="iView" id="FView" >
		
 		<%
		String type=(String)session.getAttribute("Page");
		if(type!=null&&type.equals("HRPage")){ %>
		
 		<form action="GetInfo.jsp">
		<table style="text-align: center; max-width: 50%; ">
		<tr><td>Employee Id</td></tr>
		<tr><td>Enter Employee Id</td><td><input type="text" name="txtEmployeeId" onchange="submitform()" /></td></tr>
		<tr style="padding:10%;"><td><button class="Button" type="submit" name="" style="">View Information</button></td>
		</table>
		</form>
	
		<%} 
		%>
		
		<form id="formInfo" action="UpdateInfo.jsp" >
		<table class="payslip" style="text-align: center; max-width: 50%; border-style:solid ;border-width: 2px; border-color: black;">
		<tr><td colspan="4"> <img alt="" src="Images/Logo.png" align="middle"> </td></tr>
		<tr><td colspan="4"> <p>Employee Information</p> </td></tr>
		<tr><td>FirstName</td><td><input type="text" value="<%= rs.getString("FirstName") %>" readOnly name="txtFirstName" id="txtFirstName" /></td></tr>
		<tr><td>MiddleName</td><td><input type="text" value="<%= rs.getString("MiddleName") %>" readOnly name="txtMiddleName" id="txtMiddleName" /></td></tr>
		<tr><td>LastName</td><td><input type="text" value="<%= rs.getString("LastName") %>" readOnly name="txtLastName" id="txtLastName" /></td></tr>
		<tr><td>Username</td><td><input type="text" value="<%= rs.getString("Username") %>" readOnly name="txtUsername" id="txtUsername" /></td></tr>
		<%  int EmpId=Integer.parseInt((String)session.getAttribute("UserId"));
		if(EmpId == Integer.parseInt(rs.getString("EmployeeId")))
		{
		 %>
		<tr><td>Password</td><td><input type="password" value="<%= rs.getString("Password") %>" readOnly name="txtPassword" id="txtPassword" /></td></tr>
		<%
		}
		 %>
		<tr><td>Date Of Joining</td><td><input type="text" value="<%= rs.getString("DateOfJoining") %>" name="txtDate" readOnly id="txtDate" /></td></tr>
		<tr><td>Designation</td><td><input type="text" value="<%= rs.getString("Designation") %>" name="txtDesignation" readOnly id="txtDesignation" /></td></tr>
		<tr><td>Employee Id</td><td><input type="text" value="<%= rs.getString("EmployeeId") %>" name="txtEmployee_Id" readOnly id="txtEmployee_Id" /></td></tr>
		<tr><td>Email Id</td><td><input type="text" value="<%= rs.getString("EmailId") %>" name="txtEmailId" readOnly id="txtEmailId" /></td></tr>
		<tr><td>Basic Salary</td><td><input type="text" value="<%= rs.getString("BasicSalary") %>" name="txtBasicSalary" readOnly id="txtBasicSalary" /></td></tr>
		<tr><td>Type</td><td ><select name="types" id="ddlTypes" onchange="fixtype(this)">
	   	<option value="-1">Select Type</option> 
		<% 
		 
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll","root","Saibaba1989.");
			if(!con2.isClosed()) 
			{
	 		 
			strProcedure="{call getTypes()}";
			String type1,type2;
			CallableStatement cs2=con2.prepareCall(strProcedure);
			ResultSet rs2=cs2.executeQuery();
			 while(rs2.next())
			{
				type1=rs2.getString("EmpType");
				type2=rs.getString("EmpType");
				if(type1.equals(type2))
				{
				%>
				<option selected="selected" value="<%=rs2.getString("EmpTypeId")%>"><%=rs2.getString("EmpType")%></option> 
				<%
				}
				else
				{
				%>
				<option value="<%=rs2.getString("EmpTypeId")%>"><%=rs2.getString("EmpType")%></option> 
				<%
				}
			}
	 		con2.close();
	 		}
		
		 %>
		 </select><input type="hidden" value="<%=rs.getString("EmpTypeId")%>" id="hiddenType"></input></td></tr>
		<tr><td>Grade</td><td ><select name="grades" id="ddlGrades" onchange="fixgrade(this)">
	   	<option value="-1">Select Grade</option> 
		<% 
		 
			Class.forName("com.mysql.jdbc.Driver");  
			con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll","root","Saibaba1989.");
			if(!con2.isClosed()) 
			{ 
			strProcedure="{call getGrades()}";
			String type1,type2;
			CallableStatement cs2=con2.prepareCall(strProcedure);
			ResultSet rs2=cs2.executeQuery();
			 while(rs2.next())
			{
				type1=rs2.getString("Grade");
				type2=rs.getString("Grade");
				if(type1.equals(type2))
				{
				%>
				<option selected="selected" value="<%=rs2.getString("EmpGradeId")%>"><%=rs2.getString("Grade")%></option> 
				<%
				}
				else
				{
				%>
				<option value="<%=rs2.getString("EmpGradeId")%>"><%=rs2.getString("Grade")%></option> 
				<%
				}
			}			
	 		con2.close();
	 		}
		
		 %>
		</select><input type="hidden" value="<%=rs.getString("EmpGradeId")%>" id="hiddenGrade"></input></td></tr>
		
		<tr><td colspan="4"> <p>Bank Details</p> </td></tr>
		
		<tr><td>Bank Name</td><td><input type="text" value="<%= rs.getString("BankName") %>" name="txtBankName" readOnly id="txtBankName" /></td></tr>
		<tr><td>Bank Key</td><td><input type="text" value="<%= rs.getString("BankIFSC") %>" name="txtBankKey" readOnly id="txtBankKey" /></td></tr>
		<tr><td>Account Number</td><td><input type="text" value="<%= rs.getString("AccountNo") %>" name="txtAccountNo" readOnly id="txtAccountNo" /></td></tr>
		<tr><td>Transfer Type</td><td><input type="text" value="<%= rs.getString("TransferType") %>" name="txtTransferType" readOnly id="txtTransferType" /></td></tr>
		<tr ><td><input type="button" onclick="enable(this)" id="save" value="Edit"></input></td><td><input type="button" id="cancel"  onclick="disable(this)" value="Go Back"></input></td></tr>
		</table>
		</form>

		<%
		con.close();
		}
		 %>
				
		</div>
</div>