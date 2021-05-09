<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*, java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>Insert title here</title>
</head>
<body>

	<%
		String name = request.getParameter("name");
		String writer = request.getParameter("writer");
		String genre = request.getParameter("genre");

		ResultSet rs = null;

		try {
			Connection conn = null;
			String jdbcURL = "jdbc:mysql://localhost:3306/basicjsp";
			String dbid = "jspid";
			String dbpwd = "jspass";

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcURL, dbid, dbpwd);

			PreparedStatement Pstmt = null;
			String sql = "select count(*) from book where name='" + name + "'";
			Pstmt = conn.prepareStatement(sql);
			rs = Pstmt.executeQuery();
			rs.next();

			int count = rs.getInt(1);
			if (count == 1) {
	%>
	<script>
		alert("이미 등록된 책입니다.");
	</script>
	<p align="center">
	<input type="button" value="뒤로가기" onClick="window.location='adminpage.jsp'" /></p>
	<%
		} else {
				Pstmt = null;
				sql = "INSERT INTO book(name, writer, genre)";
				sql = sql + "VALUES(?, ?, ?)";
				Pstmt = conn.prepareStatement(sql);
				Pstmt.setString(1, name);
				Pstmt.setString(2, writer);
				Pstmt.setString(3, genre);

				int inserted = Pstmt.executeUpdate();
				conn.close();
	%>
	<script>
		alert("책이 추가되었습니다.");
	</script>
	<p align="center">
	<input type="button" value="뒤로가기" onClick="window.location='adminpage.jsp'" /></p>
	<%
	
		}
		} catch (SQLException E) {
			out.println("다음과 같은 오류가 발생하였습니다. " + "<p>");
			out.println(E.toString());
			out.close();
		}
	%>


</body>
</html>