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
		
		<br><br>
<%
	}
%><form action="edit_student_handler.jsp" method="post">
			Welcome "<%=session.getAttribute( "user_name" ) %>",  You have logged in as (<%=session.getAttribute( "user_type" ) %>)
			<hr size=1>
			<br><br><br><br><br><br><br><br>
  
	<font size=1>
				I D &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <input type=text name=id>
				PASSWORD : <input type=password name=pwd>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit>&nbsp;&nbsp;&nbsp;<input type=reset> 	
				</font>
			
			<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</td>
	</tr>
</table>
<jsp:include page="footer.jsp" />
</BODY></HTML>