<%@ page import="java.sql.*" %>
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
			<hr size=1> <br> 
				<h5 align=center>Search Results</h5>
<pre>
<form action="search.jsp" method="post">

<%
	//String queryField = request.getParameter( "student" );
	String queryValue = request.getParameter( "student_value");
       	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;

	try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		conn = DriverManager.getConnection("jdbc:odbc:virt_desk_db");

		/*System.out.println("am here ######### 1111");
		stat= conn.prepareStatement("SELECT * FROM user_details where username=?");
		stat.setString( 1, queryValue.trim());
		rs = stat.executeQuery();

		System.out.println("am here ######### 2222");
		rs.next();
		String password = rs.getString( 2 ).trim(); */

		System.out.println(" before executing ");		
		//String query = "SELECT * FROM student where "+queryField+"="+"'"+queryValue+"'";
		//System.out.println(" before create statenment" + query);
		//stat=conn.createStatement(query);
		System.out.println(" after create statenment");
		stat= conn.prepareStatement("SELECT * FROM student where user_name= ?");
		//stat= conn.createStatement("SELECT * FROM student where "+queryField+"="+"'"+queryValue+"'");
		//stat.setString( 1, queryField.trim() );
		stat.setString( 1, queryValue.trim() );
		rs = stat.executeQuery();
		System.out.println(" its there ");
		System.out.println(" after  executing  " + rs);

		System.out.println("am here ######### 33333");
		rs.next();
		String name = rs.getString( 1 );
		System.out.println("am here ######### 44444");
		String cour = rs.getString( 2 );
		String b_id = rs.getString( 3 );
		String st_dt = rs.getString( 4 );
		String ed_dt = rs.getString( 5 );
		System.out.println("am here ######### 44444");
		String f_name = rs.getString( 6 );
		String add = rs.getString(7);
		String mail = rs.getString( 8 );
		String ph = rs.getString( 9 );
		System.out.println("am here ######### 5555");
%>
<table border=1 width=100%>
	<tr>
		<td><b>Particulars</b></td>
		<td><b>Original Data</b></td>
		
	</tr>
	<tr>
		<td>student Name</td>
		<td><%=name%></td>
		
	</tr>
	<tr>
		<td>course</td>
		<td><%=cour %></td>
		
	</tr>
	<tr>
		<td>batch_id</td>
		<td><%=b_id%></td>
		

	</tr>
	<tr>
		<td>start_date</td>
		<td><%=st_dt%></td>
		
	</tr>
	<tr>
		<td>End_date</td>
		<td><%=ed_dt%></td>
		
	</tr>
	<tr>
		<td>full name.</td>
		<td><%=f_name%></td>
		
	</tr>

         <tr>
		<td>Address.</td>
		<td><%=add%></td>
		
	</tr>
         <tr>
		<td>mail id.</td>
		<td><%=mail%></td>
		
	</tr>
        <tr>
		<td>phone</td>
		<td><%=ph%></td>
		
	</tr>


	<tr>
		<td></td>
		<td align=center><input type=submit value="New Search"></td>

	</tr>
</table>
<%
	}catch( Exception e )  { %>
			
			<HTML> <BODY>
			<!-- <jsp:include page="admin_header.jsp" /> -->
			<form action="search.jsp" method="post">
			<table>
				
						<h1> Alert </h1>
						<h1><b> Student name not found </h1>
				
			</table>
			<input type=submit value="New Search">
			</form>
			<jsp:include page="footer.jsp" />
			</BODY></HTML>



<% } %>