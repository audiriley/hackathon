<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.text.SimpleDateFormat,java.util.Date ,java.util.Calendar,java.util.concurrent.TimeUnit"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	String Start = request.getParameter("start");
	String End = request.getParameter("end");
	Calendar cal= Calendar.getInstance();
	SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
	Date start = transFormat.parse(Start);
	Date end = transFormat.parse(End);%>
<form action="temp1.jsp" method="post">

s<%=start %><br>S<%=Start %><br>
e<%=end %><br>E<%=End %><br>
	<input type="hidden" name="start" value="<%=Start%>">S
	<input type="hidden" name="end"  value="<%=End%>">e

<input type="submit">
	</form>
</body>
</html>