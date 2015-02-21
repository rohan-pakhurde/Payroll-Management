function getTodayDate()
{
var d=new Date();
alert(d);
document.forms["Info"]["year"].value=d.getFullYear();
document.getElementById('year').value=d.getFullYear();
document.getElementById('month').innerHTML=d.getMonth();
document.getElementById('dom').innerHTML=d.getDay();
}

function checkAlpha(temp)
{
	//var temp=document.getElementById('first');alert(name.match(regExp));
	var name=temp.value;
	//temp.style.background='#ffcccc';
	var regExp1=/[^a-zA-Z]+[a-zA-Z]+[^a-zA-Z]+/;
	var regExp2=/[^a-zA-Z]+[a-zA-Z]+/;
	var regExp3=/[a-zA-Z]+[^a-zA-Z]+/;
	var regExp4=/[^a-zA-Z]+/;
	var regExp5=/\s/;
	//alert(name.match(regExp1));
	if (!regExp1.test(name)&&!regExp2.test(name)&&!regExp3.test(name)&&!regExp4.test(name)&&!regExp5.test(name))
	{
		temp.style.background='#ccffcc';
	}
	else
	{
		temp.style.background='#ffcccc';
		document.getElementById('Detail').innerHTML=temp.value+' is an invalid entry.<br> Enter proper entry.';
	}
	
}

function checkNum(temp)
{
	var name=temp.value;
	var regExp1=/[^0-9]+[0-9]+[^0-9]+/;
	var regExp2=/[^0-9]+[0-9]+/;
	var regExp3=/[0-9]+[^0-9]+/;
	var regExp4=/[^0-9]+/;
	var regExp5=/\s/;
	if (!regExp1.test(name)&&!regExp2.test(name)&&!regExp3.test(name)&&!regExp4.test(name)&&!regExp5.test(name))
	{
		temp.style.background='#ccffcc';
	}
	else
	{
		temp.style.background='#ffcccc';
		document.getElementById('Detail').innerHTML=temp.value+' is an invalid entry.<br> Enter proper entry.';
	}
/*	if(temp.id=='year')
	{
	
	}
elseif(temp.id=='month')
	{}
else
	{}*/
}

function checkEmail(temp)
{
	var name=temp.value;
	var regExp1=/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	if (regExp1.test(name))
	{
		temp.style.background='#ccffcc';
	}
	else
	{
		temp.style.background='#ffcccc';
		document.getElementById('Detail').innerHTML=temp.value+' is an invalid entry.<br> Enter proper entry.';
	}
}

