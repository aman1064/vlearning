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
			Welcome "<%=session.getAttribute( "user_name" ) %>",  You have logged in as (<%=session.getAttribute( "user_type" ) %>)
			<hr size=1> <br> 
				<h5 align=center>Enter details of student to modify . </h5>
<pre>
<form action="modify1.jsp" method="post">

<%
	String usr_name = request.getParameter( "id" );
       	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;

	try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		conn = DriverManager.getConnection("jdbc:odbc:virt_desk_db");

		stat= conn.prepareStatement("SELECT * FROM user_details where username=?");
		stat.setString( 1, usr_name.trim());
		rs = stat.executeQuery();

		rs.next();
		String password = rs.getString( 2 ).trim();

		stat= conn.prepareStatement("SELECT * FROM trainer where trainername = ?");
		stat.setString( 1, usr_name.trim() );
		rs = stat.executeQuery();

		rs.next();
		String name = rs.getString( 1 );
		String full_name = rs.getString( 2 );
		String add = rs.getString( 3 );
		String mail = rs.getString( 4 );
		String ph = rs.getString( 5 );
%>
<table border=1 width=100%>
	<tr>
		<td><b>Particulars</b></td>
		<td><b>Original Data</b></td>
		<td><b>Enter new Data</b></td>
	</tr>
	<tr>
		<td>Trainer Name</td>
		<td><%=name%></td>
		<td><%=name%></td>
			<input type=hidden name=name value=<%=name.trim()%> >
	</tr>
	<tr>
		<td>Password</td>
		<td><%=password %></td>
		<td>
			<input type=text name=pass value=<%=password %>>
		</td>
	</tr>
	<tr>
		<td>Full Name</td>
		<td><%=full_name%></td>
		<td>
			<input type=text name=full value=<%=full_name%>>
		</td>

	</tr>
	<tr>
		<td>Address</td>
		<td><%=add%></td>
		<td>
			<input type=text name=add value=<%=add%>>
		</td>

	</tr>
	<tr>
		<td>Email Id</td>
		<td><%=mail%></td>
		<td>
			<input type=text name=mail value=<%=mail%>>
		</td>
	</tr>
	<tr>
		<td>Phone No.</td>
		<td><%=ph%></td>
		<td>
			<input type=text name=ph value=<%=ph%>>
		</td>
	</tr>
	<tr>
		<td></td>
		<td align=center><input type=reset></td>
		<td align=center><input type=submit></td>
	</tr>
</table>
<%
	}catch( Exception e ){	out.println( e );	}
%>