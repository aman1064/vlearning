<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*, kogent.*, java.util.*, java.text.*,  java.net.*" errorPage="" %>
<HTML>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Select Class Room</title>
<link href="mystyle.css" rel="stylesheet" type="text/css">
<%
String chRoomPath = (String)session.getAttribute("chRoomPath");
String roomListPath = (String)session.getAttribute("roomListPath");
String adminChatPath = (String)session.getAttribute("adminChatPath");
%>
</head>
<BODY>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<STYLE type="text/css">BODY {
	MARGIN-TOP: 10px; FONT-SIZE: 12px; BACKGROUND: #446684; MARGIN-LEFT: 5px; FONT-FAMILY: verdana, arial,helvetica; font-color: black
}
TD { 
	COLOR: black; FONT-STYLE: normal; FONT-FAMILY: verdana, arial,helvetica
}
A:link {
	COLOR: black; FONT-STYLE: normal; FONT-FAMILY: verdana, arial,helvetica; TEXT-DECORATION: underline
}
A:active {
	COLOR: black; FONT-STYLE: normal; FONT-FAMILY: verdana, arial,helvetica; TEXT-DECORATION: underline
}
A:visited {
	COLOR: black; FONT-STYLE: normal; FONT-FAMILY: verdana, arial,helvetica; TEXT-DECORATION: underline
}
</STYLE>

<TABLE cellSpacing=0 cellPadding=0 width=100% align=center border=0>
  	<TR><table>
		<TD align=left width=60 >&nbsp;
          			<FONT size=2><B> <A href="student_home.jsp">Home</A> </B></FONT> <br> &nbsp;
          			
		</TD>
        		<TD align=center width=700 height=20>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<img src="imgs/logo.jpg" width=60%  >
		</TD>
        		<TD align=left >
			<img src="imgs/consulting2.jpg"  width=50% >
		</TD>
	      </table>
	</TR>
<hr size=2 >
	<TR>
		<TD>
          			<FONT size=2><B> <A href="loginclass.jsp">Login to Class Room </A> </B></FONT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</TD>
		<TD>
          			<FONT size=2><B> <A href="student_download.jsp">Download material </A> </B></FONT> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</TD>
		<TD>
          			<FONT size=2><B> <A href="Bonus1.jar">Test  </A> </B></FONT>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</TD>
		<TD>
          			<FONT size=2><B> <A href="logout.jsp">Logout </A> </B></FONT> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</TD>
		
<hr size=2>
	<table>
	</TR>
</TABLE>
<%
        String s = request.getParameter("expand");
        String s1 = (String)session.getAttribute("profileName");
        if(s1 == null)
        {
            s1 = "";
        }
	%>
<table>
	<tr bgcolor=ffffff>
		<td >
			<img src="imgs/org.jpg" width=200>
		</td >
		<td width=700 valign=top bgcolor=ffffff >
    <div align="center"><font size="+2">Select Your Room.</font></div>
<form method="post" action="ChRoomServlet">
	<%
	HashMap hashmap = (HashMap)getServletContext().getAttribute("roomList");
	if(hashmap == null){
		out.println("<tr><td>No Rooms configured.</td></tr>");
	}
	else{
	%>
	
	<br />Your Login id i.e. "<%=session.getAttribute("user_name")%>" will be used while chatting.
	<input name=profileName type="hidden" value="<%=session.getAttribute("user_name")%>">
	<br><br>
	<%
		Iterator iterator = hashmap.keySet().iterator();
		while(iterator.hasNext()){
			String s2 = (String)iterator.next();
			ChatRooms  chatroom = (ChatRooms )hashmap.get(s2);
			String s3 = roomListPath + "?expand=" + URLEncoder.encode(s2);
			s3 = response.encodeURL(s3);
			%>
		<br><input type=radio name=roomName value="<%=s2%>" <%=((s != null && s.equals(s2)) ? " CHECKED" : "")%>>
			<a href="<%=s3%>"> <%=s2%> </a>
			<%
			if(s != null && s.equals(s2)){
				if(chatroom.getDescription().length() == 0){
					out.println("<br><div class=smallesttext>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;There is no Subject available.</div>");
				}
				else{
					out.println("<br><div class=smallesttext>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;About: "+chatroom.getDescription()+"</div>");		}
			}
		}
		%>
        <div align="center"><input type=submit value="Enter the Room"/></div>
        </tr>
	
	</form>
	<%}%>
	</table>

<table width=100%>
	<tr>
		<td bgcolor=cccccc align=center>
			<font size=1> &copy 2009 Institute of Computer and Information Science,Khandari,(AGRA).</font>
		</td>
	</tr>
</table>
</BODY></HTML>