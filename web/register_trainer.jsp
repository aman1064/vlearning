<HTML> <BODY>
<jsp:include page="admin_header.jsp" />

<table>
	<tr bgcolor=ffffff>
		<td >
			<img src="imgs/org.jpg" width=200>
		</td >
		<td width=700 align=top bgcolor=ffffff >
			<font size=2><p align=center><b>
			Welcome "<%=session.getAttribute( "Trainer_name" ) %>",  You have logged in as (<%=session.getAttribute( "Trainer_type" ) %>)
			<hr size=1> <br> 
				<h5 align=center> Enter the following details to register a new Trainer. </h5>

				<form action="trainer_registration_handler.jsp" method="post">
					<input type=hidden name=type value=Trainer>
          				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT size=2><B> Trainer id  </B></FONT>&nbsp;
					<input type="text" name=id> <br>
          				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT size=2><B> Password  </B></FONT>&nbsp;
					<input type="text" name=pwd> <br>
          				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT size=2><B> Full Name </B></FONT> &nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name=full_name><br> 
          				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT size=2><B> Address  </B></FONT> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name=address><br>
          				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT size=2><B> Email -id </B></FONT> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name=mail_id><br>
          				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT size=2><B> Phone No </B></FONT> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name=phone><br>  <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=reset>
				</form>
		</td>
	</tr>
</table>
<jsp:include page="footer.jsp" />
</BODY></HTML>