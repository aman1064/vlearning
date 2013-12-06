<%@ page import="java.sql.*" %>
<HTML> <BODY>
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
			stat.executeQuery();
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

			stat.executeQuery();
		}catch( Exception ee ){	System.out.println( ee );	}
out.println( "5" );
		out.println( "Updation of trainer profile completed successfully" );

		if( stat != null )
			stat.close();
		if( rs != null )
			rs.close();
out.println( "6" );
	}catch(Exception E)
	{
		System.out.println( E );
		out.println( E );
      	}
%>

</BODY>
</HTML>