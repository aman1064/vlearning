<%@ page import="java.sql.*" %>
<%
        	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;
	try{
		String student_id = request.getParameter( "id" ).trim();

		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		conn = DriverManager.getConnection("jdbc:odbc:virt_desk_db");
System.out.println( student_id );
		stat= conn.prepareStatement( "SELECT batch_id FROM student where user_name =?" );
		stat.setString( 1, student_id.trim() );

		rs = stat.executeQuery();		
		rs.next();

		String batch_id = rs.getString( 1 );
System.out.println( batch_id );

		stat= conn.prepareStatement( "SELECT trainer_sys_ip FROM class_status where batch_id = ?" );
		stat.setString( 1, batch_id.trim() );

		rs = stat.executeQuery();

                	if( ! rs.next() )
		{
			out.println( "failure" );	//indicates class is not currently going on.
		}
		else
		{
			String ip = rs.getString( 1 );

			out.println( "success;"  + ip.trim() );	//indicates that the class is currently going on and the respective trainers machines ip has been retrieved.
		}
	}catch( Exception e){	System.out.println( "Exception in client_login_handler.jsp : " + e );	}
	finally
	{
	    try{
		if( stat != null )
		{
			stat.close();
			stat = null;
		}
		if( conn != null )
		{
			conn.close();
			conn = null;
		}
		if( rs != null )
		{
			rs.close();
			rs = null;
		}
	     }catch( Exception ee ){	}
		System.gc();
	}
%>