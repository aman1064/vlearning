<%@ page import="java.sql.*" %>
<%
        	Connection conn = null;
	PreparedStatement stat = null;
	try{
		String batch_id = request.getParameter( "id" ).trim();

		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		conn = DriverManager.getConnection("jdbc:odbc:virt_desk_db");

		stat= conn.prepareStatement( "delete from class_status where batch_id=?" );
		stat.setString( 1, batch_id );

		int count = stat.executeUpdate();
		if(  count > 0  )
		{
			out.println( "success" );	//indicates removal of record from class_status to end the class
		}
		else
		{
			out.println( "failure" );	//indicates failure of deleting the record from class_status
		}
System.out.println( "I here" );
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
	     }catch( Exception ee ){	}
		System.gc();
	}
%>