<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="conn.ConnectionContext, java.util.*, java.sql.*, java.text.*"%> 
<%
	String memberId = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    
	<title>제주를 찾는 재주_main</title>

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

	<!-- navigation bar -->
	<ul style="font-family: 'Jeju Gothic'; font-size:13pt;">
	  <li onclick="check('main.jsp')"><a>제주를 찾는 재주</a></li>
	  <li onclick="check('routeDay.jsp')"><a>루트 만들기</a></li>
	  <li onclick="check('board.jsp')"><a>게시판</a></li>
	  <li onclick="check('myRoute.jsp')"><a>마이루트</a></li>
	 <% if(memberId == null){ %>
	 	<li onclick="document.getElementById('id01').style.display='block'" style="float:right"><a class="active" href="signUp.jsp">SIGN UP</a></li>
	  	<li style="float:right"><a class="active" href="loginConfirm.jsp">LOGIN</a></li>
	   <%}else{ %>
	   <li style="float:right"><a class="active" href="loginConfirm.jsp"><%=memberId%></a></li>
	   <%}%>
	</ul>

	<!-- image slider -->
	<div class="imageSlide" style="margin:auto; margin-top:15px;">
  		<div class="image" style="background-image:url('image/jeju3.jpg'); background-repeat: no-repeat;
  		 width:100%; height:500px; margin:auto; text-align:center;">	
    		<div class="content">
    			<h1><b>PLANNING A TRIP TO</b></h1>
   				<h1><b>JEJU ISLAND</b></h1>
   			</div>
 		 </div>
  		<%--
  		<div class="image" style="background-image:url('image/jeju2.JPG'); background-repeat: no-repeat;
  		 width:100%; height:500px; margin:auto; text-align:center;">	
  			<div class="content">
    			<h1><b>PLANNING A TRIP TO</h1>
   				<h1>JEJU ISLAND</b></h1>
   			</div>
   		</div>
   		--%>	 
	</div>
	
	

	<!-- 회원가입 모달창 -->
	<div id="id01" class="modal">
  	<span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
	  	<form class="modal-content animate" action="register.jsp" name="signUp">
	    	<div class="container" style="width:80%; margin-left:50px;">
	      		<label><b>ID</b></label><Br>
	      		<input type="text" placeholder="Enter Id" name="id" required><BUTTON class="checkButton" onClick="javascript:idCheck()">CHECK</BUTTON><Br>
	
	      		<label><b>Password</b></label><Br>
	      		<input type="password" placeholder="Enter Password" name="password" required><Br>
	
	      		<label><b>Repeat Password</b></label><Br>
	      		<input type="password" placeholder="Repeat Password" name="psw-repeat" required><Br>
	      		
	      		<label><b>Email</b></label><Br>
	      		<input type="text" placeholder="Enter Email" name="email" required>
	
	      		<div class="clearfix">
	        		<button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
	        		<button type="submit" class="signupbtn">Sign Up</button>
	      		</div>
	    	</div>
	  	</form>
	</div>
	
	
	
	
	<script>
		//image slider
		var myIndex = 0;
		carousel();
	
		function carousel() {
		    var i;
		    var x = document.getElementsByClassName("");
		    for (i = 0; i < x.length; i++) {
		       x[i].style.display = "none";  
		    }
		    myIndex++;
		    if (myIndex > x.length) {myIndex = 1}    
		    x[myIndex-1].style.display = "block";  
		    setTimeout(carousel, 3000); 
		}
	</script>
	
	<script>
		// signUp modal
		var modal = document.getElementById('signUpForm');
	
		window.onclick = function(event) {
		    if (event.target == modal) {
		        modal.style.display = "none";
		    }
		}
		
		function check(addr){
			<% if (memberId==null){%>
			alert("로그인 후 이용가능합니다.");
			location.href="login.jsp";
			<%}else{%>	
			location.href=""+addr;
			<%}%>
			
		}
		
	</script>
	
	
	
	<!-- jQuery -->
    <script src="js/jquery.js"></script>
	
	<!-- Footer -->
    <footer>
        <div class="row">
            <div class="col-lg-12" style="font-family:'Jeju Gothic';">
                <p>Copyright &copy; 웹시스템설계8조 정혜린 주예린 최수연</p>
            </div>
        </div>
    </footer>
	

</body>
</html>