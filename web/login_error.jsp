<HTML> <BODY>
<jsp:include page="header.jsp" />
<table>
	<tr>
		<td width=200>
			<img src="imgs/err.jpg" align=left width=200>
		</td >
		<td bgcolor=ffffff width=600 >
			<font size=2 >
				<b>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Login operation failed.<br> <br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;You may try again.
				</b>
			</font>
		</td>
		<td bgcolor=ffffff >
			<form action="login_page.jsp" method="post">
				<table><tr ><td bgcolor=446684 ><font color=white style=bold> 
					<b > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;L O G I N &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b> 
				</font> </td> </tr> </table>
				<br><br><br>
				<font size=1>
				I D &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <input type=text name=id>
				PASSWORD : <input type=password name=pwd>
				TYPE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 	<select name=type>
							<option value=Student>Student</option>
							<option value=Trainer>Trainer</option>
							<option value=Administrator>Administrator</option>
						</select>
				</font><br><br>
				&nbsp;&nbsp;&nbsp;<input type=submit>&nbsp;&nbsp;&nbsp;<input type=reset>
			</form>
		</td>
	</tr>&nbsp;&nbsp;
	<tr>
		<td > </td>
		<td > </td>
		<td >
			<img src="imgs/ebusiness.gif" >
		</td>
	</tr>
</table>
<jsp:include page="footer.jsp" />
</BODY></HTML>