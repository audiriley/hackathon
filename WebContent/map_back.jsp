<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import="conn.ConnectionContext, java.util.*, java.sql.*, java.text.*"%>
<%@ page import="java.text.SimpleDateFormat,java.util.Date ,java.util.Calendar,java.util.concurrent.TimeUnit"%>
<%	
	String NAME[]= new String[51];
	request.setCharacterEncoding("UTF-8");
	String dateNum = request.getParameter("dateNum");
	if(dateNum == null){
		dateNum = "0"; //초기화
		}
	long currentDate = Long.parseLong(dateNum);
	String Start = request.getParameter("start");
	String End = request.getParameter("end");
	Calendar cal= Calendar.getInstance();
	SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
	Date start = transFormat.parse(Start);

	Date end = transFormat.parse(End);
	long days=TimeUnit.DAYS.convert(end.getTime()-start.getTime(), TimeUnit.MILLISECONDS);
	cal.setTime(start);

	try{
       		Connection conn = ConnectionContext.getConnection();
        	Statement stmt = conn.createStatement();
        	ResultSet rs=null;
        		String strSQL = "SELECT * FROM  tour ";
        		 rs= stmt.executeQuery(strSQL);
        		for(int j=0;rs.next()&&j<51;j++){
        			NAME[j]=new String(rs.getString("NAME")).trim();
        		}
  
        	rs.close();
			stmt.close();
        }catch(SQLException ex){ 
        				System.out.println(ex.toString());	
        } // catch end
   %>
<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8"/>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCm9feXcf-2caAZ-K2PikChgFy375P4Y0Q"></script>

    <style>
    @import url("css/map.css");
    
    </style>
    
  </head>
  <body>

  <form name="mapForm" action="mapFlow.jsp?dateNum=<%=dateNum%>" onsubmit="return flow()" method="post">
 	 <div id="list">
			<ul id="ul1">
				<li style="background-color:#b1c4f1; height:50px"> 날짜</li>
						<% for(long i=0;i<days+1;i++){
							if(i == Long.parseLong(dateNum)){
							%>
						<li style="background:#ff6633; color:white" onclick="document.getElementById('ul2').style.visibility='visible';"><%=cal.get(Calendar.MONTH)+1%>/<%=cal.get(Calendar.DATE)%>
						<%}
							else if(i <Long.parseLong(dateNum)){%>
							<li onclick="alert('지금은  <%=Long.parseLong(dateNum)%> 계획을 짜고 있습니다.');"><%=cal.get(Calendar.MONTH)+1%>/<%=cal.get(Calendar.DATE)%></li> <!-- 여기 날짜가 들어간다 -->
						<%}else{%>
							<li onclick="alert('<%=Long.parseLong(dateNum)%>을 저장해주세요');"><%=cal.get(Calendar.MONTH)+1%>/<%=cal.get(Calendar.DATE)%></li> <!-- 여기 날짜가 들어간다 -->
						<%}
							cal.add(Calendar.DATE,1);
						}%>
			</ul>  <!-- 첫번쨰 리스트 -->
			<ul id="ul2" style="overflow-y:auto;">
								<li style="background-color:#b1c4f1; height:50px"><span onclick="jsp: document.getElementById('ul2').style.visibility='hidden'">&lt;</span>지역</li>
								<% for(int j=0;j<51;j++){ %>
 									<li onclick="get_address(this.innerHTML)" style="height:2em"><%=NAME[j]%></li>
 								<%}%>
			</ul> <!-- 두번쨰 리스트 -->
	</div>
   <div id="map"></div>
	<div id="panelHolder">
		<span style="background:#b1c4f1; height:10%; width:100%;display:block">여행루트</span>
		<div id="panel">
		</div>
		
		<input type="submit" value="save">
	</div>
   </form>
   	
      <script src="js/mapApi.js"></script>
  </body>
</html>