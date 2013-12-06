<%@ page import="java.sql.*" %>
<HTML> <BODY>
<%
        	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;
	try{
		String usr_name = request.getParameter("id").trim();
		String passwd = request.getParameter("pwd").trim();
		String login_type = request.getParameter( "type" ).trim();

		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		conn = DriverManager.getConnection("jdbc:odbc:virt_desk_db");

		stat= conn.prepareStatement("SELECT * FROM user_details where username=?");
		stat.setString( 1, usr_name);

		rs = stat.executeQuery();		boolean id_found = false;

                	while( rs.next() )
		{
			String a = rs.getString(1).trim();
			String b = rs.getString(2).trim();
			String c = rs.getString(3).trim();

  			if( usr_name.equals(a) && passwd.equals(b) && login_type.equals( c ) )
			{
				session.setAttribute( "user_name", a );
				session.setAttribute( "user_type", c );

				if( c.equals( "Administrator" ) )
				{
%>
	    				<%@ include file="admin_home.jsp" %>
<%
				}else if( c.equals( "Trainer" ) )
				{
%>
	    				<%@ include file="trainer_home.jsp" %>
<%
				}else if( c.equals( "Student" ) )
				{
%>
	    				<%@ include file="student_home.jsp" %>
<%
				}
				id_found = true;
				break;
			}
		}

		rs.close();
		stat.close();
		

		if( ! id_found )
		{
%>
			<%@ include file="login_error.jsp" %>
<%
		}
	}
	catch(Exception E)
	{
%>
		<%@ include file="login_error.jsp" %>
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