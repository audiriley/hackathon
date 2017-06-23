<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
    
<%@ page import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.io.File"%>
<%@ page import="conn.ConnectionContext, java.util.*, java.sql.*, java.text.*"%> 
<%
	String memberId = (String)session.getAttribute("idKey");
	int count=0;
	Connection conn = ConnectionContext.getConnection();
	Statement stmt;
	try{
		conn = ConnectionContext.getConnection();
	// Statement 생성
		stmt = conn.createStatement();
	
	String sql = "SELECT COUNT(*) FROM board";
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()){
		count = rs.getInt(1);
	}
	if((String)session.getAttribute("idKey")=="admin"){
		 count=count+100;
	 }
	rs.close();
	stmt.close();
	}catch(SQLException ex){
		out.write(ex.toString());
	}

	String path = application.getRealPath("/");
	 int size = 5*1024*1024 ;
	 MultipartRequest multi = new MultipartRequest(request,path, size, "UTF-8", new DefaultFileRenamePolicy());
	 String title = multi.getParameter("title");
 	 String content = multi.getParameter("content");
 	 File file;
 	 String fileName=""; 
 	 String originalPath="";
	 try{
     file = multi.getFile("file");
     fileName=file.getName(); //이미지 경로
	 }catch(Exception e){
		file=null; 
	 }

	 
 try{
	 conn = ConnectionContext.getConnection();
	 stmt = conn.createStatement();
		String sql = "insert into board (id,priority,title,content,file) values ('"+memberId+"','"+count+"','"+title+"','"+content+"','"+fileName+"')";
		stmt.executeUpdate(sql);
		stmt.close();
	}catch(SQLException ex){
		out.write(ex.toString());
	}catch(Exception exce){
		out.write(exce.toString());
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<script>
	location.href="board.jsp";
	</script>
</body>
</html>