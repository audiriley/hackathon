<%@ page language="java" contentType="text/html; charset=EUC-KR" 
pageEncoding="EUC-KR" import="java.sql.*" import="conn.ConnectionContext" import="java.util.*"%>

<%
Class.forName("com.mysql.jdbc.Driver");
String DB_URL = "jdbc:mysql://localhost:3306/websysdb02?useUnicode=true&characterEncoding=utf8";
String DB_USER = "root";
String DB_PASSWORD = "websys";

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try{
conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);//연결자 획득
stmt = conn.createStatement();//상태 확인
String query = "SELECT * FROM route where ID='boa'";
rs = stmt.executeQuery(query);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>제주를 찾는 재주_weather</title>

	<!-- css -->
	<link href="css/main.css" rel="stylesheet">
	<link href="css/routeDay.css" rel="stylesheet">

<style>
@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
		h2,h5,h3,h6,h1{
			font-family: 'Jeju Gothic';
		}

table.mid {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 3px solid #369;
    margin : auto; /*변경 전: 20px 10px*/
}
table.mid th {
    width: 147px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #153d73;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
table.mid td {
    width: 349px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
</style>
</head>

	<!-- 제이쿼리 -->
	<link rel="stylesheet" type="text/css">
    <link  href="resources/jqueryui/css/ui-lightness/jquery-ui-1.8.16.custom.css" rel="stylesheet">
	<script src="resources/jqueryui/js/jquery-ui-1.8.16.custom.min.js"></script>	    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" language="javascript" charset="utf-8"></script>

<script>//동네예보(단기)
$(document).ready(function(){
	$.ajax({
		type: 'get'
		, dataType: "xml"
		, url: "http://www.kma.go.kr/wid/queryDFS.jsp"
			<%while(rs.next()){%>
		, data: "gridx="+<%=rs.getInt("LAT")%>+"&gridy="+<%=rs.getInt("LNG")%>+""
		, success: xmlPars
		, error: function(xhr, status, error) {alert('cross-origin HTTP 요청을 승인해주세요'); }
		<%}%>
	});
});

var Weather = function(){
	this._tm ="";	// 발표시각:yyyymmddhhMM
	this._ts = "";	// 시간 step: 동네예보 중 4번째 경우인 오늘오후/내일오전/내일오후/모레오전
	this._x = "";	// x좌표
	this._y = "";	// y좌표
}

Weather.prototype = {getTm: function(){return this._tm;},setTm: function(tm){this._tm = tm;},getTs: function(){return this._ts;},setTs: function(ts){this._ts = ts;},getX: function(){return this._x;},setX: function(x){this._x = x;},getY: function(){return this._y;},setY: function(y){this._y = y;}}

var Data = function(){
	this._hour = 0;		// 동네예보 3시간단위
	this._day = 0;		// 1번째날(오늘/내일/모레 중 오늘)
	this._temp = 0;		// 현재시간온도
	this._tmx = 0;		// 최고온도 missing(값이 없을 경우)
	this._tmn = 0;		// 최저온도 missing(값이 없을 경우)
	this._sky = 0;			// 하늘상태코드 : ① 1 : 맑음, ② 2 : 구름조금, ③ 3 : 구름많음, ④ 4 : 흐림
	this._pth = 0;			// 강수상태코드 : ① 0 : 없음, ② 1 : 비, ③ 2 : 비/눈, ④ 3 : 눈/비, ⑤ 4 : 눈
	this._wfKor = "";	// 날씨한국어 : ① 맑음, ② 구름 조금, ③ 구름 많음, ④ 흐림, ⑤ 비, ⑥ 눈/비, ⑦ 눈
	this._wfEn = "";		// 날씨영어 : ① Clearly, ② Little Cloudy, ③ Mostly Cloudy, ④ Cloudy, ⑤ Rainy, ⑥ Snow/Rain, ⑦ Snow
	this._pop = 0;		// 강수확률%
	this._r12 = 0.0;			// 12시간 예상강수량
	this._s12 = 0.0;		// 12시간 예상적설량
	this._ws = 0.0;			// 풍속
	this._wd = 0;			// 풍향(8방): 국문8방위/영문8방위 풍향 0~7 (북, 북동, 동, 남동, 남, 남서, 서, 북서)
	this._wdKor = "";	// 풍향한국어
	this._wdEn = "";	// 풍향영어
	this._reh = 0;			// 습도
}

Data.prototype = {getHour: function(){ return this._hour; }, setHour: function(hour){ this._hour = hour; },getDay: function(){ return this._day; }, setDay: function(day){ this._day = day; },getTemp: function(){ return this._temp; }, setTemp: function(temp){ this._temp = temp; },getTmx: function(){ return this._tmx; }, setTmx: function(tmx){ this._tmx = tmx; },getTmn: function(){ return this._tmn; }, setTmn: function(tmn){ this._tmn = tmn; },getSky: function(){ return this._sky; }, setSky: function(sky){ this._sky = sky; },getPth: function(){ return this._pth; }, setPth: function(pth){ this._pth = pth; },getWfKor: function(){ return this._wfKor; }, setWfKor: function(wfKor){ this._wfKor = wfKor; },getWfEn: function(){ return this._wfEn; }, setWfEn: function(wfEn){ this._wfEn = wfEn; },getPop: function(){ return this._pop; }, setPop: function(pop){ this._pop = pop; },getR12: function(){ return this._r12; }, setR12: function(r12){ this._r12 = r12; },getS12: function(){ return this._s12; }, setS12: function(s12){ this._s12 = s12; },getWs: function(){ return this._ws; }, setWs: function(ws){ this._ws = ws; },getWd: function(){ return this._wd; }, setWd: function(wd){ this._wd = wd; },getWdKor: function(){ return this._wdKor; }, setWdKor: function(wdKor){ this._wdKor = wdKor; },getWdEn: function(){ return this._wdEn; }, setWdEn: function(wdEn){ this._wdEn = wdEn; },getReh: function(){ return this._reh; }, setReh: function(reh){ this._reh = reh; }}

var myWeather = new Weather();
var myData;

function xmlPars(xml) {

	if ($(xml).find("wid").find("data").length > 0) {
<%while(rs.next()){%>
		myWeather.setTm(<%=rs.getInt("DATE")%>+<%=rs.getInt("TIME")%>);
		myWeather.setTs($(this).find("ts").text());
<%}%>

		myData = new Array($(xml).find("wid").find("data").length);
		$(xml).find("wid").find("body").find("data").each(function(idx) {
			myData[idx] = new Data();
			myData[idx].setHour($(this).find("hour").text());
			myData[idx].setDay($(this).find("day").text());
			myData[idx].setTemp($(this).find("temp").text());
			myData[idx].setTmx($(this).find("tmx").text());
			myData[idx].setTmn($(this).find("tmn").text());
			myData[idx].setSky($(this).find("sky").text());
			myData[idx].setPth($(this).find("pth").text());
			myData[idx].setWfKor($(this).find("wfKor").text());
			myData[idx].setWfEn($(this).find("wfEn").text().replace(/^\s+|\s+$/g,""));
			myData[idx].setPop($(this).find("pop").text());
			myData[idx].setR12($(this).find("r12").text());
			myData[idx].setS12($(this).find("s12").text());
			myData[idx].setWs($(this).find("ws").text());
			myData[idx].setWd($(this).find("wd").text());
			myData[idx].setWdKor($(this).find("wdKor").text());
			myData[idx].setWdEn($(this).find("wdEn").text());
			myData[idx].setReh($(this).find("reh").text());
		});
		printWeather($('#weather'),myWeather,myData,6);
	}
}

function printWeather(obj, weatherHeader,arr,len){
	if (len==null) { var len = arr.length; }
	var str = "";
	str += '<table class="mid">';
	str += '<thead>';

	var col0 = 0;
	var col1 = 0;
	var col2 = 0;
	for (var i=0; i<len; i++) {
		if ( arr[i].getDay()==0 ) col0 += 1;
		else if ( arr[i].getDay()==1 ) col1 += 1;
		else if ( arr[i].getDay()==2 ) col2 += 1;
	}
	
	//str += '</tr>';

	str += '<tr><th>코스</th>';
	for (var i=0; i<len; i++) str += '<th>'+(i+1)+'</th>';
	str += '</tr>';
	str += '</thead>';

	str += '<tbody>';

	str += '<tr><th>날씨</th>';
	for (var i=0; i<len; i++) {
		if (arr[i].getHour()>18 || arr[i].getHour()<6) {
			var imgPath = './icons/'+arr[i].getWfEn()+'_night'+'.png';
		}else {
			var imgPath = './icons/'+arr[i].getWfEn()+'.png';
		}
		str += '<td><img src="'+imgPath+'" alt='+arr[i].getWfKor()+' width="50" height="50"><br/>'+arr[i].getWfKor()+'</td>';
	}
	str += '</tr>';

	str += '<tr><th>기온(℃)</th>';
	for (var i=0; i<len; i++) str += '<td>'+arr[i].getTemp()+'</td>';
	str += '</tr>';

	str += '<tr><th>강수(mm)</th>';
	for (var i=0; i<len; i++) {
		if (arr[i].getR12()==0.0) str += '<td>-</td>';
		else str += '<td>'+arr[i].getR12()+'</td>';
	}
	str += '</tr>';

	str += '<tr><th>강수확률(%)</th>';
	for (var i=0; i<len; i++) str += '<td>'+arr[i].getPop()+'</td>';
	str += '</tr>';

	str += '<tr><th>습도(%)</th>';
	for (var i=0; i<len; i++) str += '<td>'+arr[i].getReh()+'</td>';
	str += '</tr>';

	str += '<tr><th>바람(m/s)</th>';
	for (var i=0; i<len; i++) str += '<td>'+arr[i].getWdKor()+'('+arr[i].getWs()+')</td>';
	str += '</tr>';

	str += '</tbody>';
	str += '</table>';
	str += '<br>';

	$('body').append(str);
	
	//obj.html(str);
}
</script>

<script>//중기예보
$(document).ready(function(){
	$.ajax({
		url: 'http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=108',
		dataType: 'xml',
		success: function(response){
			console.log(response);
			$(response).find('location').each(function(){
				var city=$(this).find('city').text();
				if(city=='제주' || city=='서귀포'){
					$('body').append('<center>'+'<h3>'+'<b>'+city+'<br>'+'</h3>'+'</center>');
					$(this).find('data').each(function(){
						var output="";
						output += '<table class="mid">';
						output += '<thead>';
					
						output += '<tr><th>날짜-시간</th>';
						output += '<th>하늘 상태</th>';
						output += '<th>최고 기온</th>';
						output += '<th>최저 기온</th>';
						output += '</tr>';
						output += '</thead>';

						output += '<tbody>';
						output += '<td>'+$(this).find('tmEf').text()+'</td>';
						output += '<td>'+$(this).find('wf').text()+'</td>';
						output += '<td>'+$(this).find('tmn').text()+'</td>';
						output += '<td>'+$(this).find('tmx').text()+'</td>';
						output += '</tbody>';
						output += '</table>';
						$('body').append(output+'<br>');
				})
				}
			});
		}
	});
})
</script>

<body>
<!-- navigation bar -->
	<ul style="font-family: 'Jeju Gothic'; font-size:13pt; margin-bottom:30px;">
	  <li><a href="main.jsp">제주를 찾는 재주</a></li>
	  <li><a href="">STEP1.DAY</a></li>
	  <li><a href="">STEP2.PLACE</a></li>
	  <li><a class="active" href="#">STEP3.WEATHER</a></li>
	</ul>
<form id="form" method="post" action="postWeather.jsp">
<div id="weather"></div>
<center><input type="submit" value="선택한 여행을 저장"></center><br>
</form>
<%
rs.close();
stmt.close();
conn.close();
} catch(SQLException e){
	out.println("err:"+e.toString());
}
%>

</body>
</html>