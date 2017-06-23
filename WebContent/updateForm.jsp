<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="conn.ConnectionContext, java.util.*, java.sql.*, java.text.*"%> 
 <%@ page import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.io.File"%> 
<%
	String memberId = (String)session.getAttribute("idKey");
	String title= request.getParameter("title");
	String content=null;
	String file=null;
try{
	Connection conn = ConnectionContext.getConnection();
	// Statement 생성

	Statement stmt = conn.createStatement();
	String sql = "SELECT * FROM  board where TITLE='"+title+"'" ;
	ResultSet rs = stmt.executeQuery(sql);

	while(rs.next()){
		content= rs.getString("content");
		file= rs.getString("file");
	}
	rs.close();
	stmt.close();
	}catch(SQLException ex){
		out.write(ex.toString());
	}

%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>제주를찾는재주_boardWrite</title>

	<!-- css -->
	<link href="css/main.css" rel="stylesheet">
	<link href="css/boardWrite.css" rel="stylesheet">
	
	<!-- webFont -->
	<STYLE>
		@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
		h3,h6{
			font-family: 'Jeju Gothic';
			text-align : center;
		}
	</STYLE>
	
	<!-- 제이쿼리 -->
    <link  href="resources/jqueryui/css/ui-lightness/jquery-ui-1.8.16.custom.css" rel="stylesheet">
	<script src="resources/jqueryui/js/jquery-ui-1.8.16.custom.min.js"></script>	    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	
	
	<!-- 인풋필드효과 -->
	

</head>
<body>
	<!-- navigation bar -->
	<ul style="font-family: 'Jeju Gothic'; font-size:13pt;">
	  <li><a href="main.jsp">제주를 찾는 재주</a></li>
	  <li><a href="routeDay.jsp">루트 만들기</a></li>
	  <li><a class="active" href="board.jsp">게시판</a></li>
	  <li><a href="myRoute.jsp">마이루트</a></li>
	  <% if(memberId == null){ %>
	 	 <li onclick="document.getElementById('id01').style.display='block'" style="float:right"><a class="active" href="#">SIGN UP</a></li>
	  	<li style="float:right"><a class="active" href="loginConfirm.jsp">LOGIN</a></li>
	   <%}else{ %>
	   <li style="float:right"><a class="active" href="loginConfirm.jsp"><%=memberId%></a></li>
	   <%} %>
	</ul>
	
	<img src ="image/boardShare.JPG" style="height:80px; margin-left: auto; margin-right: auto; margin-top: 20px; display: block;">
	<h3>우리의 제주 이야기 함께 공유해요!</h3>
	<h6>당신의 제주도 여행에 대해 들려주세요 홍보글은 자동으로 삭제됩니다.</h6>

	<!-- 글쓰는곳 -->
	<div class="box">
		<form  action="boardUpdate.jsp" method="post"> 
		<div class="textbox">
	  		<input type="text" id="ex_input" readonly style="font-family: 'Jeju Gothic';"  name="title" value="<%= title%>" >
		</div>
		<textarea placeHolder="CONTENT" style="font-family: 'Jeju Gothic';" name="content" ><%=content%></textarea>
		<div class="file_input" style="align:center; border:3px solid black; width:83%; margin:auto;">
		       <img src="<%=file%>" alt="lost" width="200" height="200">
		       <input type="hidden" name="file" value="<%=file%>">
		 </div>
		 
		 </form>
	</div>

</body>
</html>