<%@ page import="java.sql.*" %>
<%
        	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;
	try{
		String trainer_id = request.getParameter( "trainer_id" ).trim();
		String batch_id = request.getParameter( "batch_id" ).trim();
		String ip = request.getParameter( "ip" ).trim();

		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		conn = DriverManager.getConnection("jdbc:odbc:virt_desk_db");

		stat= conn.prepareStatement( "SELECT * FROM batches where batch_id=?" );
		stat.setString( 1, batch_id );

		rs = stat.executeQuery();		
		if( ! rs.next() )
		{
			out.println( "failure" );	//indicates batch id is wrong
		}
		else
		{
			stat= conn.prepareStatement( "SELECT * FROM batches_trainers where batch_id = ? and trainer_name = ?" );
			stat.setString( 1, batch_id );
			stat.setString( 2, trainer_id );

			rs = stat.executeQuery();

	                	if( ! rs.next() )
			{
				out.println( "failure2" );	//indicates faculty does not belong to this batch
			}
			else
			{
				stat= conn.prepareStatement( "SELECT * FROM class_status where batch_id = ?" );
				stat.setString( 1, batch_id );

				rs = stat.executeQuery();

				if( rs.next() )
				{
					out.println( "failure3" );	//indicates class is already in progress
				}
				else
				{
					stat= conn.prepareStatement( "insert into class_status values ( ?, ? )" );
					stat.setString( 1, batch_id );
					stat.setString( 2, ip );

					stat.executeUpdate();
					out.println( "success" );	//indicates successful entry of class start details into database
				}
			}
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