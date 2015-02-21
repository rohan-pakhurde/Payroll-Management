<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>

<jsp:include page="FunctionLayout.jsp"></jsp:include>

<script type="text/javascript" src="JavaScriptFunctions.js">
function goBack(){
window.navigate("HrFunctions.jsp");

}
</script>
<div  class="Section">
		<div class="iView" id="iView" >
		
		<%
		try
		{
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll","root","RP1905");
		%>
		
		<form action="CreateNewEmployee.jsp" name="Info" id="Info" onload="getTodayDate()">
		<table >
		<tr><td colspan="2">Enter New Employee Information Bellow</td></tr>
		<tr><td colspan="2"><hr></td></tr>
		<tr><td><label for="first">First Name : </label> </td><td><input type="text" value="" name="first" id="first" onblur="checkAlpha(this)"/></td></tr>
		<tr><td><label for="middle">Middle Name : </label> </td><td><input type="text" value="" name="middle" id="middle" onblur="checkAlpha(this)"/></td></tr>
		<tr><td><label for="last">Last Name : </label> </td><td><input type="text" value="" name="last" id="last" onblur="checkAlpha(this)"/></td></tr>
		<tr><td><label for="doj">Date of Joining : </label></td>
		<td>
			<table style=" text-align:center; width: 100%; "><tr>
			<td><input type="text" value="" name="year" id="year" onblur="checkNum(this)" maxlength="4" style="width: 40px;" /></td>
			<td><input type="text" value="" name="month" id="month" onblur="checkNum(this)" maxlength="2" style="width: 30px;"/></td>
			<td><input type="text" value="" name="dom" id="dom" onblur="checkNum(this)" maxlength="2" style="width: 30px;"/></td>
			</tr><tr style="font-size: 10px;text-align: center;"><td>YYYY</td><td>MM</td><td>DD</td></tr></table>
		</td></tr>
		<tr><td><label for="type">Type : </label> </td>
		
		<td>
			<select name="type" onchange="showEmp(this.value);">
		   	<option value="-1">Select</option>
	   	<%
	   		String strProcedure="{call getTypes()}";
			CallableStatement cs=con.prepareCall(strProcedure);
			ResultSet rs=cs.executeQuery();
			while(rs.next())
			{
		%>
			<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option> 
		<%
			}
	   	%>
		   	</select>
			</td>
		
		</tr>
		<tr><td><label for="grade">Grade : </label> </td>
		
		<td>
			<select name="grade" onchange="showEmp(this.value);">
		   	<option value="-1">Select</option>
	   	<%
	   		strProcedure="{call getGrades()}";
			cs=con.prepareCall(strProcedure);
			rs=cs.executeQuery();
			while(rs.next())
			{
		%>
			<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option> 
		<%
			}
	   	%>
		   	</select>
			</td>
		
		</tr>
		<tr><td><label for="basic">Designation : </label> </td><td><input type="text" value="" name="desgn" id="desgn" /></td></tr>
		<tr><td><label for="basic">Basic : </label> </td><td><input type="text" value="" name="basic" id="basic" /></td></tr>
		<tr><td><label for="email">email : </label> </td><td><input type="text" value="" name="email" id="email" onblur="checkEmail(this)"/></td></tr>
		<tr><td><label for="user">User : </label> </td><td><input type="text" value="" name="User" id="user" /></td></tr>
		<tr><td><label for="password">Password : </label> </td><td><input type="password" value="" name="password" id="password" /></td></tr>
		<tr style="padding:10%;"><td><button class="Button"  name="" onclick="validateForm()" style="">Create Employee</button></td>
			<td><button class="Button" name="" onclick="goBack()" style="float:right;">Go Back</button></td></tr>
		</table>
		</form>
		<%
			con.close();
		}
		catch (Exception e)
		{
		%>
		<p><%=e.getMessage() %> </p>
		<%
		}
		%>
		</div>
</div>
