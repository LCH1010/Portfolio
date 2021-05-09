<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*, java.util.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>로그인</title>
</head>
<body>
<%
String id = request.getParameter("id");
String pw = request.getParameter("passwd");

Connection conn = null;
PreparedStatement prmt = null;
ResultSet rs = null;

try{
	String jdbcURL = "jdbc:mysql://localhost:3306/basicjsp";
	String dbid = "jspid";
	String dbpwd = "jspass";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(jdbcURL, dbid, dbpwd);
	String sql = "select count(*)from admin where id='" + id + "' and passwd='" + pw + "'";
	prmt = conn.prepareStatement(sql);
	rs =  prmt.executeQuery();
	
	rs.next();
	int count = rs.getInt(1);
	if(count == 1)
	{
		session.setAttribute("id", id);
		response.sendRedirect("adminpage.jsp");
	}
	else
	{
%>
		<script>
			alert("아이디/비밀번호를 다시 확인해주세요");
			history.go(-1);
		</script>
<% 
	}
	
}catch(Exception e){
	e.printStackTrace();
	out.println("다음과 같은 오류가 발생하였습니다. " + "<p>");
	out.println(e.toString());
	out.close();
%>
	로그인 실패
<%
}
%>

</body>
</html>