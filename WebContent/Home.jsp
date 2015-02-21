
<jsp:include page="Layout.jsp"></jsp:include>

<div class="Section">
		<div class="iView" id="iView" >
		<form>
		<a href="GetInfo.jsp">
		<fieldset class="Function">
		<p><h3>MY INFO</h3>
		<img alt="" src="Images/CreateEmp.jpg" style="height: 100px; ">
		<br>
		View your personal information.
		<br>Based on your user type, you can edit your personal details like Name,Bank details etc.</p>
		<p style="color: RED;">* You must be a HR to edit details like Designation,Grade etc.</p>
		</fieldset>
		</a>
		<a href="MyPayslipGen.jsp">
		<fieldset class="Function">
		<p><h3>MY PAYSLIP</h3>
		<img alt="" src="Images/PayEmp.jpg" style="height: 100px; ">
		<br>
		View your payslips.
		<br>You can view your your payslips by selecting the appropriate month and year.
		</p></fieldset></a>
		<% String Type=(String)session.getAttribute("Type");
			if (Type.equals("HR"))
			{%>
			<a href="HrFunctions.jsp">
		<fieldset class="Function">
		<p><h3>MY HR</h3>
		<img alt="" src="Images/ViewEmp.jpg" style="height: 100px; ">
		<br>
		<br>A HR can use this section to perform various HR actions like:
		<ul"> <li>Create new employee</li>
		<li>View employee profile</li><li> Create payslip</li><li> View payslip</li><li> Create a new month</li> 
		</ul></p></fieldset>
		</a>
		<%} %>
		</form>
		</div>
	
</div>