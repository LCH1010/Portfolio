<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<title>데이터베이스 삭제</title>
</title>
</head>
<body>

	<%
		int num = Integer.parseInt(request.getParameter("num"));
		String numm = num+"";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String jdbcURL = "jdbc:mysql://localhost:3306/basicjsp";
		String dbid = "jspid";
		String dbpwd = "jspass";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcURL, dbid, dbpwd);

		
		String sql="delete from book where num=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);

		int delete = pstmt.executeUpdate();

		try {
			
			//int deleted = pstmt.executeUpdate();
			conn.close();
		} catch (SQLException E) {
			out.println("다음과 같은 오류가 발생하였습니다. " + "<p>");
			out.println(E.toString());
			out.close();
		}
	%>
	<script>
	alert("삭제 완료 되었습니다.");
	</script>
	<p align="center">
		<input type="button" value="뒤로가기" onClick="window.location='adminpage.jsp'" />
	</p>
</body>
</html>