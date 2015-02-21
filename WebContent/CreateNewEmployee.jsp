<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %>

<jsp:include page="FunctionLayout.jsp"></jsp:include>

<script type="text/javascript" src="JavaScriptFunctions.js">
function goBack(){
window.navigate("HrFunctions.jsp");
}
</script>

<%
		try
		{
			String Fname=request.getParameter("first");
			String Mname=request.getParameter("middle");
			String Lname=request.getParameter("last");
			int Year=Integer.parseInt(request.getParameter("year")) ;
			int Month=Integer.parseInt(request.getParameter("month")) ;
			int Dom=Integer.parseInt(request.getParameter("dom")) ;
			String Date=Year+"-"+Month+"-"+Dom;
			int TypeId=Integer.parseInt(request.getParameter("type")) ;
			int GradeId=Integer.parseInt(request.getParameter("grade")) ;
			String Designation=request.getParameter("desgn");
			int Basic=Integer.parseInt(request.getParameter("basic")) ;
			String Email=request.getParameter("email");
			String Uname=request.getParameter("user");
			String Password=request.getParameter("password");
			
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll","root","RP1905");
			String strProcedure="{call checkEmployee('"+Fname+"','"+Mname+"','"+Lname+"')}";
			CallableStatement cs=con.prepareCall(strProcedure);
			ResultSet rs=cs.executeQuery();
			if(rs.next())
			{
		%>
		
		<div class="Section"> <div class="Detail">
		<p>Query Result :</p>
		<p id="Detail" >The Employee Already Exists in the system.</p>
		</div></div>
		<% session.setAttribute("Message", "Employee Already Exits.");
			response.sendRedirect("CreateEmployee.jsp");
			}
			else
			{
				strProcedure="{call getGradeRange(?)}";
				cs=con.prepareCall(strProcedure);
				cs.setInt(1,GradeId);
				rs=cs.executeQuery();
				rs.next();
				int lower=Integer.parseInt(rs.getString(1));
				int higher=Integer.parseInt(rs.getString(2));
				if (Basic<lower || Basic>higher)
				{
		%>
		<div class="Section"> <div class="Detail">
		<p>Query Result :</p>
		<p id="Detail" >Basic is out of range.</p>
		</div></div>					
<!-- ****** -->
		<div class="Section">
		<div class="iView" id="iView" >
				
		<form action="CreateNewEmployee.jsp" name="Info" id="Info">
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
	   		strProcedure="{call getTypes()}";
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
		<tr><td><label for="email">email : </label> </td><td><input type="text" value="" name="email" id="email" onblur="checkEmail()"/></td></tr>
		<tr><td><label for="user">User : </label> </td><td><input type="text" value="" name="user" id="user" /></td></tr>
		<tr><td><label for="password">Password : </label> </td><td><input type="password" value="" name="password" id="password" /></td></tr>
		<tr style="padding:10%;"><td><button class="Button" type="submit" name="" onclick="" style="">Create Employee</button></td>
			<td><button class="Button" name="" onclick="goBack()" style="float:right;">Go Back</button></td></tr>
		</table>
		</form>
		</div>
</div>
<!-- ******* -->
		<%
				}
				else{
		
		
				strProcedure="{call getCreateEmployee(?,?,?,?,?,?,?,?,?,?)}";
				cs=con.prepareCall(strProcedure);
				cs.setString(1,Fname);
				cs.setString(2,Mname);
				cs.setString(3,Lname);
				cs.setString(4,Date);
				cs.setInt(5,TypeId);
				cs.setInt(6,GradeId);
				cs.setString(7,Designation);
				cs.setInt(8,Basic);
				cs.setString(9,Email);
				cs.setString(10,Uname);
				cs.setString(11,Password);
				//rs=cs.executeQuery();
		%> 
		<!-- Insert Query Here -->
		<div class="Section"> <div class="Detail">
		<p>Query Result :</p>
		<p id="Detail" >The Employee added in the system.</p>
		</div></div>
				
		<%
				session.setAttribute("Message", "Employee Added to the System..");
				response.sendRedirect("CreateEmployee.jsp");
				}
			}
			
		%>


		<%
			con.close();
		}
		catch (Exception e)
		{
		%>
		<div class="Section"> <div class="Detail">
		<p>Query Result :</p>
		<p id="Detail" >AN ERROR HAS OCCURED.</p>
		</div></div>
		<%
		}
		%>
		
