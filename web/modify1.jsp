<%@ page import="java.sql.*" %>
<%
	String name = request.getParameter( "name" );
	String pass = request.getParameter( "pass" );

       	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;

	try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		conn = DriverManager.getConnection("jdbc:odbc:virt_desk_db");

		try{
			stat= conn.prepareStatement("update user_details set password=? where username=?");
			stat.setString( 1, pass.trim() );
			stat.setString( 2, name.trim() );
			System.out.println(" ### inside  trainer modify A");
			stat.executeUpdate();
			System.out.println(" ### inside  trainer modify after A");
		}catch( Exception ee ){	System.out.println( ee );	}

		String full = request.getParameter( "full" );
		String add = request.getParameter( "add" );
		String mail = request.getParameter( "mail" );
		String ph = request.getParameter( "ph" );


		try{
stat= conn.prepareStatement("update trainer set fullname = ?, address = ?, emailid = ?, phoneno = ? where trainername=?");
			stat.setString( 1, full.trim() );
			stat.setString( 2, add.trim() );
			stat.setString( 3, mail.trim() );
			stat.setInt( 4, Integer.parseInt( ph.trim() ) );

			stat.setString( 5, name.trim() );
			System.out.println(" ### inside  trainer modify BB");
			stat.executeUpdate();
			System.out.println(" ### inside  trainer modify after BB");
		

		%>
			<HTML> <BODY>
			<jsp:include page="admin_header.jsp" />
			<table>
				<tr bgcolor=ffffff>
				<td >
					<img src="imgs/org.jpg" width=200>
				</td >
				<td width=700 align=top bgcolor=ffffff >
					<font size=2><p align=center><b>
				Welcome "<%=session.getAttribute( "user_name" ) %>",  You have logged in as (<%=session.getAttribute( "user_type" ) %>)
					<hr size=1>
						<br><br><br><br><br><br><br><br>
						</b></p></font>
						<h2> Alert </h2>
						<b> Trainer details updated successfully .
				</td>
				</tr>
			</table>
			<jsp:include page="footer.jsp" />
			</BODY></HTML>
<%

		}catch( Exception ee ){	System.out.println( ee );	
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
						<b> Trainer details not updated . Contact Support Team  
				</td>
				</tr>
			</table>
			<jsp:include page="footer.jsp" />
			</BODY></HTML>

		<%
		}
		if( stat != null )
			stat.close();
		if( rs != null )
			rs.close();
System.out.println( "6" );
	}catch(Exception E)
	{
		System.out.println( E );
		//out.println( E );
      	}
%>

