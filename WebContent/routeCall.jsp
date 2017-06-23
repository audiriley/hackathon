<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
String place="/";
String time="/";
String lat="/";;
String lng="/";
if(dateNum == null){
	dateNum = "0"; //초기화
	}

for(int i=0;i<3;i++){
	time+=request.getParameter("$"+i+"$time").split(":")[0]+"/";
	place+=request.getParameter("$"+i+"$place")+"/";
	lat+=request.getParameter("$"+i+"$lat")+"/";
	lng+=request.getParameter("$"+i+"$lng")+"/";
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
	String sql = "SELECT * FROM  route where ID='"+memberId+"'" ;
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
		count = rs.getInt(1);
	}

	//String sql = "insert into ROUTE (ID,PJ,DATE,PLACE,TIME,LAT,LNG) values ('boa','happy',20170302,'/용두암/제주/','/16:00/12:00/14:00/','/23/23/43/','/233/243/253/')";

		sql = "insert into ROUTE (ID,PJ,pjNum,DATE,PLACE,TIME,LAT,LNG) values ('"+memberId+"','"+pj+"',"+count+",'"+format.format(cal.getTime())+"','"+place+"','"+time+"','"+lat+"','"+lng+"')";
		stmt.executeUpdate(sql); 

	stmt.close();
	}catch(SQLException ex){
		out.write(ex.toString());
	}


%>





<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>