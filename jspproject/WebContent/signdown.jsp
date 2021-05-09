<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*, java.util.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<h1>회 원 탈 퇴</h1>
<form action = "signdowndp.jsp" method="post" >
	ID <input type="text" name="id" /><br /><br />
	PW <input type="password" name="passwd" /><br /><br />
	<input type="button" value="이전화면" onClick="window.location='home.jsp'" />
	<input type="submit" value="회원탈퇴"/>
</form>
</center>
</body>
</html>