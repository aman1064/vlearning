<HTML> <BODY>
<jsp:include page="header.jsp" />
<table>
	<tr>
		<td>
			 <img src="imgs/central_india.jpg" width=550  height=300 >
		</td >
		<td bgcolor=ffffcc width=200 >
			<font size=2>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Our TrueLearn is the most true to its name, Online Education.
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;It not only does provide course details Online, It also does permit handling of all class sessions online, including the process of examination, assignment submission and interaction.
			</font>
		</td>
		<td bgcolor=bbbbbb >
			<form action="login_page.jsp" method="post">
				<table><tr ><td bgcolor=blue ><font color=white style=bold> 
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