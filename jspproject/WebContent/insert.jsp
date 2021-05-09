<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*, java.util.*"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서 추가</title>
</head>
<body>
<center>
<h1>도 서 추 가</h1>
 <form method="post" action="insertdb.jsp">
	<table border="1" width="450" height="150" bgcolor=f7e091>
		<tr>
			<td>책제목</td>
			<td><input type="text" name="name"/></td>
		</tr>
		<tr>
			<td>작 가</td>
			<td><input type="text" name="writer"/></td>
		</tr>
		<tr>
			<td>장 르</td>
			<td><select name="genre"/>
				<option value="로맨스">로맨스</option>
				<option value="스릴러">스릴러</option>
				<option value="액션">액션</option></td>
		</tr>
		
		
	</table>
	<br /> <input type="button" value="이전화면" onClick="window.location='adminpage.jsp'" />
	<input type="submit" value="완료">
	
</form>

</center>

</body>
</html>