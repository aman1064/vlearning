<%@ page import="java.sql.*" %>
<%
       	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;

	try{
		String bat_id = request.getParameter("id").trim();
		String cours = request.getParameter("course").trim();
		String b_s_d = request.getParameter( "bsd" ).trim();
		String b_details = request.getParameter( "bed" ).trim();
		

		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		conn = DriverManager.getConnection("jdbc:odbc:virt_desk_db","scott","tiger");

		stat= conn.prepareStatement("SELECT * FROM batches where batch_id =?");
		String b_name = request.getParameter("id").trim();
		stat.setString( 1, b_name);

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
				Welcome "<%=session.getAttribute( "b_name" ) %>",  You have logged in as (<%=session.getAttribute( "user_type" ) %>)
					<hr size=1>
						<br><br><br><br><br><br><br><br>
						</b></p></font>
						
						<b>Registration of Student with id <%=b_name %> could not be completed.<br>
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
			String query = "insert into batches values ( ?, ?, ?, ? )";

			stat = conn.prepareStatement( query );
			stat.setString( 1, bat_id );
			stat.setString( 2, cours );
			stat.setString( 3, b_s_d );
			stat.setString( 4, b_details );
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
				Welcome "<%=session.getAttribute( "b_name" ) %>",  You have logged in as (<%=session.getAttribute( "user_type" ) %>)
					<hr size=1>
						<br><br><br><br><br><br><br><br>
						</b></p></font>
						
						<b>Registration of Student with id <%=b_name %> completed successfully.
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