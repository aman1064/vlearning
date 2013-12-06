<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*,  java.io.*,  kogent.*, java.util.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Configuring Class Rooms</title>
<%
String chRoomPath = (String)session.getAttribute("chRoomPath");
String roomListPath = (String)session.getAttribute("roomListPath");
String adminChatPath = (String)session.getAttribute("adminChatPath");
%>

</head>
<body>
<jsp:include page="admin_header.jsp" />
<table>

	<tr bgcolor=ffffff>
		<td >
			<img src="imgs/org.jpg" width=200>
		</td >
		<td width=700 align=top bgcolor=ffffff >
			<font size=2><p align=center><b>
<%
	if( session.getAttribute( "user_name" ) == null ||  ( (String) session.getAttribute( "user_name" ) ).trim().equals( "" ) )
	{
%>

		<br><br>
<%
	}
%>
	<form method="post" action="<%=response.encodeURL(adminChatPath)%>">
	<%
                try{
		HashMap hashmap = (HashMap)getServletContext().getAttribute("roomList");
		if(hashmap != null){
		    Iterator iterator = hashmap.keySet().iterator();
            if(!iterator.hasNext()){
				out.println("No Room Configured.");
            }
			else{
				out.println("To Remove a Room check it and press Update RoomList");
                ChatRooms  chatroom;
                for(; iterator.hasNext(); out.println("<br><input type=checkbox name=remove value='" + chatroom.getName() + "'>" + chatroom.getName() )){
				    String s = (String)iterator.next();
                    chatroom = (ChatRooms )hashmap.get(s);
                }
			}
        }
                }
                catch(Exception e)
                {out.print(e);}
	%>
	<p align="center">Enter Name and Description for new Chat Room.</p>
	<table align="center" >
	  <tr>
	    <td>Name</td>
	  	<td><input name=roomname size=25 class="smalltext"></td>
	  </tr>
	  <tr>
	  	<td >Subject</td>
	  	<td><textarea name=roomdescr cols=25 rows=4 class="smalltext"></textarea></td>
		</tr>
	  </table>
	  <p>&nbsp;</p>
	  <div align="center">
	  <input type=submit value="Update RoomList">
	  </div>
	  </form>
	</td>
  </tr>
  <tr><td align="center">&nbsp;</td></tr></table>
</body></html>
