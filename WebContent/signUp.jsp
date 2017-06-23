<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ page import="conn.ConnectionContext, java.util.*, java.sql.*, java.text.*"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>signUp</title>

	<!-- css -->
	<link href="css/main.css" rel="stylesheet">
	<link href="css/signUp.css" rel="stylesheet">
	
	<!-- webFont -->
	<STYLE>
		@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
		@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
		h1 { font-family:'Hanna'; } //imageslider
	</STYLE>
	
</head>
<body>
<!-- 회원가입 모달창 -->

		<h1 style="text-align:center;">제주를 찾는 제주에 오신 것을 환영합니다!!</h1><br>
	  	<form name="signup" action="register.jsp" method="Post">
	    	<div class="container" style="width:60%; margin:auto; margin-top:50px;">
	      		<label><b>ID</b></label><Br>
				<input type="text" placeholder="Enter id" name="id" required><Br>
				
	      		<label><b>Password</b></label><Br>
	      		<input type="password" placeholder="Enter Password" name="password" required><Br>
	
	      		
	      		<label><b>Email</b></label><Br>
	      		<input type="text" placeholder="Enter Email" name="email" required>
	
	      		<div class="clearfix">
	        		<button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
	        		<button type="submit" class="signupbtn">Sign Up</button>
	      		</div>
	    	</div>
	  	</form>

</body>
</html>