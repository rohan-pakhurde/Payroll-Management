<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 


<jsp:include page="FunctionLayout.jsp"></jsp:include>

<script type="text/javascript">
function goBack(){
window.navigate("HrFunctions.jsp");

}
</script>

<div class="Section">
		<div class="iView" id="iView" >
		<form action="CreateNewMonth.jsp" >
		<table>
		
		<!-- Populate months list -->
		<tr><td colspan="2"><p style="font-size: 32px">Enter new Month Below :</p></td></tr>
		<tr><td><label for="year">Year : </label> </td><td><input type="text" value="" name="year" id="year" maxlength="4" style="width: 50%;"/></td></tr>
		<tr><td><label for="year">Month : </label> </td><td><input type="text" value="" name="month" id="month" maxlength="2" style="width: 50%;"/></td></tr>
		<tr><td><label for="nod">Number of working Days : </label> </td><td><input type="text" value="" name="nod" id="nod" style="width: 50%;"/></td></tr>
		<tr style="padding:10%;"><td><button class="Button" type="submit" name="" onclick="" style="">Create Month</button></td>
			<td><button class="Button" name="" onclick="goBack()" style="float:right;">Go Back</button></td></tr>
		</table>
		</form>
		</div>
</div>