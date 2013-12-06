<%
	session.setAttribute( "user_name", "" );
	session.setAttribute( "user_type", "" );

	session.invalidate()	;
	session = null;
System.out.println( "session deleted" );
%>
	<jsp:include page="home.jsp" />

