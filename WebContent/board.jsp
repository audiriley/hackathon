<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="conn.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%

// paginator
request.setCharacterEncoding("utf-8");
String pageNum = request.getParameter("pageNum");
if(pageNum == null){
pageNum = "1";
}

int listSize = 3;
int currentPage = Integer.parseInt(pageNum);
int nextPage = currentPage + 1;
int startRow = (currentPage - 1) * listSize + 1;
int endRow = currentPage * listSize;
int lastRow = 0;
int i = 0;
int num[] = {0};
int row = startRow;
%>

<%String memberId= (String)session.getAttribute("idKey"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>제주를찾는재주_board</title>

	<!-- css -->
	<link href="css/main.css" rel="stylesheet">
	<link href="css/board.css" rel="stylesheet">
	
	<!-- webFont -->
	<STYLE>
		@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
		h2,h5,h3,h6,.btn,.btn2{
			font-family: 'Jeju Gothic';
			text-align : center;
		}
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
	
	<!-- image-->
	<!-- img src="image/board2.JPG" style="height:250px; margin-left: auto; margin-right: auto; display: block;"-->	
	<img src ="image/boardShare.JPG" style="height:80px; margin-left: auto; margin-right: auto; margin-top: 20px; display: block;">
	<h2>우리의 제주 이야기 함께 공유해요!</h2>
	<h5>제주도 여행 루트를 공유하며 관리자의 공지사항을 확인할 수 있는 공간입니다.</h5>
	
	
	<a href="boardWrite.jsp"><img src="image/boardWrite.JPG" style="width:55px; margin-left:990px;"></a>
		
	
	<!-- board -->
	
	<table>
  	<tr>
    	<th id="title">제목</th>
    	<th id="writer">작성자</th>
    	<th id="content">보기</th>
    	<th id="update">수정</th>
    	<th id="delete">삭제</th>
  	</tr>
  	<%

try{
	// 데이터베이스 커넥션 생성
	Connection conn = ConnectionContext.getConnection();
	// Statement 생성

	Statement stmt = conn.createStatement();
	// ReseltSet의 레코드 수를 lastRow 변수에 저장

	String strSQL = "SELECT count(*) FROM board";
	ResultSet rs = stmt.executeQuery(strSQL);

		if(rs.next())
			lastRow = rs.getInt(1);
		
	rs.close();


	// ResultSet에 레코드가 존재할 때
	if(lastRow > 0) {
		strSQL = "SELECT * FROM board";
		rs = stmt.executeQuery(strSQL);

		for(i=1;rs.next(); i++){
			if(i >= startRow && i <=endRow){

%>

	<TR> <!--줄 삽입 -->

	<TD><%=rs.getString("title") %></TD>
	<% String title = rs.getString("title");%>
	<TD><%=rs.getString("id") %></TD>
	<TD>
		<form name="pjName" id="pjName" action="boardRead.jsp" method="post">
		<input type="hidden" value="<%=title %>" name="title">
			<input TYPE="IMAGE" src="image/showRoute.JPG" style="width:60px;height:55px; float:right;" name="Submit" value="<%=title%>">
		</form>		
	</td>
	<TD>
	<form action="updateForm.jsp" method="post">
		<input type="hidden" value="<%=title %>" name="title">
		<input TYPE="IMAGE" src="image/update.JPG" style="width:50px;height:55px; float:left;" name="Submit" value="<%=title%>">
	</form>
	</td>
	<td>
	<form action="boardDelete.jsp" method="post">
	<%if(rs.getString("id").equals(memberId)||memberId.equals("admin")){ %>
		<input type="hidden" value="<%=title %>" name="title">
		<input TYPE="IMAGE" src="image/delete.JPG" style="width:50px;height:55px; float:left;" name="Submit" value="<%=title%>">
	<%}%>
	</form>
	</TD>

	</TR>

	<%row++;

	} // end of if
	}//end of for

rs.close();
stmt.close();
}

else //레코드가 없다면 
{

%>

<TR>

<TD colspan="4"> 레코드 없음 </TD>

</TR>

<%

}



}catch(SQLException ex){ 

%>

<TR>

<TD colspan="4"> 에러: <%=ex %> </TD>

</TR>

<%

}

%>



</TABLE>

<%

if(lastRow > 0) {

// 페이지가 넘어갈 때 넘겨줄 파라미터

int setPage = 1;


// 마지막 페이지의 번호를 저장

int lastPage = 0;

if(lastRow % listSize == 0)

lastPage = lastRow / listSize;

else

lastPage = lastRow / listSize + 1;


if(currentPage > 1) {

%>

<a href="board.jsp?pageNum=<%=currentPage-1%>">[이전]</a>

<%

}

// 레코드 수에 따라 쪽번호를 매긴다.

while(setPage <= lastPage) {

%>

<a href="board.jsp?pageNum=<%=setPage%>">[<%=setPage%>]</a>

<%

setPage = setPage + 1;

}


// 현재 쪽번호에 따라 다음 쪽의 번호를 파라메터로 넘겨준다.

if(lastPage > currentPage) {

%>

<a href="board.jsp?pageNum=<%=currentPage+1%>">[다음]</a>

<%

}

}

%>
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
</div>
</body>
</html>