function validateForm()
{
	//alert(document.getElementById('first').value);
	if(document.getElementById('first').value=="" || document.getElementById('first').style.background=='#ffcccc')
		{
		document.getElementById('first').style.background='#ffcccc';
		document.getElementById('Detail').innerHTML='Enter First Name.';
		}
	else if(document.getElementById('middle').value=="" || document.getElementById('middle').style.background=='#ffcccc')
		{
		document.getElementById('middle').style.background='#ffcccc';
		document.getElementById('Detail').innerHTML='Enter Middle Name.';
		}
	else if(document.getElementById('last').value=="" || document.getElementById('last').style.background=='#ffcccc')
		{
		document.getElementById('last').style.background='#ffcccc';
		document.getElementById('Detail').innerHTML='Enter Last Name.';
		}
	else if(document.getElementById('year').value=="" || document.getElementById('year').style.background=='#ffcccc')
		{
		document.getElementById('year').style.background='#ffcccc';
		document.getElementById('Detail').innerHTML='Enter Year.';
		}
	else if(document.getElementById('month').value=="" || document.getElementById('month').style.background=='#ffcccc')
		{
		document.getElementById('month').style.background='#ffcccc';
		document.getElementById('Detail').innerHTML='Enter Month.';
		}
	else if(document.getElementById('dom').value=="" || document.getElementById('dom').style.background=='#ffcccc')
		{
		document.getElementById('dom').style.background='#ffcccc';
		document.getElementById('Detail').innerHTML='Enter Date.';
		}
	else if(document.getElementById('type').value=="-1" || document.getElementById('type').style.background=='#ffcccc')
		{
		document.getElementById('type').style.background='#ffcccc';
		document.getElementById('Detail').innerHTML='Select Type.';
		}
	else if(document.getElementById('grade').value=="-1" || document.getElementById('grade').style.background=='#ffcccc')
		{
		document.getElementById('grade').style.background='#ffcccc';
		document.getElementById('Detail').innerHTML='Select Grade.';
		}
	else if(document.getElementById('desgn').value=="" || document.getElementById('desgn').style.background=='#ffcccc')
		{
		document.getElementById('desgn').style.background='#ffcccc';
		document.getElementById('Detail').innerHTML='Enter Designation.';
		}
	else if(document.getElementById('basic').value=="" || document.getElementById('basic').style.background=='#ffcccc')
		{
		document.getElementById('basic').style.background='#ffcccc';
		document.getElementById('Detail').innerHTML='Enter Basic Salary.';
		}
	else if(document.getElementById('email').value=="" || document.getElementById('email').style.background=='#ffcccc')
		{
		document.getElementById('email').style.background='#ffcccc';
		document.getElementById('Detail').innerHTML='Enter email.';
		}
	else if(document.getElementById('user').value=="" || document.getElementById('user').style.background=='#ffcccc')
		{
		document.getElementById('user').style.background='#ffcccc';
		document.getElementById('Detail').innerHTML='Enter User ID.';
		}
	else if(document.getElementById('password').value=="" || document.getElementById('password').style.background=='#ffcccc')
		{
		document.getElementById('password').style.background='#ffcccc';
		document.getElementById('Detail').innerHTML='Enter Password.';
		}
	else
		{
		document.getElementById('Info').submit();
		}
}

function goBack()
{
	window.navigate("HrFunctions.jsp");
}



function fixtype(temp)
{
	<% String empType=(String)session.getAttribute("Type"); %>
	
	if(document.getElementById("cancel").value=="Go Back")
	{
		var temp2=document.getElementById("hiddenType");
		temp.value=temp2.value;
	}
	else if(document.getElementById("cancel").value=="Cancel" && "<%= empType %>"!="HR")
	{
	var temp2=document.getElementById("hiddenType");
	temp.value=temp2.value;
	}
}


function fixgrade(temp)
{
	if(document.getElementById("cancel").value=="Go Back")
	{
		var temp2=document.getElementById("hiddenGrade");
		temp.value=temp2.value;
	}
	else if(document.getElementById("cancel").value=="Cancel" && "<%= empType %>"!="HR")
	{
	var temp2=document.getElementById("hiddenGrade");
	temp.value=temp2.value;
	}
}


function disable(temp)
{
	if(temp.value=="Cancel")
	{
		temp.value="Go Back";
		var temp2=document.getElementById("save");
		temp2.value="Edit";
		var temp3=document.getElementById("ddlGrades");
		temp2=document.getElementById("hiddenGrade");
		temp3.value=temp2.value;
		temp3.style.background="#FFFFFF";
		var temp3=document.getElementById("ddlTypes");
		var temp2=document.getElementById("hiddenType");
		temp3.value=temp2.value;
		temp3.style.background="#FFFFFF";
		temp2=document.getElementById("txtFirstName");
		temp2.style.background="#FFFFFF";
		temp2.readOnly=true;
		temp2=document.getElementById("txtMiddleName");
		temp2.style.background="#FFFFFF";
		temp2.readOnly=true;
		temp2=document.getElementById("txtLastName");
		temp2.style.background="#FFFFFF";
		temp2.readOnly=true;
		temp2=document.getElementById("txtUsername");
		temp2.style.background="#FFFFFF";
		temp2.readOnly=true;
		temp2=document.getElementById("txtPassword");
		temp2.style.background="#FFFFFF";
		temp2.readOnly=true;
		temp2=document.getElementById("txtEmailId");
		temp2.style.background="#FFFFFF";
		temp2.readOnly=true;
		temp2=document.getElementById("txtBankName");
		temp2.style.background="#FFFFFF";
		temp2.readOnly=true;
		temp2=document.getElementById("txtBankKey");
		temp2.style.background="#FFFFFF";
		temp2.readOnly=true;
		temp2=document.getElementById("txtAccountNo");
		temp2.style.background="#FFFFFF";
		temp2.readOnly=true;
		temp2=document.getElementById("txtTransferType");
		temp2.style.background="#FFFFFF";
		temp2.readOnly=true;
		temp2=document.getElementById("txtBasicSalary");
		temp2.style.background="#FFFFFF";
		temp2.readOnly=true;
		temp2=document.getElementById("txtDesignation");
		temp2.style.background="#FFFFFF";
		temp2.readOnly=true;
		temp2=document.getElementById("txtEmployee_Id");
		temp2.style.background="#FFFFFF";
		temp2.readOnly=true;
		temp2=document.getElementById("txtDate");
		temp2.style.background="#FFFFFF";
		temp2.readOnly=true;
	}
}

