<%@ page import="java.util.*" %>
<%@ page import="conn.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%String memberId= (String)session.getAttribute("idKey"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제주를찾는재주_myRoute</title>

	<!-- css -->
	<link href="css/main.css" rel="stylesheet">
	<link href="css/myRoute.css?ver=7" rel="stylesheet">
	
	<!-- webFont -->
	<STYLE>
		@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
		h2,h5,h3,h6,h1{
			font-family: 'Jeju Gothic';
			text-align : center;
		}
	</STYLE>
	
</head>
<body>
	
<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String a = null;
String b = null;
String c = null;
%>
<%      //디비에서 유저의 프로젝트1, 프로젝트2, 프로젝트 3을 각각 a,b,c에 저장합니다
        try{       
        	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/websysdb02","root","websys");
			//conn = ConnectionContext.getConnection();
			// Statement 생성
			stmt = conn.createStatement();
			String strSQL = "SELECT pj FROM route where id='"+memberId+"' and pjNum=1";
			rs = stmt.executeQuery(strSQL);
			while(rs.next()){
				a = rs.getString(1);
			}
			String strSQL2 = "SELECT pj FROM route where id='"+memberId+"' and pjNum=2";
			rs = stmt.executeQuery(strSQL2);
			while(rs.next()){
				b = rs.getString(1);
			}
			String strSQL3 = "SELECT pj FROM route where id='"+memberId+"'  and pjNum=3";
			rs = stmt.executeQuery(strSQL3);
			while(rs.next()){
				c = rs.getString(1);
			}
			rs.close();
			stmt.close();
			conn.close();

%>

<%
}catch(SQLException ex){ 

%>

<%

}

%>
	
<!-- ----------------저장된 프로젝트만 출력됩니다 최대3---------------------------------------------- -->

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
	
	<!-- image-->
	<img src ="image/myroute.JPG" style="height:80px; margin-left: auto; margin-right: auto; margin-top: 20px; display: block;">
	<h2>MY JEJU</h2>
	<h5>'제주를 찾는 재주'를 통해 저장했던 나의 모든 루트들을 확인 그리고 삭제할 수 있습니다.</h5>
	
	<!-- 삭제 -->
	
		<table>
		<tr>
		<td>
		<%if(a!=null){ %>
		<form name="pjName" id="pjName" action="myRouteDelete.jsp" method="post">
			<input type="text" id="project1" name="projectName" value="<%=a%>" style="float:left; margin-left:150px; color:white;">
			<input TYPE="IMAGE" src="image/delete.JPG" style="width:50px;height:55px; float:left;" name="Submit" value="삭제">
		</form>
		<%
		}
		%>
		</td>
		<Td>
		<%if(b!=null){ %>
		<form name="pjName" id="pjName" action="myRouteDelete.jsp" method="post">
			<input type="text" id="project1" name="projectName" value="<%=b%>" style="float:center; margin-left:150px;">
			<input TYPE="IMAGE" src="image/delete.JPG" style="width:50px; height:55px; float:center; margin-right:200px;" name="Submit" value="삭제">
		</form>
		<%
		}
		%>
		</Td>
		
		
		
<!-- -----------------마이루트출력--------------------------- -->		
	<div class="box">
		
		<div class="pagination">
  			<a href="#" style="font-size:35pt; color:#777;">❮</a>
		</div>	
		
		<%if(a!=null){ %>
		<form name="pjName" id="pjName" action="showRoute.jsp" method="post">
		<div class="gallery">
	    		<img src="image/routeEx1pic.JPG" >
	 		<div class="desc" style="font-family: 'Jeju Gothic'; font-size:13pt;">
	 		TRIP NAME : <input type="text" id="project1" name="projectName" value="<%=a%>" style="font-family: 'Jeju Gothic'; font-size:15pt;"><BR><BR>
	 		<input TYPE="IMAGE" src="image/showRoute.JPG" style="width:60px;height:55px; float:right;" name="Submit" value="보기">
	 		</div>
		</div>
		</form>
		
		<%
		}
		%>
		
		<% if(b!=null){ %>
		<form name="pjName" id="pjName" action="showRoute.jsp" method="post">
		<div class="gallery">
	    		<img src="image/routeEx2.JPG" >
	 		<div class="desc" style="font-family: 'Jeju Gothic'; font-size:13pt;">
	 		TRIP NAME : <input type="text" id="project1" name="projectName" value="<%=b%>" style="font-family: 'Jeju Gothic'; font-size:15pt;"><BR><BR>
	 		<input TYPE="IMAGE" src="image/showRoute.JPG" style="width:60px;height:55px; float:right;" name="Submit" value="보기">
	 		</div>
		</div>
		</form>
		<%
		}
		%>
		
		
		<% if(c!=null){
		%>
		<form name="pjName" id="pjName" action="myRouteDelete.jsp" method="post">
		<div class="gallery2">
	 		<input type="text" id="project1" name="projectName" value="<%=a%>" style="font-family: 'Jeju Gothic'; font-size:15pt;"><BR><BR>
			<input TYPE="IMAGE" src="image/showRoute.JPG" style="width:60px;height:55px; float:right;" name="Submit" value="보기">
		</div>
		</form>
		<%
		}
		%>
		
		
		
		
		<div class="pagination">
  			<a href="#" style="font-size:35pt; color:#777;">❯</a>
		</div>
	</div>
	
<script>
function check(addr){
	<% if (memberId==null){%>
	alert("로그인 후 이용가능합니다.");
	location.href="login.jsp";
	<%}else{%>	
	location.href=""+addr;
	<%}%>
	
}



</script>

</body>
</html>