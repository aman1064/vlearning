<HTML> <BODY>
<jsp:include page="admin_header.jsp" />
<table>
	<tr bgcolor=ffffcc>
		<td >
			<img src="imgs/org.jpg" width=200>
		</td >
		<td width=700 align=top bgcolor=ffffcc >
			<font size=2><p align=center><b>
<%
	if( session.getAttribute( "user_name" ) == null ||  ( (String) session.getAttribute( "user_name" ) ).trim().equals( "" ) )
	{
%>		
		
		<br><br><b> You cannot do this task at this state.  the session has expired.  You need to login to proceed further. <br>
			Please do oblige and furgive the inconvenience.  We think it is necessary to preserve the applications integrity.
		</b>
<%
	}
%>
			Welcome "<%=session.getAttribute( "user_name" ) %>",  You have logged in as (<%=session.getAttribute( "user_type" ) %>)
			<hr size=1>
			<br><br><br><br><br><br><br><br>
			</b></p></font>
			<h2> Alert </h2>
			<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;You have got (-----) Messages.
		</td>
	</tr>
</table>
<jsp:include page="footer.jsp" />
</BODY></HTML>