function enable(temp)
{
	if(temp.value=="Edit")
	{
		temp.value="Save";
		var temp2=document.getElementById("cancel");
		temp2.value="Cancel";
		
		<% int EmpId=Integer.parseInt((String)session.getAttribute("UserId")); %>
		<% empType=(String)session.getAttribute("Type"); %>
		
		var gotEmpId=document.getElementById("txtEmployee_Id").value;
		
		var viewEmpId = <%= EmpId %>;
		var viewEmpType = "<%= empType %>";
		
		if(gotEmpId==viewEmpId)
		{
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
		temp2=document.getElementById("txtEmailId");
		temp2.style.background="#CCFFCC";
		temp2.readOnly=false;
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
		}
		else
		{
		temp2=document.getElementById("txtFirstName");
		temp2.style.background="#FFCCCC";
		temp2=document.getElementById("txtMiddleName");
		temp2.style.background="#FFCCCC";
		temp2=document.getElementById("txtLastName");
		temp2.style.background="#FFCCCC";
		temp2=document.getElementById("txtUsername");
		temp2.style.background="#FFCCCC";
		temp2=document.getElementById("txtEmailId");
		temp2.style.background="#FFCCCC";
		temp2=document.getElementById("txtBankName");
		temp2.style.background="#FFCCCC";
		temp2=document.getElementById("txtBankKey");
		temp2.style.background="#FFCCCC";
		temp2=document.getElementById("txtAccountNo");
		temp2.style.background="#FFCCCC";
		temp2=document.getElementById("txtTransferType");
		temp2.style.background="#FFCCCC";
		}
		
		if(viewEmpType=="HR")
		{	
		temp2=document.getElementById("txtBasicSalary");
		temp2.style.background="#CCFFCC";
		temp2.readOnly=false;
		temp2=document.getElementById("ddlTypes");
		temp2.style.background="#CCFFCC";
		temp2.readOnly=false;
		temp2=document.getElementById("ddlGrades");
		temp2.style.background="#CCFFCC";
		temp2.readOnly=false;
		temp2=document.getElementById("txtDesignation");
		temp2.style.background="#CCFFCC";
		temp2.readOnly=false;
		}
		else
		{
		temp2=document.getElementById("txtBasicSalary");
		temp2.style.background="#FFCCCC";
		temp2=document.getElementById("ddlTypes");
		temp2.style.background="#FFCCCC";
		temp2=document.getElementById("ddlGrades");
		temp2.style.background="#FFCCCC";
		temp2=document.getElementById("txtDesignation");
		temp2.style.background="#FFCCCC";
		}
		
		temp2=document.getElementById("txtEmployee_Id");
		temp2.style.background="#FFCCCC";
		temp2=document.getElementById("txtDate");
		temp2.style.background="#FFCCCC";	
		
	}
	else
	{
		document.getElementById("formInfo").submit();
	}
}




