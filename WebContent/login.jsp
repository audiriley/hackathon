<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import=" java.text.*, java.sql.*" %>

<%
	String memberId = (String)session.getAttribute("idKey");
	request.setCharacterEncoding("UTF-8");
	String id = (String) session.getAttribute("idKey");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="UTF-8">
   
	<!-- css -->
	<link href="css/main.css" rel="stylesheet">
	<link href="css/signUp.css" rel="stylesheet">
	<!-- webFont -->
	<STYLE>
		@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
		@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
		h1 { font-family:'Hanna'; } //imageslider
	</STYLE>
	

	 <!--------------------------------------------------혜린---------------------------------------------------- -->
<style>
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
		h3,h6{
			font-family: 'Jeju Gothic';
			text-align : center;
		}


@import url("css/login.css");
</style>
<script src="js/login.js">
//혜린_삽입 
</script> 


 <!--------------------------------------------------혜린---------------------------------------------------- -->
</head>
<body>
   
            <!-- Collect the nav links, forms, and other content for toggling -->
           
      <ul style="font-family: 'Jeju Gothic'; font-size:13pt;">
	  <li><a href="main.jsp">제주를 찾는 재주</a></li>
	  <li><a href="routeDay.jsp">루트 만들기</a></li>
	  <li><a class="active" href="board.jsp">게시판</a></li>
	  <li><a href="myRoute.jsp">마이루트</a></li>
	  <% if(memberId == null){ %>
	 	 <li onclick="document.getElementById('id01').style.display='block'" style="float:right"><a class="active" href="register.jsp">SIGN UP</a></li>
	  	<li style="float:right"><a class="active" href="loginConfirm.jsp">LOGIN</a></li>
	   <%}else{ %>
	   <li style="float:right"><a class="active" href="loginConfirm.jsp"><%=memberId%></a></li>
	   <%} %>
	</ul>
 <!--------------------------------------------------혜린---------------------------------------------------- -->
 <!--Login sheet-->
<div class="file_input">

		<h1 style="text-align:center;">제주를 찾는 재주 회원님, 로그인 해주세요!</h1><br>
	  	<form name="login" action="loginAction.jsp" method="Post">
	    	<div class="container" style="width:60%; margin:auto; margin-top:50px;">
	      		<label><b>ID</b></label><Br>
				<input type="text" class="form-control" placeholder="USER ID" name="id" maxlength="20" style="margin:auto;">
	      		<label><b>Password</b></label><Br>
	      		<input type="password" class="form-control" placeholder="USER PASSWORD" name="password" maxlength="20">
	      		<div class="clearfix">
	        		<input type="submit" class="signupbtn" value="login"  style="width:100%; margin-top : 10px; height : 3em;">
	      		</div>
	    	</div>
	  	</form>

		
	
	</div>

	
<!--------------------------------------------------혜린---------------------------------------------------- -->
</body>
</html>