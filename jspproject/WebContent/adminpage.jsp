
<%@ page contentType="text/html;charset=euc-kr" import="java.sql.*"%>
<html>
<body>
<p align="right"><%=session.getAttribute("id")%>��
		<input type="button" value="å �߰�" OnClick="location.href='insert.jsp'" />
		<input type="button" value="�α׾ƿ�" OnClick="location.href='logout.jsp'" />
	</p>
	<p align="center">
		<b><font>å ����</font></b>
	</p>
	<table align="center" border="1" cellpadding="1" cellspacing="0">
		<tr bgcolor=f7e091>
		<td height="29">
				<p align="center">
					<b>�۹�ȣ</b></font>
				</p>
			</td>
			<td height="29">
				<p align="center">
					<b>å �̸�</b></font>
				</p>
			</td>
			<td height="29">
				<p align="center">
					<b>�۰�</b></font>
				</p>
			</td>
			<td height="29">
				<p align="center">
					<b>�帣</b></font>
				</p>
			</td>
			<td height="29">
				<p align="center">
					<b>���� ����</b></font>
				</p>
			</td>
			<td height="29">
				<p align="center">
					<b>���� ����</b></font>
				</p>
			</td>
		</tr>

		<%
			Connection conn = null;
			PreparedStatement prmt = null;
			ResultSet rs = null;

			try {
				String jdbcURL = "jdbc:mysql://localhost:3306/basicjsp";
				String dbid = "jspid";
				String dbpwd = "jspass";

				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(jdbcURL, dbid, dbpwd);
				String sql = "select * from book";
				prmt = conn.prepareStatement(sql);
				rs = prmt.executeQuery();
				int tr_bg = 1;
				while (rs.next()) {
					int numb = rs.getInt("num");
		%>
		<form name="form1" method="post" action="PrepareUpdate.jsp">
		<td width="167" height="38">
				<p align="center"><%=rs.getInt("num")%></p>
			</td>
			<td width="167" height="38">
				<p align="center"><%=rs.getString("name")%></p>
			</td>
			<td width="167" height="38">
				<p align="center"><%=rs.getString("writer")%></p>
			</td>
			<td width="167" height="38">
				<p align="center"><%=rs.getString("genre")%></p>
			</td>
			<td align="center">
			<input type="hidden"  name="number" value="<%=numb%>"> <input 
				type="submit" value="�����ϱ�"
				style="color: white; background-color: navy; border-color: white; border-style: outset;">
			</td></form>
			<form name="form1" method="post" action="PrepareDelete.jsp">
			<td align="center"><input type="hidden" name="num" value="<%=numb%>"> <input
				type="submit" value="�����ϱ�"
				style="color: white; background-color: navy; border-color: white; border-style: outset;">
			</td>
			</form>
		
		</tr>
		<%
			tr_bg++;
				}
		%>

	</table>
	<p>&nbsp;</p>
	<%
		rs.close();
			conn.close();
		} catch (SQLException E) {
			out.println("������ ���� ������ �߻��Ͽ����ϴ�. " + "<p>");
			out.println(E.toString());
		}
	%>
</body>
</html>