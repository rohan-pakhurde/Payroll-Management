<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

 <jsp:include page="Layout.jsp"></jsp:include>
 <% 
session.setAttribute("Page", "HRPage");
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
 
 
<script type="text/javascript">
<!--

function fixtype(temp)
{
	var temp2=document.getElementById("hiddenType");
	temp.value=temp2.value;
}


function fixgrade(temp)
{
	var temp2=document.getElementById("hiddenGrade");
	temp.value=temp2.value;
}


function enable(temp)
{
	//var temp=document.getElementById("designation");
	if(temp.value=="Edit")
	{
		temp.value="Save";
		var temp2=document.getElementById("cancel");
		temp2.value="Cancel";
		temp2=document.getElementById("txtFirstName");
		temp2.style.background="#CCFFCC";
		temp2.readOnly=false;
		temp2=document.getElementById("txtMiddleName");
		temp2.style.background="#CCFFCC";
		temp2.readOnly=false;
		temp2=document.getElementById("txtLastName");
		temp2.style.background="#CCFFCC";
		temp2.readOnly=false;
		temp2=document.getElementById("txtUsername");
		temp2.style.background="#CCFFCC";
		temp2.readOnly=false;
		temp2=document.getElementById("txtPassword");
		temp2.style.background="#CCFFCC";
		temp2.readOnly=false;
		temp2=document.getElementById("txtDate");
		temp2.style.background="#FFCCCC";
		temp2=document.getElementById("txtDesignation");
		temp2.style.background="#FFCCCC";
		temp2=document.getElementById("txtEmployeeId");
		temp2.style.background="#FFCCCC";
		temp2=document.getElementById("txtEmailId");
		temp2.style.background="#CCFFCC";
		temp2.readOnly=false;
		temp2=document.getElementById("ddlTypes");
		temp2.style.background="#FFCCCC";
		temp2=document.getElementById("ddlGrades");
		temp2.style.background="#FFCCCC";
		temp2=document.getElementById("txtBankName");
		temp2.style.background="#CCFFCC";
		temp2.readOnly=false;
		temp2=document.getElementById("txtBankKey");
		temp2.style.background="#CCFFCC";
		temp2.readOnly=false;
		temp2=document.getElementById("txtAccountNo");
		temp2.style.background="#CCFFCC";
		temp2.readOnly=false;
		temp2=document.getElementById("txtTransferType");
		temp2.style.background="#CCFFCC";
		temp2.readOnly=false;
		temp2=document.getElementById("ddlTypes");
		temp2.style.background="#FFCCCC";		
	}
	else
	{
		temp.value="Edit";
		var temp2=document.getElementById("cancel");
		temp2.value="Go Back";
	}
}
//-->
</script>



			<div class="Section">
		<div class="iView" id="FView" >


		<form action="GetInfo.jsp"">
		<table class="payslip" style="text-align: center; max-width: 50%; border-style:solid ;border-width: 2px; border-color: black;">
		<tr><td colspan="2">Enter Employee Id</td></tr>
		<tr><td>Enter Employee Id</td><td><input type="text" name="txtEmployeeId"/></td></tr>
		<tr style="padding:10%;"><td colspan="2"><button class="Button" type="submit" name="" style="">View Information</button></td>
		</table>
		</form>
		
				
		</div>
</div>