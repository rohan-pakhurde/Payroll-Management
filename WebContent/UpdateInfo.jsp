<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 


<%
String FirstName=(String)request.getParameter("txtFirstName");
String MiddleName=(String)request.getParameter("txtMiddleName");
String LastName=(String)request.getParameter("txtLastName");
String Username=(String)request.getParameter("txtUsername");
String Date=(String)request.getParameter("txtDate");
String Designation=(String)request.getParameter("txtDesignation");
int EmployeeId=Integer.parseInt((String)request.getParameter("txtEmployee_Id"));
String EmailId=(String)request.getParameter("txtEmailId");
String Type=(String)request.getParameter("types");
String Grade=(String)request.getParameter("grades");
String BankName=(String)request.getParameter("txtBankName");
String BankKey=(String)request.getParameter("txtBankKey");
String AccountNo=(String)request.getParameter("txtAccountNo");
String TransferType=(String)request.getParameter("txtTransferType");
int BasicSalary=Integer.parseInt((String)request.getParameter("txtBasicSalary"));
Class.forName("com.mysql.jdbc.Driver");  
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payroll","root","Saibaba1989."); 
String strProcedure="{call updateEmployee(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
CallableStatement cs=con.prepareCall(strProcedure);
cs.setInt(1,EmployeeId );
cs.setString(2, FirstName);
cs.setString(3, MiddleName);
cs.setString(4, LastName);
cs.setString(5, EmailId);
cs.setString(6, Username);
cs.setString(7, Designation);
cs.setString(8, Date);
cs.setString(9, BankName);
cs.setString(10, BankKey);
cs.setString(11, AccountNo);
cs.setString(12, TransferType);
cs.setString(13, Grade);
cs.setString(14, Type);
cs.setInt(15,BasicSalary);
cs.executeUpdate();
%>