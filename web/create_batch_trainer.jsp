<HTML> <BODY>
<jsp:include page="admin_header.jsp" />
<table>
	<tr bgcolor=ffffff>
		<td >
			<img src="imgs/org.jpg" width=200>
		</td >
		<td width=700 align=top bgcolor=ffffff >
			<font size=2><p align=center><b>
			Welcome "<%=session.getAttribute( "user_name" ) %>",  You have logged in as (<%=session.getAttribute( "user_type" ) %>)
			<hr size=1> <br> 
				<h5 align=center> Enter the following details of a Trainer. </h5>

				<form action="trainer_batchdetails_handler.jsp" method="post">
					<input type=hidden name=type value=Student>
          				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT size=2><B>Batch ID  </B></FONT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name=bid> <br>
          				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT size=2><B>Trainer ID</B></FONT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name=tid> <br> <br> <br>

          				
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=reset>
				</form>
		</td>
	</tr>
</table>

</BODY></HTML>