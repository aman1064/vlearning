<%@ page import="java.sql.*" %>

<HTML> <BODY>
<jsp:include page="admin_header.jsp" />
<table>
	<tr bgcolor=ffffff>
		<td >
			<img src="imgs/org.jpg" width=200>
		</td >
<%
       	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;

	try{
		String usr_name = request.getParameter("id").trim();
		String pwd = request.getParameter("pwd").trim();
		String full_name = request.getParameter( "full_name" ).trim();
		String address = request.getParameter( "address" ).trim();
		String mail_id = request.getParameter( "mail_id" ).trim();
		String phone = request.getParameter( "phone" ).trim();
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		conn = DriverManager.getConnection("jdbc:odbc:virt_desk_db");
		stat= conn.prepareStatement("SELECT * FROM user_details where username=?");
		stat.setString( 1, usr_name);

		rs = stat.executeQuery();

		boolean id_found = false;

                while( rs.next() )
		{
			id_found = true;
		}

		if( id_found )
		{
%>
				<td width=700 align=top bgcolor=ffffcc >
					<font size=2><p align=center><b>
				Welcome "<%=session.getAttribute( "user_name" ) %>",  You have logged in as (<%=session.getAttribute( "user_type" ) %>)
					<hr size=1>
						<br><br><br><br><br><br><br><br>
						</b></p></font>
						<h2> Alert </h2>
						<b>Registration of Trainer with id <%=usr_name %> could not be completed.<br>
						The specified user id already exists <br> You may try again.</b>
				</td>
<%
		}
		else
		{
			String query = "insert into trainer values ( ?, ?, ?, ?, ?)";

			stat = conn.prepareStatement( query );
			stat.setString( 1, usr_name );
			stat.setString( 2, full_name );
			stat.setString( 3, address );
			stat.setString( 4, mail_id );
			stat.setString( 5, phone );

			int count = stat.executeUpdate();

			query = "insert into user_details values ( ?, ?, ? )";

			stat = conn.prepareStatement( query );
			stat.setString( 1, usr_name );
			stat.setString( 2, pwd );
			stat.setString( 3, "Trainer" );

			count = stat.executeUpdate();
%>
				<td width=700 align=top bgcolor=ffffcc >
					<font size=2><p align=center><b>
				Welcome "<%=session.getAttribute( "user_name" ) %>",  You have logged in as (<%=session.getAttribute( "user_type" ) %>)
					<hr size=1>
						<br><br><br><br><br><br><br><br>
						</b></p></font>
						<h2> Alert </h2>
						<b>Registration of trainer with id <%=usr_name %> completed successfully.
				</td>
<%
		}
	}
	catch(Exception E)
	{
		System.out.println( E );
%>
		<td width=700 align=top bgcolor=ffffcc >
			<font size=2><p align=center><b>
				Welcome "<%=session.getAttribute( "user_name" ) %>",  You have logged in as (<%=session.getAttribute( "user_type" ) %>)
				<hr size=1>
				<br><br><br><br><br><br><br><br>
				</b></p></font>
				<b>Registration of trainer with id <%= request.getParameter("id").trim() %> could not be completed.<br>
				An internal error occured.  comments : <%= "" + E %>
		</td>
	</tr>
</table>
<%
out.println( "A6" );
	}
	finally
	{
		try{
			if( rs != null )
				rs.close();

			if( stat != null )
				stat.close();

			if( conn != null )
				conn.close();
		}catch( Exception e ){	System.out.println( e );	}
	}
out.println( "A7" );
%>
<jsp:include page="footer.jsp" />
</BODY></HTML>
