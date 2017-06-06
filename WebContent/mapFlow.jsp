<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="conn.ConnectionContext, java.util.*, java.sql.*, java.text.*"%>
<%@ page import="java.text.SimpleDateFormat,java.util.Date ,java.util.Calendar,java.util.concurrent.TimeUnit"%>
<%
request.setCharacterEncoding("UTF-8");
String dateNum = request.getParameter("dateNum");
long currentDate = Long.parseLong(dateNum);
String start = request.getParameter("start");
String end = request.getParameter("end");
SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
Date Start = transFormat.parse(start);
Date End = transFormat.parse(end);
long days=TimeUnit.DAYS.convert(End.getTime()-Start.getTime(), TimeUnit.MILLISECONDS);
String place [] = new String [3];
String time [] = new String [3];
String lat [] = new String [3];
String lng [] = new String [3];
if(dateNum == null){
	dateNum = "0"; //초기화
	}
%>
<!DOCTYPE html>
<html>
<head>
<script>
<%if(currentDate>days){%> //데이터베이스에 저장한다.
location.href="weather.jps"; //날씨 위치
<%}
else{%>
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
<%
for(int i=0;i<3;i++){
	time[i]=request.getParameter("$"+i+"$time");
	place[i]=request.getParameter("$"+i+"$place");
	lat [i]=request.getParameter("$"+i+"$lat");
	lat [i]=request.getParameter("$"+i+"$lng");
}
}
%>
<%
SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
Calendar cal= Calendar.getInstance();
cal.setTime(Start);
cal.add(Calendar.DATE,(int)currentDate);
try{
	Connection conn = ConnectionContext.getConnection();
	// Statement 생성

	Statement stmt = conn.createStatement();
	for(int i=0;i<3;i++){
	String sql = "insert into route (DATE,PLACE,TIME,LAT,LNG) values ('"+format.format(cal.getTime())+"','"+place[i]+"','"+time[i]+"','"+lat [i]+"','"+lat [i]+")";
	
	stmt.executeUpdate(sql); 
	}
	stmt.close();
	}catch(SQLException ex){
		out.write(ex.toString());
	}
%>
</script>
<form method="post" action="map.jsp?dateNum=<%=(currentDate+1)%>">
<input type="hidden" name="start" value="<%=start%>">
<input type="hidden" name="end"  value="<%=end%>">


<input type="submit">
</form>
</body>
</html>