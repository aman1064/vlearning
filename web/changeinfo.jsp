<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>


<BODY bgColor=#9596CC>
<%@ page import="java.sql.*" %>
<jsp:useBean id="dcon" scope="session" class="dbean.DBCon" />

<%! 
	Connection con;
	ResultSet rs;
	Statement st;
	String aname,occ,address,email,uname,pwd,phno;
	int age;
%>
<%
	String ano=(String)session.getAttribute("accnum");

	con=dcon.getCon();
	st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from acc_master where acc_num='"+ano+"'");
	while(rs.next())
	{
		
		aname=rs.getString(2);
		occ=rs.getString(4);
		address=rs.getString(5);
		phno=rs.getString(6);
		email=rs.getString(8);
		uname=rs.getString(11);
		pwd=rs.getString(12);
		age=rs.getInt(3);
	}




%>
<form method=post action="update.jsp">

<TABLE 
style="Z-INDEX: 100; LEFT: 10px; WIDTH: 570px; POSITION: absolute; TOP: 71px; HEIGHT: 441px" 
cellSpacing=1 cellPadding=1 width=570 border=0>
  
  <TR>
    <TD>
      <TABLE style="Z-INDEX: 100; LEFT: 3px; POSITION: absolute; TOP: 4px" 
      cellSpacing=1 cellPadding=1 width="75%" border=0>
        
        <TR>
          <TD><STRONG><FONT color=#330066 size=4>Change Personal 
            Info</FONT></STRONG></TD></TR></TABLE>
      <TABLE 
      style="Z-INDEX: 101; LEFT: 5px; WIDTH: 343px; POSITION: absolute; TOP: 36px; HEIGHT: 294px" 
      cellSpacing=1 cellPadding=1 width=343 border=0>
        
        <TR>
          <TD><STRONG><FONT color=darkorchid>Name</FONT></STRONG></TD>
          <TD><INPUT id=text1 name=accholder_name value=<%=aname%>></TD></TR>
        <TR>
          <TD><STRONG><FONT color=darkviolet>Age</FONT></STRONG></TD>
          <TD><INPUT id=text2 name=ah_age value=<%=age%>></TD></TR>
        <TR>
          <TD><STRONG><FONT color=darkviolet>Occupation</FONT></STRONG></TD>
          <TD><INPUT id=text3 name=ah_occ value=<%=occ%>></TD></TR>
        <TR>
          <TD><STRONG><FONT color=darkviolet>Address</FONT></STRONG></TD>
          <TD><TEXTAREA id=TEXTAREA1 name=ah_address ><%=address%></TEXTAREA></TD></TR>
        <TR>
          <TD><STRONG><FONT color=darkviolet>Phone Number</FONT></STRONG></TD>
          <TD><INPUT id=text4 name=ah_phno value=<%=phno%>></TD></TR>
        <TR>
          <TD><STRONG><FONT color=darkviolet>E-Mail</FONT></STRONG></TD>
          <TD><INPUT id=text5 name=ah_email value=<%=email%>></TD></TR>
       
      </TABLE>
      <TABLE style="Z-INDEX: 102; LEFT: 8px; POSITION: absolute; TOP: 363px" 
      cellSpacing=1 cellPadding=1 width="75%" border=0>
        
        <TR>
          <TD><STRONG><FONT 
            color=darkviolet>Login&nbsp;Id</FONT></STRONG>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</TD>
          <TD><INPUT id=text9 name=loginid value=<%=uname%>></TD></TR>
        <TR>
          <TD><STRONG><FONT 
            color=darkviolet>Password</FONT></STRONG></TD>
          <TD><INPUT id=password1 type=password 
      name=password value=<%=pwd%>></TD></TR></TABLE>
      <TABLE style="Z-INDEX: 103; LEFT: 4px; POSITION: absolute; TOP: 332px" 
      cellSpacing=1 cellPadding=1 width="75%" border=0>
        
        <TR>
          <TD><STRONG><FONT color=#330066 size=4>Change Login 
            Info</FONT></STRONG></TD></TR></TABLE></TD></TR></TABLE></P>
	     <INPUT id=submit1 style="Z-INDEX: 101; LEFT: 105px; POSITION: absolute; TOP: 516px" type=submit value=Submit name=submit1><INPUT id=reset1 style="Z-INDEX: 102; LEFT: 257px; POSITION: absolute; TOP: 515px" type=reset value=Reset name=reset1>


</form>
</BODY>
</HTML>
