<head>
<title>Search Items</title>
</head>
<jsp:include page="admin_header.jsp" />

<h2 align=center> Search your required details here<hr size=1 color=yellow width=450></h2>

<script language="JavaScript">


function validate() {
  var x= document.studentForm.student_value.value;
  if ( x == null ) {	
 
  alert('Please enter the student name !!!' );
  document.studentForm.student_value.focus();
  	
}
else { document.studentForm.submit(); }
}

function validate1() {
  var x= document.trainerForm.trainer_name.value;
  if ( x == null ) {	
 
  alert('Please enter the trainer name !!!' );
  document.trainerForm.trainer_name.focus();
  	
}
else { document.trainerForm.submit(); }
}

</script>


<form name="studentForm"  action="student_search_hander.jsp"  >
   <h3> ENTER STUDENT NAME</h3>
	<!-- <select size="1" name="student">
		<option>Name</option>
  		<option>Course</option>
  		<option>specific student</option>
  	</select> -->
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=text name=student_value>
 <input type=button name="student1" value="  Search  " onclick="validate()" >&nbsp;&nbsp;&nbsp;<input type=reset>
</form>

<form name="trainerForm"  action="trainer_search_hander.jsp" >
   <h3> ENTER TRAINER NAME</h3>
	<!--  <select size="1" name="trainer">
		<option> none </option>
  		<option>all trainers</option>
  		<option>specific trainer</option>
  	</select> -->
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=text name=trainer_name>
 <input type=button value="  Search  " onClick="validate1()">&nbsp;&nbsp;&nbsp;<input type=reset>
</form>
<jsp:include page="footer.jsp" />