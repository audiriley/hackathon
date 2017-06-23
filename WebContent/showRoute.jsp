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
<title>제주를 찾는 제주_showRoute</title>

	<!-- css -->
	<link href="css/main.css" rel="stylesheet">
	<link href="css/showRotue.css?ver=3" rel="stylesheet">
	
	<!-- webFont -->
	<STYLE>
		@import url(//fonts.googleapis.com/earlyaccess/hanna.css);
		@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
		h2,h5,h3,h6,h1{
			font-family: 'Jeju Gothic';
			text-align : center;
		}
		td{
			padding-top: 10px;
			padding-bottom: 10px;
		}
	</STYLE>
	
</head>
<body>

	<!-- navigation bar -->
	<ul style="font-family: 'Jeju Gothic'; font-size:13pt;">
	  <li><a href="main.jsp">제주를 찾는 재주</a></li>
	  <li><a href="routeDay.jsp">루트 만들기</a></li>
	  <li><a href="board.jsp">게시판</a></li>
	  <li onclick="check()"><a href="myRoute.jsp">마이루트</a></li>
	 <% if(memberId == null){ %>
	 	<li onclick="document.getElementById('id01').style.display='block'" style="float:right"><a class="active" href="signUp.jsp">SIGN UP</a></li>
	  	<li style="float:right"><a class="active" href="loginConfirm.jsp">LOGIN</a></li>
	   <%}else{ %>
	   <li style="float:right"><a class="active" href="loginConfirm.jsp"><%=memberId%></a></li>
	   <%}%>
	</ul>
	
	<% 
		ServletContext context = request.getSession().getServletContext();
		request.setCharacterEncoding("UTF-8"); //받아올 데이터의 인코딩
		String selectPj = request.getParameter("projectName"); //마이루트에서 받아온 프로젝트의 이름 string값입니다
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String date1 = null;
	%>
	
	<!-- image-->
	<img src ="image/myroute.JPG" style="height:80px; margin-left: auto; margin-right: auto; margin-top: 20px; display: block;">
	<h2>MY JEJU</h2>
	<h3>TRIP NAME : <%=selectPj %></h3>	<!-- 선택한 프로젝트 이름이 출력 -->
	
	<!---------------------------------------------- DAY1부분 --------------------------------------------------->
	<img src = "image/day1pic.JPG" style="width:900px; height:auto; margin-left:270px;">
	<br>	
	<table style="font-family: 'Jeju Gothic'; float:left; margin-left:200px; text-align:center;">
			<tr>
				<Td width="50px" style="border-bottom:1.5px solid #ff7473;">DATE</Td>
				<td width="70px" style="border-bottom:1.5px solid #ff7473;">PLACE</td>
				<td width="40px" style="border-bottom:1.5px solid #ff7473;">TIME</td>
			</tr>

<%      
        try{       
        	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/websysdb02","root","websys");
			//conn = ConnectionContext.getConnection();
			// Statement 생성
			stmt = conn.createStatement();
			%>
			<!-------------------------day1시작---------------------------------------->
			<%
			String strSQL = "SELECT * FROM route where pj='"+selectPj+"' and dateNum=0";
			rs = stmt.executeQuery(strSQL);%>
			
			<% for(int i=0;rs.next();i++){
			%>
			<TR>
				<TD><%=rs.getString("date") %></TD>
				<TD><%=rs.getString("place") %></TD>
				<TD><%=rs.getString("time") %></TD>
			</TR>
			</table>
			
				<%if(i!=2) {%>	
					<table style="font-family: 'Jeju Gothic'; float:left; margin-left:60px; text-align:center;">
					<tr>
						<Td width="50px" style="border-bottom:1.5px solid #ff7473;">DATE</Td>
						<td width="70px" style="border-bottom:1.5px solid #ff7473;">PLACE</td>
						<td width="40px" style="border-bottom:1.5px solid #ff7473;">TIME</td>
					</tr>
					<%
				} 
			}
			%>
			</table>
			<!-- -------------------day1 date,time,place출력끝 -->
			
			<table style="font-family: 'Jeju Gothic'; float:left; margin-left:250px; text-align:center;">
			<tr>
				<Td width="60px" style="border-bottom:1.5px solid #ff7473;">하늘상태</Td>
				<td width="60px" style="border-bottom:1.5px solid #ff7473;">기온</td>
				<td width="60px" style="border-bottom:1.5px solid #ff7473;">강수확률</td>
			</tr>
			<%
			String strSQL11 = "SELECT * FROM route where pj='"+selectPj+"' and dateNum=0";
			rs = stmt.executeQuery(strSQL11);%>
			
			<% for(int i=0;rs.next();i++){
			%>
			<TR>
				<TD><%=rs.getString("sky") %></TD>
				<TD><%=rs.getString("TH3") %></TD>
				<TD><%=rs.getString("POP") %></TD>
			</TR>
			</table>
			
				<%if(i!=2) {%>	
					<table style="font-family: 'Jeju Gothic'; float:left; margin-left:170px; margin-right:20px; text-align:center;">
					<tr>
						<Td width="60px" style="border-bottom:1.5px solid #ff7473;">하늘상태</Td>
						<td width="60px" style="border-bottom:1.5px solid #ff7473;">기온</td>
						<td width="60px" style="border-bottom:1.5px solid #ff7473;">강수확률</td>
					</tr>
					<%
				} 
			}
			%>
			</table>
			
			<!-- --------------------------------------DAY1끝--------------------------------------- -->		
			
			<!-- --------------------------DAY2부분 -------------------------------------->
			<%
			String strSQL2 = "SELECT * FROM route where pj='"+selectPj+"' and dateNum=1";
			rs = stmt.executeQuery(strSQL2);
			
			if(rs!=null && rs.isBeforeFirst()){ //day3 경로가 있으면 출력하고 없으면 skip
			
			%>
				<img src = "image/day2pic.JPG" style="width:900px; height:auto; margin-left:270px; margin-top : 30px;">
				<br>	
				<table style="font-family: 'Jeju Gothic'; float:left; margin-left:200px; text-align:center;">
				<tr>
					<Td width="50px" style="border-bottom:1.5px solid #ffc952;">DATE</Td>
					<td width="70px" style="border-bottom:1.5px solid #ffc952;">PLACE</td>
					<td width="40px" style="border-bottom:1.5px solid #ffc952;">TIME</td>
				</tr>
				
				<% for(int i=0;rs.next();i++){
			%>
			<TR>
				<TD><%=rs.getString("date") %></TD>
				<TD><%=rs.getString("place") %></TD>
				<TD><%=rs.getString("time") %></TD>
			</TR>
			</table>
			
				<%if(i!=2) {%>	
					<table style="font-family: 'Jeju Gothic'; float:left; margin-left:80px; text-align:center;">
					<tr>
						<Td width="50px" style="border-bottom:1.5px solid #ffc952;">DATE</Td>
						<td width="70px" style="border-bottom:1.5px solid #ffc952;">PLACE</td>
						<td width="40px" style="border-bottom:1.5px solid #ffc952;">TIME</td>
					</tr>
					<%
				} 
			}
			%>
			</table>
			<!-- -------------------day2 date,time,place-------------------------- -->
			
			<table style="font-family: 'Jeju Gothic'; float:left; margin-left:250px; text-align:center;">
			<tr>
				<Td width="60px" style="border-bottom:1.5px solid #ffc952;">하늘상태</Td>
				<td width="60px" style="border-bottom:1.5px solid #ffc952;">기온</td>
				<td width="60px" style="border-bottom:1.5px solid #ffc952;">강수확률</td>
			</tr>
			<%
			String strSQL22 = "SELECT * FROM route where pj='"+selectPj+"' and dateNum=1";
			rs = stmt.executeQuery(strSQL22);%>
			
			<% for(int i=0;rs.next();i++){
			%>
			<TR>
				<TD><%=rs.getString("sky") %></TD>
				<TD><%=rs.getString("th3") %></TD>
				<TD><%=rs.getString("pop") %></TD>
			</TR>
			</table>
			
				<%if(i!=2) {%>	
					<table style="font-family: 'Jeju Gothic'; float:left; margin-left:170px; margin-right:20px; text-align:center;">
					<tr>
						<Td width="60px" style="border-bottom:1.5px solid #ffc952;">하늘상태</Td>
						<td width="60px" style="border-bottom:1.5px solid #ffc952;">기온</td>
						<td width="60px" style="border-bottom:1.5px solid #ffc952;">강수확률</td>
					</tr>
					<%
				} 
			}
			%>
			</table>
			
			<!-- --------------------------------------DAY2끝--------------------------------------- -->		
			
			<!-- --------------------------DAY3부분 -------------------------------------->
			<%
			String strSQL3 = "SELECT * FROM route where pj='"+selectPj+"' and dateNum=2";
			rs = stmt.executeQuery(strSQL3);
			
			if(rs!=null && rs.isBeforeFirst()){ //day3 경로가 있으면 출력하고 없으면 skip
			
			%>
				
				<img src = "image/day3.JPG" style="width:700px; height:auto; margin-left:350px; margin-top : 30px;">
				<br>	
				<table style="font-family: 'Jeju Gothic'; float:left; margin-left:250px; text-align:center;">
				<tr>
					<Td width="80px" style="border-bottom:1.5px solid #47b8e0;">DATE</Td>
					<td width="100px" style="border-bottom:1.5px solid #47b8e0;">PLACE</td>
					<td width="50px" style="border-bottom:1.5px solid #47b8e0;">TIME</td>
				</tr>
				
				<% for(int i=0;rs.next();i++){
			%>
				<TR>
					<TD><%=rs.getString("date") %></TD>
					<TD><%=rs.getString("place") %></TD>
					<TD><%=rs.getString("time") %></TD>
				</TR>
				</table>
				<%if(i!=2) {%>	
					<table style="font-family: 'Jeju Gothic'; float:left; margin-left:80px; text-align:center;">
					<tr>
						<Td width="80px" style="border-bottom:1.5px solid #47b8e0;">DATE</Td>
						<td width="100px" style="border-bottom:1.5px solid #47b8e0;">PLACE</td>
						<td width="50px" style="border-bottom:1.5px solid #47b8e0;">TIME</td>
					</tr>
					<%
				} 
			}//for문끝 (day3끝)
			%>			
			</table>	
			
			<!-- --------------------------DAY4부분 -------------------------------------->
			<%
			String strSQL4 = "SELECT * FROM route2 where pj='"+selectPj+"' and seq='4'";
			rs = stmt.executeQuery(strSQL4);
			
			if(rs!=null && rs.isBeforeFirst()){ //day4 경로가 있으면 출력하고 없으면 skip
			
			%>
				
				<img src = "image/day4.JPG" style="width:700px; height:auto; margin-left:350px; margin-top : 30px;">
				<br>	
				<table style="font-family: 'Jeju Gothic'; float:left; margin-left:250px; text-align:center;">
				<tr>
					<Td width="80px" style="border-bottom:1.5px solid #34314c;">DATE</Td>
					<td width="100px" style="border-bottom:1.5px solid #34314c;">PLACE</td>
					<td width="50px" style="border-bottom:1.5px solid #34314c;">TIME</td>
				</tr>
				
				<% for(int i=0;rs.next();i++){
			%>
				<TR>
					<TD><%=rs.getString("date") %></TD>
					<TD><%=rs.getString("route") %></TD>
					<TD><%=rs.getString("time") %></TD>
				</TR>
				</table>
				<%if(i!=2) {%>	
					<table style="font-family: 'Jeju Gothic'; float:left; margin-left:80px; text-align:center;">
					<tr>
						<Td width="80px" style="border-bottom:1.5px solid #34314c;">DATE</Td>
						<td width="100px" style="border-bottom:1.5px solid #34314c;">PLACE</td>
						<td width="50px" style="border-bottom:1.5px solid #34314c;">TIME</td>
					</tr>
					<%
				} 
			}//for문끝 (day4끝)
			%>			
			</table>	
<%
			}
		}
	}
		rs.close();
		stmt.close();
		conn.close();
	}catch(SQLException ex){ 
}
%>
</body>
</html>