<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 


<script type="text/javascript">

function goBack(){
window.navigate("HrFunctions.jsp");
}


</script>

<%
	 try
		 {
				Class.forName("com.mysql.jdbc.Driver");  
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll","root","Saibaba1989."); 
				String strProcedure="{call createPayslip(?,?,?,?,?)}";
				CallableStatement cs=con.prepareCall(strProcedure);
				int employeeId = Integer.parseInt(request.getParameter("txtEmployeeId"));
				int year= Integer.parseInt(request.getParameter("Year"));
				String month= (String)request.getParameter("Month");
				int noa = Integer.parseInt(request.getParameter("noa"));
				int da = Integer.parseInt(request.getParameter("da"));
				cs.setInt(1,employeeId);
				cs.setString(2,month);
				cs.setInt(3,year);
				cs.setInt(4,da);
				cs.setInt(5,noa);
				ResultSet rs=cs.executeQuery();
				if(true)
				{
%>
inserted
<%
}
else
{
 %>
 nope
 <%
 }
 }
 catch(Exception e)
 {
 %>
 exception
 <%
 }
  %>




