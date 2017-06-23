<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="conn.ConnectionContext, java.util.*, java.sql.*, java.text.*"%> 
  

<%
	String memberId = (String)session.getAttribute("idKey");
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
	<script>

	function check(){
		<%if(memberId == null){%>
			alert("로그인 후 이용 가능합니다.")
			location.href="login.jsp";
			return false;
		<%}%>
		if(writeForm.title.value==""){
			alert("제목을 입력하세요");
			return false;
		}
		if(writeForm.content.value==""){
			alert("내용을 입력하세요.");
			return false;
		}
	}

</script>
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
<form name="writeForm" action="writeAction.jsp" method="Post" onsubmit="return check()" enctype="multipart/form-data">
	<!-- 글쓰는곳 -->
	<div class="box">
		<div class="textbox">
	    	<label for="ex_input" style="font-family: 'Jeju Gothic';">TITLE</label>
	  		<input type="text" id="ex_input" style="font-family: 'Jeju Gothic';" name="title">
		</div>
		<textarea placeHolder="CONTENT" style="font-family: 'Jeju Gothic';" name="content"></textarea>
		<div class="file_input">
		    <label style="font-family: 'Jeju Gothic';">
		        File Attach
		        <input type="file" multiple="multiple" name="file">
		    </label>
		    <input type="text" readonly="readonly" title="File Route">
		 </div>
		 <button class="button" style="font-family: 'Jeju Gothic';">SUBMIT</button>
	</div>

    <script>
	    $('.file_input input[type=file]').change(function() {
		    var fileName = $(this).val();
		    var fileCount = $(this).get(0).files.length;
		    if($(this).get(0).files.length == 1){
		        $('.file_input input[type=text]').val(fileName);
		    }
		    else {
		        $('.file_input input[type=text]').val('파일 '+fileCount+'개');
		    }
		});
	</script>
  </form>

</body>
</html>