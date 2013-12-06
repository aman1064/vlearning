<head>
<title>Search Items</title>
</head>
<jsp:include page="admin_header.jsp" />

<h2 align=center> Search your required details here<hr size=1 color=yellow width=450></h2>

<form action="student_search_hander.jsp" >
   <h3> STUDENT DETAILS </h3>
	<select size="1" name="student">
		<option> none </option>
  		<option>all sudent details</option>
  		<option>specific student</option>
  	</select>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=text name=student_name>
 <input type=submit>&nbsp;&nbsp;&nbsp;<input type=reset>
</form>

<form action="trainer_search_hander.jsp" >
   <h3>TRAINER DETAILS</h3>
	  <select size="1" name="trainer">
		<option> none </option>
  		<option>all trainers</option>
  		<option>specific trainer</option>
  	</select>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=text name=trainer_name>
 <input type=submit>&nbsp;&nbsp;&nbsp;<input type=reset>
</form>
<jsp:include page="footer.jsp" />