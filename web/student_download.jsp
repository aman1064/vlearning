<HTML> <BODY>
<jsp:include page="student_header.jsp" />
<table>
	<tr bgcolor=ffffff>
		<td >
			<img src="imgs/org.jpg" width=200>
		</td >
		<td width=700 align=top bgcolor=ffffff >
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



		<a href="android_activity.mp4" >Download </a>
			</b>
</pre>
		</td>
	</tr>
</table>
<jsp:include page="footer.jsp" />
</BODY></HTML>