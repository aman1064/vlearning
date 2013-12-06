<%@ page import="java.sql.*" %>
<%
       	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;

	try{
		String usr_name = request.getParameter("id").trim();
		String passwd = request.getParameter("pwd").trim();
		String login_type = request.getParameter( "type" ).trim();
		String course = request.getParameter( "course" ).trim();
		String batch_id = request.getParameter( "batch" ).trim();
		String start_dt = request.getParameter( "start_dt" ).trim();
		String end_dt = request.getParameter( "end_dt" ).trim();
		String full_name = request.getParameter( "full_name" ).trim();
		String address = request.getParameter( "address" ).trim();
		String mail_id = request.getParameter( "mail_id" ).trim();
		String phone = request.getParameter( "phone" ).trim();

		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		conn = DriverManager.getConnection("jdbc:odbc:virt_desk_db","scott","tiger");

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
					<hr size=1>
						<br><br><br><br><br><br><br><br>
						</b></p></font>
						<h2> Alert </h2>
						<b>Registration of Student with id <%=usr_name %> could not be completed.<br>
						The specified user id already exists <br> You may try again.</b>
				</td>
				</tr>
			</table>
			<jsp:include page="footer.jsp" />
			</BODY></HTML>
<%
		}
		else
		{
			String query = "insert into student values ( ?, ?, ?, ?, ?, ?, ?, ?, ? )";

			stat = conn.prepareStatement( query );
			stat.setString( 1, usr_name );
			stat.setString( 2, course );
			stat.setString( 3, batch_id );
			stat.setString( 4, start_dt );
			stat.setString( 5, end_dt );
			stat.setString( 6, full_name );
			stat.setString( 7, address );
			stat.setString( 8, mail_id );
			stat.setString( 9, phone );

			int count = stat.executeUpdate();

			query = "insert into user_details values ( ?, ?, ? )";

			stat = conn.prepareStatement( query );
			stat.setString( 1, usr_name );
			stat.setString( 2, passwd );
			stat.setString( 3, login_type );

			count = stat.executeUpdate();
%>
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
					<hr size=1>
						<br><br><br><br><br><br><br><br>
						</b></p></font>
						<h2> Alert </h2>
						<b>Registration of Student with id <%=usr_name %> completed successfully.
				</td>
				</tr>
			</table>
			<jsp:include page="footer.jsp" />
			</BODY></HTML>
<%
		}
	}
	catch(Exception E)
	{
		System.out.println( E );
%>
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
					<hr size=1>
						<br><br><br><br><br><br><br><br>
						</b></p></font>
						<b>Registration of Student with id <%= request.getParameter("id").trim() %> could not be completed.<br>
						An internal error occured.  comments : <%= "" + E %>
					</td>
				</tr>
			</table>
			<jsp:include page="footer.jsp" />
			</BODY></HTML>
<%
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

%>
</BODY></HTML>