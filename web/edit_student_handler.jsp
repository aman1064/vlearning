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
				<h5 align=center>Enter details of student to modify . </h5>

				<form action="modify.jsp" method="post">
					<input type=hidden name=type value=Student>
          				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT size=2><B> User Name  </B></FONT>&nbsp;
					<input type="text" name=id> <br>
          				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT size=2><B> Password </B></FONT> &nbsp;&nbsp;&nbsp;
					<input type="text" name=pwd> <br> <br>
          				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT size=2><B> Course </B></FONT> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name=course><br>
          				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT size=2><B> Batch ID </B></FONT> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name=batch><br>
          				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT size=2><B> Start date </B></FONT> &nbsp;&nbsp;
					<input type="text" name=start_dt><br>
          				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT size=2><B> End date </B></FONT> &nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name=end_dt><br> <br>
          				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT size=2><B> Full Name </B></FONT> &nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name=full_name><br> 
          				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT size=2><B> Address  </B></FONT> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name=address><br>
          				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT size=2><B> Email -id </B></FONT> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name=mail_id><br>
          				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<FONT size=2><B> Phone No </B></FONT> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" name=phone><br><input type=submit>  <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</form>
<
		</td>
	</tr>
</table>
<jsp:include page="footer.jsp" />
</BODY></HTML>