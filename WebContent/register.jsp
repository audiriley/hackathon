
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@page import="java.text.*, java.sql.*" %>
 <%@page import="java.util.Date" %>
 <%@ page import="conn.ConnectionContext, conn.Member" %>
<!doctype html>
<html>
 
<meta charset="UTF-8"/>
<head>
</head>
<body>
<%
 try{
	 request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	
	
	Connection conn = ConnectionContext.getConnection();
	
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/websysdb02","root","websys");
	// Statement 생성

	Statement stmt = conn.createStatement();
	String sql = "insert into member (ID,name,password,email) values ('"+id+"','"+id+"','"+password+"','"+email+"')";
	
	stmt.executeUpdate(sql);  
	stmt.close();
	}catch(SQLException ex){
		out.write(ex.toString());
	}
%>
<script>
location.href="main.jsp";
</script>
</body>
</html>