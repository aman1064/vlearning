<HTML> <BODY>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<STYLE type="text/css">BODY {
	MARGIN-TOP: 10px; FONT-SIZE: 12px; BACKGROUND: #446684; MARGIN-LEFT: 5px; FONT-FAMILY: verdana, arial,helvetica; font-color: black
}
TD { 
	COLOR: black; FONT-STYLE: normal; FONT-FAMILY: verdana, arial,helvetica
}
A:link {
	COLOR: black; FONT-STYLE: normal; FONT-FAMILY: verdana, arial,helvetica; TEXT-DECORATION: underline
}
A:active {
	COLOR: black; FONT-STYLE: normal; FONT-FAMILY: verdana, arial,helvetica; TEXT-DECORATION: underline
}
A:visited {
	COLOR: black; FONT-STYLE: normal; FONT-FAMILY: verdana, arial,helvetica; TEXT-DECORATION: underline
}
</STYLE>


<%	String role = (String)session.getAttribute("user_type");
	if (role.equals("Trainer"))  { %>
			<jsp:include page="trainer_header.jsp" />
<% }	else { %>
			<jsp:include page="student_header.jsp" />
			<% } %>



<table >
	<tr bgcolor="ffffcc">
		<td >
			<img src="imgs/org.jpg" width=200>
		</td >
<td width=100% valign="top" bgcolor=ffffcc>
<table width=50% >
<tr></tr>
        <tr valign="middle" >
        <td valign="middle" align="center"><a href="message.jsp"><h4>Inbox</h4></a> </td>
        <td valign="middle" align="center"><a href="compose.jsp"><h4>Compose</h4></a></td>
        <td valign="middle" align="center"><a href="delete.jsp"><h4>Delete</h4></a></td>
        </tr>
</table>

<hr size="4">
<table align="center" width=100%>
<tr></tr>

<tr></tr>
        <tr  align="center">
        
        <td ><h5>    Sender     </h5></td>
        <td ><h5>    Subject     </h5></td>
        <td ><h5>    Date       </h5></td>
        </tr>

</table>
</td>

</tr>
</table>
<table width=100%>
	<tr>
		<td bgcolor=cccccc align=center>
			<font size=1> &copy 2009 Institute of Computer and Information Science,Khandari,(AGRA).</font>
		</td>
	</tr>
</table>
</BODY></HTML>