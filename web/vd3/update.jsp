<HTML>
<BODY bgColor=#9596CC>
<%@ page import="java.lang.*,java.sql.*" %>

<%! 
	Connection conn;
	ResultSet rs;
	Statement st;
	
%>
<%
	 
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	conn = DriverManager.getConnection("jdbc:odbc:virt_desk_db");
        String usr_name,f_name,add,m_id,pno; 
        usr_name=(String)session.getAttribute("id");
	f_name=request.getParameter("full_name");
	add=request.getParameter("address");
	m_id=request.getParameter("mail_id");
	pno=request.getParameter("phone");
	int i=st.executeUpdate("update triner set trainername='"+usr_name+"',fullname="+f_name+",address='"+add+"',emilid='"+m_id+"',phoneno='"+pno+"' where trainername='"+usr_name+"'");
	if(i==1)
	{
		out.println("<br><br><br><br><br><br><center><b>Your details has been modified</center></b>");
	}
	else
	{
		out.println("<br><br><br><br><br><br><center><b>Your details has not been modified</center></b>");
	}

%>
