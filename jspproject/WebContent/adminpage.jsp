
<%@ page contentType="text/html;charset=euc-kr" import="java.sql.*"%>
<html>
<body>
<p align="right"><%=session.getAttribute("id")%>님
		<input type="button" value="책 추가" OnClick="location.href='insert.jsp'" />
		<input type="button" value="로그아웃" OnClick="location.href='logout.jsp'" />
	</p>
	<p align="center">
		<b><font>책 관리</font></b>
	</p>
	<table align="center" border="1" cellpadding="1" cellspacing="0">
		<tr bgcolor=f7e091>
		<td height="29">
				<p align="center">
					<b>글번호</b></font>
				</p>
			</td>
			<td height="29">
				<p align="center">
					<b>책 이름</b></font>
				</p>
			</td>
			<td height="29">
				<p align="center">
					<b>작가</b></font>
				</p>
			</td>
			<td height="29">
				<p align="center">
					<b>장르</b></font>
				</p>
			</td>
			<td height="29">
				<p align="center">
					<b>수정 여부</b></font>
				</p>
			</td>
			<td height="29">
				<p align="center">
					<b>삭제 여부</b></font>
				</p>
			</td>
		</tr>

		<%
			Connection conn = null;
			PreparedStatement prmt = null;
			ResultSet rs = null;

			try {
				String jdbcURL = "jdbc:mysql://localhost:3306/basicjsp";
				String dbid = "jspid";
				String dbpwd = "jspass";

				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcURL, dbid, dbpwd);
				String sql = "select * from book";
				prmt = conn.prepareStatement(sql);
				rs = prmt.executeQuery();
				int tr_bg = 1;
				while (rs.next()) {
					int numb = rs.getInt("num");
		%>
		<form name="form1" method="post" action="PrepareUpdate.jsp">
		<td width="167" height="38">
				<p align="center"><%=rs.getInt("num")%></p>
			</td>
			<td width="167" height="38">
				<p align="center"><%=rs.getString("name")%></p>
			</td>
			<td width="167" height="38">
				<p align="center"><%=rs.getString("writer")%></p>
			</td>
			<td width="167" height="38">
				<p align="center"><%=rs.getString("genre")%></p>
			</td>
			<td align="center">
			<input type="hidden"  name="number" value="<%=numb%>"> <input 
				type="submit" value="수정하기"
				style="color: white; background-color: navy; border-color: white; border-style: outset;">
			</td></form>
			<form name="form1" method="post" action="PrepareDelete.jsp">
			<td align="center"><input type="hidden" name="num" value="<%=numb%>"> <input
				type="submit" value="삭제하기"
				style="color: white; background-color: navy; border-color: white; border-style: outset;">
			</td>
			</form>
		
		</tr>
		<%
			tr_bg++;
				}
		%>

	</table>
	<p>&nbsp;</p>
	<%
		rs.close();
			conn.close();
		} catch (SQLException E) {
			out.println("다음과 같은 오류가 발생하였습니다. " + "<p>");
			out.println(E.toString());
		}
	%>
</body>
</html>