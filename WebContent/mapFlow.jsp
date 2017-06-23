<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="conn.ConnectionContext, java.util.*, java.sql.*, java.text.*"%>
<%@ page import="java.text.SimpleDateFormat,java.util.Date ,java.util.Calendar,java.util.concurrent.TimeUnit"%>
<%
String memberId = (String)session.getAttribute("idKey");
request.setCharacterEncoding("UTF-8");
String dateNum = request.getParameter("dateNum");
long currentDate = Long.parseLong(dateNum);
String start = request.getParameter("start");
String pj = request.getParameter("pj");
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

for(int i=0;i<3;i++){
	time[i]=request.getParameter("$"+i+"$time");
	place[i]=request.getParameter("$"+i+"$place");
	lat [i]=request.getParameter("$"+i+"$lat");
	lng [i]=request.getParameter("$"+i+"$lng");
}
//out.println(""+time+" "+place+" "+lat+" "+lng)

SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
Calendar cal= Calendar.getInstance();
cal.setTime(Start);
cal.add(Calendar.DATE,(int)currentDate);
int count=0; // pj  개수 
try{
	Connection conn = ConnectionContext.getConnection();
	// Statement 생성

	Statement stmt = conn.createStatement();
	String sql = "SELECT COUNT(distinct PJ) FROM  route where ID='"+memberId+"'" ;
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
		count = rs.getInt(1);
	}

	//String sql = "insert into ROUTE (ID,PJ,DATE,PLACE,TIME,LAT,LNG) values ('boa','happy',20170302,'/용두암/제주/','/16:00/12:00/14:00/','/23/23/43/','/233/243/253/')";
	for(int i=0;i<3;i++){
		sql = "insert into ROUTE (ID,PJ,pjNum,dateNum,DATE,PLACE,TIME,LAT,LNG) values ('"+memberId+"','"+pj+"','"+count+"','"+dateNum+"','"+format.format(cal.getTime())+"','"+place[i]+"','"+time[i]+"','"+lat [i]+"','"+lng [i]+"')";
		stmt.executeUpdate(sql); 
	}
	stmt.close();
	}catch(SQLException ex){
		out.write(ex.toString());
	}


%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
<%if(currentDate>=days){%> //데이터베이스에 저장한다.
location.href="weather.jsp"; //날씨 위치
<%}%>
</script>
<form id="form" method="post" action="map.jsp?dateNum=<%=(currentDate+1)%>" >
	<input type="hidden" name="start" value="<%=start%>">
	<input type="hidden" name="end"  value="<%=end%>">
	<input type="hidden" name="pj"  value="<%=pj%>">
	<input type="submit" value=">>>>다음 단계>>>">
</form>
</body>
</html>