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
				<h5 align=center> Enter the following details to register a new student. </h5>

				<form align="center" action="student_registration_handler.jsp" method="post">
                                    <table align="center"><tr><td>	
                                    <input type=hidden name=type value=Student></td>
                                        </tr>
                                        <tr><td><FONT size=2><B>User Name:</B></FONT></td><td>
					<input type="text" name=id></td></tr>
                                        <tr><td><FONT size=2><B> Password: </B></FONT></td><td>
					<input type="text" name=pwd> </td></tr>
                                        <tr><td><FONT size=2><B> Course: </B></FONT></td><td>
					<input type="text" name=course></td></tr>
                                        <tr><td><FONT size=2><B> Batch ID:</B></FONT></td><td><input type="text" name=batch></td></tr>          			
                                        
                                        <tr><td><FONT size=2><B> Start date </B></FONT></td><td><input type="text" name=start_dt></td></tr>
                                        <tr><td><FONT size=2><B> End date </B></FONT></td><td>
					<input type="text" name=end_dt></tr>
                                        <tr><td><FONT size=2><B> Full Name </B></FONT></td>
                                            <td><input type="text" name=full_name></td></tr> 
                                        <tr><td><FONT size=2><B> Address  </B></FONT></td>
                                            <td><input type="text" name=address><td></tr>
                                        <tr><td><FONT size=2><B> Email -id </B></FONT></td>
                                            <td><input type="text" name=mail_id></td>      
                                        <tr><td><FONT size=2><B> Phone No </B></FONT></td>
                                            <td><input type="text" name=phone></tr><br>  <br>
                                        <tr><td><input type=submit>
                                    </td><td><input type=reset>
                                </td></tr> </table>
				</form>
		</td>
	</tr>
</table>
                                    </br>
<jsp:include page="footer.jsp" />
</BODY></HTML>