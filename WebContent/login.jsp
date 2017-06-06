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
<div class="container">
<div class="col-lg-4"></div>
<div class="col-lg-4">
	<div class="jumbatron" style="padding-top:20px;">
		<form name="login" method="post" action="loginAction.jsp">  
    		<h3 style="text-align:center;">로그인</h3>
    		<table>
			<tr><td class="id">제목</td><td>
		<input type="text" class="form-control" placeholder="USER ID" name="id" maxlength="20">
	</tr>
	<tr>
		<td>내용</td>
		<td><input type="password" class="form-control" placeholder="USER PASSWORD" name="password" maxlength="20">s</td>
	</tr>
	</table>
     		<div class="form-group">
     			<input type="text" class="form-control" placeholder="USER ID" name="id" maxlength="20">
     		</div>
     		<div class="form-group">
     			<input type="password" class="form-control" placeholder="USER PASSWORD" name="password" maxlength="20">
     		</div>
	 		<input type="submit" class="btn btn-primary form-control" value="login">
  		</form>
	
	</div>
</div>


  </div>
<!--Login sheet-->
	
<!--------------------------------------------------혜린---------------------------------------------------- -->
</body>
</html>