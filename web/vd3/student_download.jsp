<HTML> <BODY>
<jsp:include page="student_header.jsp" />
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
		
		<br><br><b> welcome "user_name"<br>
		</b>
<%
	}
%>
			Welcome "<%=session.getAttribute( "user_name" ) %>",  You have logged in as (<%=session.getAttribute( "user_type" ) %>)
			<hr size=1>
			<br><br><br><br><br><br><br><br>
			</b></p></font>
<pre>
			<b>
		<a href="student_download_instructions.jsp" >Installation Instructions </a> 



		<a href="student.zip" >Download </a>
			</b>
</pre>
		</td>
	</tr>
</table>
<jsp:include page="footer.jsp" />
</BODY></HTML>