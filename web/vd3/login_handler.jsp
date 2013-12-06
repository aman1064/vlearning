<%@ page import="java.sql.*" %>
<%
        	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;
	try{
		String usr_name = request.getParameter("id").trim();
		String passwd = request.getParameter("pwd").trim();
		String login_type = request.getParameter( "type" ).trim();
System.out.println( usr_name + "..." + passwd + "..." + login_type );
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		conn = DriverManager.getConnection("jdbc:odbc:virt_desk_db");

		stat= conn.prepareStatement("SELECT * FROM user_details where username=?");
		stat.setString( 1, usr_name);

		rs = stat.executeQuery();		boolean id_found = false;

                	if( rs.next() )
		{
			String a = rs.getString(1).trim();
			String b = rs.getString(2).trim();
			String c = rs.getString(3).trim();

			if( usr_name.equals(a) && passwd.equals(b) && login_type.equals( c ) )
			{
				out.println( "success" );
			}
			else //password does not match
			{
				out.println( "failure2" );
			}
		}
		else //username does not exist
		{
			out.println( "failure" );
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