<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*, java.util.*"%>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 가입</title>
</head>
<body>
<center>
<h1>회 원 가 입</h1>
 <form method="post" action="signupdb.jsp">
	<table border="1" width="550" height="150" bgcolor=f7e091>
		<tr>
			<td>이 름</td>
			<td><input type="text" name="name"/></td>
		</tr>
		<tr>
			<td>성 별</td>
			<td><input type="radio" name="sex" value="남자" /> 남자
				<input type="radio" name="sex" value="여자" /> 여자
			</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="id"/></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" name="passwd"/></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" name="emailid"/>@
				<input type="text" name="emailadr"/></td>
		</tr>
		<tr>
			<td>핸드폰번호</td>
			<td><select name="phone"/>
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="018">018</option>
				</select> - <input type="text" name="midnum" size="6" /> - 
				<input type="text" name="endnum" size="6" /> </td>
		</tr>		
	</table>
	<br /> <input type="button" value="이전화면" onClick="window.location='home.jsp'" />
	<input type="submit" value="완료">
	
</form>

</center>

</body>
</html>