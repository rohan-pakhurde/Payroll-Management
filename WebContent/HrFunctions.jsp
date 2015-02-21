<jsp:include page="Layout.jsp"></jsp:include>
<script type="text/javascript">

function callCreateEmp(){
window.navigate("CreateEmployee.jsp");
}

function callCreatePayslip(){
window.navigate("CreatePay.jsp");
}

function callCreateMonth(){
window.navigate("CreateMonth.jsp");
}

function callViewPayslip(){
window.navigate("MyPayslipHR.jsp");
}

function callViewInfo(){
window.navigate("MyInfoHR.jsp");
}

</script>

<div class="Section" onload="hideMenu()">
		<div class="iView" id="iView" >
		<form>
		<fieldset class="Function">
		<legend class="topic"><button type="button" onclick="callCreateEmp()" style="z-index: 4">Create Employee</button>
		</legend>
		<img alt="" src="Images/CreateEmp.jpg" style="height: 100px; float: left; margin-left: 30px;">
		<p>Use this function to create a new employee.</p>
		</fieldset>
		
		<fieldset class="Function"  onclick="callViewInfo()">
		<legend><button type="button" >View Employee Detail</button>
		</legend>
		<img alt="" src="Images/ViewEmp.jpg" style="height: 115px; float: left; margin-left: 30px;">
		<p>Use this function to view Employee Detail.</p></fieldset>
		
		<fieldset class="Function">
		<legend><button type="button" onclick="callCreatePayslip()">Create Payslip</button>
		</legend>
		<img alt="" src="Images/PayEmp.jpg" style="height: 100px; float: left; margin-left: 30px;">
		<p>Use is function to generate employee payslip.</p></fieldset>
		
		<fieldset class="Function">
		<legend><button type="button" onclick="callViewPayslip()">View Payslip</button>
		</legend>
		<img alt="" src="Images/Payslip.jpg" style="height: 115px; float: left; margin-left: 30px;">
		<p>Use this function to view a payslip of an employee.</p></fieldset>
		
		<fieldset class="Function">
		<legend><button type="button" onclick="callCreateMonth()">Create Month</button>
		</legend>
		<img alt="" src="Images/Month.png" style="height: 100px; float: left; margin-left: 30px;">
		<p>Use This function to generate new month.</p></fieldset>
		</form>
		</div>
</div>