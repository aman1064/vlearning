<%@ page import="java.sql.*" %>
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
%><form action="edit_trainer_handler.jsp" method="post">
			Welcome "<%=session.getAttribute( "user_name" ) %>",  You have logged in as (<%=session.getAttribute( "user_type" ) %>)
			<hr size=1>
			<br><br><br><br><br><br><br><br>
  
	<font size=1>
				ID &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 

<%
       	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	conn = DriverManager.getConnection("jdbc:odbc:virt_desk_db","scott","tiger");

	stat= conn.prepareStatement("SELECT trainername FROM trainer");
	rs = stat.executeQuery();
%>
<select name=id>
<%
	String str = "";
	while( rs.next() )
	{
		str = rs.getString( 1 );
%>
	<option value="<%=  str %>"><%= str %></option>
<%
	}
%>
</select>
&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit>&nbsp;&nbsp;&nbsp; 	
			</font>
		</td>
	</tr>
</table>
<jsp:include page="footer.jsp" />
</BODY></HTML>