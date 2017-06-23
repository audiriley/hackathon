<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
<%
request.setCharacterEncoding("UTF-8");
String dateNum = request.getParameter("dateNum");
String place [] = new String [3];
String time [] = new String [3];
String lat [] = new String [3];
String lng [] = new String [3];
	if(dateNum == null){
		dateNum = "0"; //초기화
		}
	long currentDate = Long.parseLong(dateNum);

	if(currentDate==2){%>
		location.href="weather.jps"; //날씨 위치
<%}else{
	for(int i=0;i<3;i++){
		time[i]=request.getParameter("$"+i+"$time");
		place[i]=request.getParameter("$"+i+"$place");
		lat [i]=request.getParameter("$"+i+"$lat");
		lng[i]=request.getParameter("$"+i+"$lng");
	}
	%>
	alert("<%=time[0]%> <%=time[1]%> <%=time[2]%> <%=place[0]%> <%=place[1]%> <%=place[2]%> <%=lat [0]%> <%=lat [1]%> <%=lat [2]%> <%=lng[0]%>  <%=lng[1]%> <%=lng[2]%>");

		location.href="map.jsp?dateNum="+<%=(currentDate+1)%>;
		<%}%>
</script>
</body>
</html>