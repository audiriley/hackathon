<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.io.File"%>
   
<%
 String path = application.getRealPath("/");
	 int size = 5*1024*1024 ;
	 MultipartRequest multi = new MultipartRequest(request,path, size, "EUC-KR", new DefaultFileRenamePolicy());
     File file = multi.getFile("photo");
     String fileName=file.getName(); //�̹��� ���
     
 	 String title = multi.getParameter("title");
 	 String content = multi.getParameter("content");
 	 String originalPath = application.getRealPath("/")+"\\"+fileName;
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style> 
	body{ align:center; text-align:center;}
	table{ border-collapse: collapse; border:1px solid black; margin:auto; height:500px; width:400px; }
	td{text-align:center; border:1px solid black;}
	.id{background-color:#f5f5f5};
	.col{width:300px;}
</style>
</head>
<body>
 �Խ��� ���
 <hr>
	<table>
	<tr>
		<td class="id">����</td><td>
		<input type="text" width="30" readonly value=<%= title%>>
	</tr>
	<tr>
		<td class="id">�������</td>
		<td>
		<img src=<%=fileName%> alt="lost" width="200" height="200">
		<%=originalPath%>
		</td>
	</tr>
	<tr>
		<td class="id">����</td>
		<td><textarea name="content" rows="20" cols="40" readonly><%= content%></textarea></td>
	</tr>
	</table>
	<hr>
</body>
</html>