<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<title>데이터베이스 검색</title>
</head>
<body>
	<p align="center">
		<b>책 정보 수정</b>
	</p>
	<%
		int num = Integer.parseInt(request.getParameter("number"));

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String imagenull = "";
		try {
			String jdbcURL = "jdbc:mysql://localhost:3306/basicjsp";
			String dbid = "jspid";
			String dbpwd = "jspass";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcURL, dbid, dbpwd);

			String sql = "SELECT * FROM book WHERE num = '" + num + "'";

			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
	%>
	<form name="form1" method="post" action="update.jsp">
		<table bgcolor=f7e091 align="center" border="1" cellpadding="1" cellspacing="0"
			width="60%">
			<tr>
				<td height="29">
					<p align="center">
						<font class="pp"><b>책 제목</b></font>
					</p>
				</td>
				<td height="29">
					<p align="center">
						<input type="text" name="name"
							value="<%=rs.getString("name")%>">
					</p>
				</td>
			</tr>
			<tr>
				<td height="29">
					<p align="center">
						<font class="pp"><b>작가</b></font>
					</p>
				</td>
				<td height="29">
					<p align="center">
						<input type="text" name="writer"
							value="<%=rs.getString("writer")%>">
					</p>
				</td>
			</tr>
			<tr>
				<td height="29">
					<p align="center">
						<font class="pp"><b>장르</b></font>
					</p>
				</td>
				<td height="29">
					<p align="center">
						<input type="text" name="genre"
							value="<%=rs.getString("genre")%>">
					</p>
				</td>
			</tr>
			<tr>
				
				<td colspan="2" align="center"><input type="hidden" name="num" value="<%=num%>">
					<input type="submit" value="수정하기"
					style="color: white; background-color: navy; border-color: white; border-style: outset;">
					<input type="button" value="취소" onClick="window.location='adminpage.jsp'"
					style="color: white; background-color: navy; border-color: white; border-style: outset;"/>
				</td>
				</form>
			</tr>
			<%
				} else {
						out.println("<b> 해당 레코드가 없습니다. </b>");
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