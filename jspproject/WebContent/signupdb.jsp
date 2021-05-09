<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.sql.*, java.util.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>Insert title here</title>
</head>
<body>

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

ResultSet rs = null;

try {
Connection conn = null;
String jdbcURL = "jdbc:mysql://localhost:3306/basicjsp";
String dbid = "jspid";
String dbpwd = "jspass";

Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(jdbcURL, dbid, dbpwd);


PreparedStatement Pstmt = null;
String sql = "select count(*) from member where id='" + id + "'";
Pstmt = conn.prepareStatement(sql);
rs =  Pstmt.executeQuery();
rs.next();

int count = rs.getInt(1);
if(count == 1)
{
%>
<script>
alert("이미 등록된 ID입니다.");
history.go(-1);
</script>
<% 
}
else
{
Pstmt = null;
sql = "INSERT INTO member(name, sex, id, passwd, emailid, emailadr,phone, midnum,endnum,reg_date)";
sql = sql + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, now())";
Pstmt = conn.prepareStatement(sql);
Pstmt.setString(1, name);
Pstmt.setString(2, sex);
Pstmt.setString(3, id);
Pstmt.setString(4, pw);
Pstmt.setString(5, emailid);
Pstmt.setString(6, emailadr);
Pstmt.setString(7, phone);
Pstmt.setString(8, midnum);
Pstmt.setString(9, endnum);


int inserted = Pstmt.executeUpdate();
conn.close();
%>
<script>
alert("회원가입이 완료되었습니다.");
history.go(-2);
</script>
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