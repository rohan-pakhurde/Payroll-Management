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
			String Year=request.getParameter("year");
			String Month=request.getParameter("month");
			String Nod=request.getParameter("nod");
			
			Class.forName("com.mysql.jdbc.Driver");  
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll","root","Saibaba1989.");
			String strProcedure="{call checkMonth('"+Year+"','"+Month+"')}";
			CallableStatement cs=con.prepareCall(strProcedure);
			ResultSet rs=cs.executeQuery();
			if(rs.next())
			{
			session.setAttribute("Message", "Month Already Exits.");
			response.sendRedirect("CreateMonth.jsp");
			}
			else
			{
			session.setAttribute("Message", "Month Added to Systems.");
			response.sendRedirect("CreateMonth.jsp"); 
			}
			
		%>


		<%
			con.close();
		}
		catch (Exception e)
		{
		%>
		session.setAttribute("Message", "ERROR OCCURED.");
		response.sendRedirect("CreateMonth.jsp");
		<%
		}
		%>
