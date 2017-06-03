<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" import=" java.text.*, java.sql.*" %>

<%
	request.setCharacterEncoding("EUC-KR");
	String id = (String) session.getAttribute("idKey");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>루트(1.일정)</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">

	 <!--------------------------------------------------혜린---------------------------------------------------- -->
<style>
@import url("css/login.css");
</style>
<script src="js/login.js">
//혜린_삽입 
</script> 


 <!--------------------------------------------------혜린---------------------------------------------------- -->
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="main.jsp">제주를 찾는 재주</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="route_day.jsp">루트</a>
                    </li>
                    <li>
                        <a href="datepicker.jsp">게시판</a>
                    </li>
                    <li>
                        <a href="contact.html">마이 루트</a>
                    </li>
 <!--------------------------------------------------혜린---------------------------------------------------- --> 
					<li>
                        <a href="loginForm.jsp">로그인</a>
                    </li>
<!--------------------------------------------------혜린---------------------------------------------------- -->  
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
 <!--------------------------------------------------혜린---------------------------------------------------- -->
<%if (id != null) {%>
<script>
	  String call= confirm("<b>"+<%=id%>+"</b>님 반갑습니다.<br>여행을 마치시겠습니까?");
	  if(call)
	  	location.href="logout.jsp";
	  else
		  location.href="main.jsp";
</script>
<%} else {%>
<!--Login sheet-->
	<form name="login" method="post" action="login.jsp">  
    	<table id="table" >
     	 <tr><td cols="2"><b>User ID</b><input type="text" placeholder="Enter Username" name="id" required value=""></td></tr>
     	 <tr><td cols="2"><b>Password</b><input type="password" placeholder="Enter Password" name="pass" required value=""></td></tr>
		 <tr><td ><button type="reset" id="cancel">Cancel</button><button type="submit" id="login">Login</button></td></tr>
	</table>
  </form>
  	<%}%>
<!--------------------------------------------------혜린---------------------------------------------------- -->
</body>
</html>