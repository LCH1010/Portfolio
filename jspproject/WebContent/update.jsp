<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<title>수정</title>
</title>
</head>
<body>
	<%
		int num = Integer.parseInt(request.getParameter("num"));
		String name = request.getParameter("name");
		String writer = request.getParameter("writer");
		String genre = request.getParameter("genre");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String jdbcURL = "jdbc:mysql://localhost:3306/basicjsp";
		String dbid = "jspid";
		String dbpwd = "jspass";
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcURL, dbid, dbpwd);
		
		String sql = "UPDATE book SET name=?, writer=?, genre=? WHERE num=" + num;
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, writer);
		pstmt.setString(3, genre);
		try {
			int updated = pstmt.executeUpdate();
			conn.close();
		} catch (SQLException E) {
			out.println("다음과 같은 오류가 발생하였습니다. " + "<p>");
			out.println(E.toString());
			out.close();
		}
	%>
	<p align="center">
		<b>
	<script>
	alert("수정 완료 되었습니다.");
	</script>
	</b>
	<input type="button" value="뒤로가기" onClick="window.location='adminpage.jsp'" /></p>
</body>
</html>