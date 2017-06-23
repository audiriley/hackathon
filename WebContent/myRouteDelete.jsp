<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
     <%@page import="java.text.*, java.sql.*" %>
    <%@page import="conn.ConnectionContext" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");
	try{
		Connection conn = null;
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/websysdb02","root","websys");
		Statement stmt = conn.createStatement();
		String sql = " delete from route2 where pj='"+request.getParameter("projectName")+"'";
		stmt.executeUpdate(sql);
		stmt.close();
	
	}
	catch(SQLException ex){
	out.write(ex.toString());
	}
%>
<script>
location.href="main.jsp";
</script>
</body>
</html>