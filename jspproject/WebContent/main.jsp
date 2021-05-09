<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서관 도서 검색</title>
</head>
<body>
	<center>
		<b>도서 검색</b>
	</center>
	<p align="right"><%=session.getAttribute("id")%>님
		<input type="button" value="로그아웃" OnClick="location.href='logout.jsp'" />
	</p>
	<center>
	<form name="main" action="bookname.jsp" method="post">
		<table border="1" width="330" height="150" bgcolor=f7e091>
		<tr>
			<td >도서명</td>
			<td><input type="text" name="name"/>
			<input type="submit" value="도서명검색"/></td></form>
		</tr>
		<tr><form name="main" action="writer.jsp">
			<td>작가</td>
			<td><input type="text" name="writer"/>
			<input type="submit" value="작가검색"/></td></form>
		</tr>
		
		<tr><form name="main" action="genre.jsp">
			<td>장르</td>
			<td><select name="genre"/>
				<option value="a">로맨스</option>
				<option value="b">스릴러</option>
				<option value="c">액션</option>
				</select>
				<input type="submit" value="장르검색"/></td></form>
		</tr>		
	</table>
	




</body>
</html>