<HTML> <BODY>
<%@ page import="java.lang.*,java.sql.*" %>

<%
        	Connection conn = null;
	PreparedStatement stat = null;
	ResultSet rs = null,rs1=null;
	String usr_name,passwd,cours,batch,st_dt,ed_dt,f_name,add,m_id,pno;
	try{
		 usr_name = request.getParameter("id").trim();
		 passwd = request.getParameter("pwd").trim();
                 cours = request.getParameter("course").trim();
		 batch= request.getParameter("batch").trim();
                 st_dt = request.getParameter("start_dt").trim();
		 ed_dt = request.getParameter("end_dt").trim();
                 f_name = request.getParameter("full_name").trim();
		 add = request.getParameter("address").trim();
                 m_id = request.getParameter("mail_id").trim();
		 pno = request.getParameter("phone").trim();
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		conn = DriverManager.getConnection("jdbc:odbc:virt_desk_db");

		
                stat= conn.prepareStatement("update student set user_name=? where  user_name=id ");

		rs = stat.executeQuery();
		        rs.setString(1,usr_name);
			rs.setString(2,passwd);
			rs.setString(3,cours);
			rs.setString(4,batch);
			rs.setString(5,st_dt);
			rs.setString(6,ed_dt);
			rs.setString(7,f_name);
			rs.setString(8,add);
			rs.setString(9,m_id);
			rs.setString(10,pno);
		
		rs.close();
		stat.close();

            }



	catch(Exception E)
	{

  %>		<%@ include file="login_error.jsp" %><%
      }
%>

 
</BODY>
</HTML>