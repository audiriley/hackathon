<%@ page language="java" contentType="text/html; charset=UTF-8" %>
 <%@page import="java.text.*, java.sql.*" %>
 <%@page import="java.util.Date" %>
 <%@ page import="conn.ConnectionContext" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		h2,h5,h3,h6{
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
	<script>
	$(document).ready(function() {
		  var placeholderTarget = $('.textbox input[type="text"], .textbox input[type="password"]');
		  
		  //포커스시
		  placeholderTarget.on('focus', function(){
		    $(this).siblings('label').fadeOut('fast');
		  });

		  //포커스아웃시
		  placeholderTarget.on('focusout', function(){
		    if($(this).val() == ''){
		      $(this).siblings('label').fadeIn('fast');
		    }
		  });

	});
	</script>
	
</head>
<body>
	<!-- navigation bar -->
	<ul style="font-family: 'Jeju Gothic'; font-size:13pt;">
	  <li><a href="main.jsp">제주를 찾는 재주</a></li>
	  <li><a href="routeDay.jsp">루트 만들기</a></li>
	  <li><a class="active" href="board.jsp">게시판</a></li>
	  <li><a href="myRoute.jsp">마이루트</a></li>
	  <li onclick="document.getElementById('id01').style.display='block'" style="float:right"><a class="active" href="#">SIGN UP</a></li>
	  <li style="float:right"><a class="active" href="#about">LOGIN</a></li>
	</ul>
	
	<img src ="image/boardShare.JPG" style="height:80px; margin-left: auto; margin-right: auto; margin-top: 20px; display: block;">
	<h2>우리의 제주 이야기 함께 공유해요!</h2>
	<h5>당신의 제주도 여행에 대해 들려주세요 홍보글은 관리자에 의해 삭제됩니다.</h5>
	
	<%
request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String file = request.getParameter("file");
	try{
		Connection conn = null;
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/websysdb02","root","websys");
		Statement stmt = conn.createStatement();
		String sql = "update board set title='"+title+"',content='"+content+"',file='"+file+"'"+"where title='"+request.getParameter("title")+"'";
		stmt.executeUpdate(sql);
		stmt.close();
	
	}
	catch(SQLException ex){
	out.write(ex.toString());
	}
%>
<script>
location.href="board.jsp";
</script>
</body>
</html>