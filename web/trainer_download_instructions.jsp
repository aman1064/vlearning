<HTML> <BODY>
<jsp:include page="trainer_header.jsp" />
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
	*	This package contains a zip filed named trainer.zip
	*	Download the zip file to your system
	*	Extract its contacts
	*	Execute (double click) the setup file
	*	This will complete the installation
	*	Further to execute the software when you want to take part in the online training session, execute (double click) the program named run.

	*	Wish you happy working with your software.


			</b>
</pre>
			<a href="trainer_download.jsp">Go back to download page</a>
		</td>
	</tr>
</table>
<jsp:include page="footer.jsp" />
</BODY></HTML>