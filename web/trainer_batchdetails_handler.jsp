<%@ page import="java.sql.*" %>
<%
       	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;

	try{
		String bat_id = request.getParameter("bid").trim();
		String t_id = request.getParameter("tid").trim();

		

		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		conn = DriverManager.getConnection("jdbc:odbc:virt_desk_db","scott","tiger");

		stat= conn.prepareStatement("SELECT * FROM user_details where username=?");
		String usr_name = request.getParameter("id").trim();
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
			String query = "insert into batches_traineres values ( ?,?  )";

			stat = conn.prepareStatement( query );
			stat.setString( 1, bat_id );
			stat.setString( 2, t_id );
			int count = stat.executeUpdate();

			
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
						<b>Registration of tainer  completed successfully.
				</td>
				</tr>
			</table>
			
			</BODY></HTML>
<%
		}
	}
	catch(Exception E)
	{
		System.out.println( E );
%>
			
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