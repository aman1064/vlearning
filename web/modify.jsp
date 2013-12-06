<%@ page import="java.lang.*,java.sql.*" %>

<%
        	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null,rs1=null;
	String usr_name,passwd,cours,batch,st_dt,ed_dt,f_name,add,m_id,pno;
	try{
		 System.out.println(" ### inside modify 11");
		 usr_name = request.getParameter("id").trim();
		 System.out.println(" ### inside modify A");
		 //passwd = request.getParameter("pwd").trim();
                 cours = request.getParameter("cour").trim();
				 System.out.println(" ### inside modify B");
		 batch= request.getParameter("b_id").trim();
		 System.out.println(" ### inside modify C");
                 st_dt = request.getParameter("st_dt").trim();
				 System.out.println(" ### inside modify D");
		 ed_dt = request.getParameter("ed_dt").trim();
		 System.out.println(" ### inside modify E");
                 f_name = request.getParameter("f_name").trim();
				 System.out.println(" ### inside modify F");
		 add = request.getParameter("add").trim();
		 System.out.println(" ### inside modify G");
                 m_id = request.getParameter("mail").trim();
				 System.out.println(" ### inside modify H");
		 pno = request.getParameter("ph").trim();
		 		 System.out.println(" ### inside modify 22");
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		conn = DriverManager.getConnection("jdbc:odbc:virt_desk_db");

		
                stat= conn.prepareStatement("update student set course=?, batch_id=?, start_date=?, end_date=?, full_name=?, add=?, mail=?, phone=? where user_name=?");
						 System.out.println(" ### inside modify 33");

		        //stat.setString(1,usr_name);
//			stat.setString(2,passwd);
			stat.setString(1,cours);
			stat.setString(2,batch);
			stat.setString(3,st_dt);
			stat.setString(4,ed_dt);
			stat.setString(5,f_name);
			stat.setString(6,add);
			stat.setString(7,m_id);
			stat.setString(8,pno);
			stat.setString(9,usr_name);
		 System.out.println(" ### inside modify 44");
		stat.executeUpdate();
				 System.out.println(" ### inside modify 55");

		stat.close(); 

		System.out.println("student modified success");
		%>
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
					<hr size=1>
						<br><br><br><br><br><br><br><br>
						</b></p></font>
						<h2> Alert </h2>
						<b> Student details updated successfully .
				</td>
				</tr>
			</table>
			<jsp:include page="footer.jsp" />
			</BODY></HTML>
<%

            }



	catch(Exception E)
	{
		System.out.println("student modified failed"+E);
		%> 
			<HTML> <BODY>
			<jsp:include page="admin_header.jsp" />
			<table>
				<tr bgcolor=ffffcc>
				<td >
					<img src="imgs/org.jpg" width=200>
				</td >
				<td width=700 align=top bgcolor=ffffcc >
					<font size=2><p align=center><b>
				Welcome "<%=session.getAttribute( "user_name" ) %>",  You have logged in as (<%=session.getAttribute( "user_type" ) %>)
					<hr size=1>
						<br><br><br><br><br><br><br><br>
						</b></p></font>
						<h2> Alert </h2>
						<b> Student details not updated . Contact Support Team  
				</td>
				</tr>
			</table>
			<jsp:include page="footer.jsp" />
			</BODY></HTML>

		<%

  
      }
%>

 