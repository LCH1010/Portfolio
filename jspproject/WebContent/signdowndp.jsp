<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.sql.*, java.util.*"%>

<%  
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
String name = request.getParameter("name");
String sex = request.getParameter("sex");
String id = request.getParameter("id");
String pw = request.getParameter("passwd");
String emailid = request.getParameter("emailid");
String emailadr = request.getParameter("emailadr");
String phone = request.getParameter("phone");
String midnum = request.getParameter("midnum");
String endnum = request.getParameter("endnum");

Connection conn = null;
PreparedStatement Pstmt = null;
ResultSet rs = null;

try {

String jdbcURL = "jdbc:mysql://localhost:3306/basicjsp";
String dbid = "jspid";
String dbpwd = "jspass";

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(jdbcURL, dbid, dbpwd);

String sql = "select id,passwd from member where id= ?";
Pstmt = conn.prepareStatement(sql);
Pstmt.setString(1, id);
rs = Pstmt.executeQuery();

if(rs.next()){
	String rid=rs.getString("id");
	String rpw=rs.getString("passwd");
	if(id.equals(rid) && pw.equals(rpw)){
		sql="delete from member where id=?";
		Pstmt = conn.prepareStatement(sql);
		Pstmt.setString(1, id);
		Pstmt.executeUpdate();
		%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원탈퇴</title>
</head>
<body>
<script>
alert("탈퇴되었습니다.");
history.go(-2);
</script>
</body>
</html>
<% 
} else
	%>
	<!-- <script>
	alert("비밀번호를 확인하세요");
	history.go(-1);
	</script> -->
	<%
}else
	%>
	<!-- <script>
	alert("아이디를 확인하세요");
	history.go(-1);
	</script> -->
	<%

} catch (SQLException E) {
out.println("다음과 같은 오류가 발생하였습니다. " + "<p>");
out.println(E.toString());
out.close();
}
%>


