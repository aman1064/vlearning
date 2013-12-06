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
				<h5 align=center>Search results for trainer <%=request.getParameter( "trainer_name" )%> </h5>
<pre>
<form action="search.jsp" method="post">

<%
	String usr_name = request.getParameter( "trainer_name" );
       	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null;

	try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		conn = DriverManager.getConnection("jdbc:odbc:virt_desk_db");

		
		stat= conn.prepareStatement("SELECT * FROM trainer where trainername = ?");
		stat.setString( 1, usr_name.trim() );
		rs = stat.executeQuery();
		
		rs.next();
		String name = rs.getString( 1 );
		String full_name = rs.getString( 2 );
		String add = rs.getString( 3 );
		String mail = rs.getString( 4 );
		String ph = rs.getString( 5 );

%>
<table border=1 width=100%>
	
	<tr>
		<td><b>Trainer Name<b></td>
		<td><%=name%></td>
		
	</tr>
	<tr>
		<td><b>Full Name<b></td>
		<td><%=full_name%></td>
		

	</tr>
	<tr>
		<td><b>Address<b></td>
		<td><%=add%></td>
		
	</tr>
	<tr>
		<td><b>Email Id<b></td>
		<td><%=mail%></td>
		
	</tr>
	<tr>
		<td><b>Phone No.<b></td>
		<td><%=ph%></td>
		
	</tr>
	<tr>
		<td></td>
		<td align=center><input type=submit value="New Search"></td>
	</tr>
</table>
<%
	 }catch( Exception e ) { %>
			
			<HTML> <BODY>
			<!-- <jsp:include page="admin_header.jsp" /> -->
			<form action="search.jsp" method="post">
			<table>
				
						<h1> Alert </h1>
						<h1><b> Trainer name not found </h1>
				
			</table>
			<input type=submit value="New Search">
			</form>
			<jsp:include page="footer.jsp" />
			</BODY></HTML>



<% } %>