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
conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);//������ ȹ��
stmt = conn.createStatement();//���� Ȯ��
String query = "SELECT * FROM route where ID='boa'";
rs = stmt.executeQuery(query);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>���ָ� ã�� ����_weather</title>

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
    margin : auto; /*���� ��: 20px 10px*/
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

	<!-- �������� -->
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

<script>//���׿���(�ܱ�)
$(document).ready(function(){
	$.ajax({
		type: 'get'
		, dataType: "xml"
		, url: "http://www.kma.go.kr/wid/queryDFS.jsp"
			<%while(rs.next()){%>
		, data: "gridx="+<%=rs.getInt("LAT")%>+"&gridy="+<%=rs.getInt("LNG")%>+""
		, success: xmlPars
		, error: function(xhr, status, error) {alert('cross-origin HTTP ��û�� �������ּ���'); }
		<%}%>
	});
});

var Weather = function(){
	this._tm ="";	// ��ǥ�ð�:yyyymmddhhMM
	this._ts = "";	// �ð� step: ���׿��� �� 4��° ����� ���ÿ���/���Ͽ���/���Ͽ���/�𷹿���
	this._x = "";	// x��ǥ
	this._y = "";	// y��ǥ
}

Weather.prototype = {getTm: function(){return this._tm;},setTm: function(tm){this._tm = tm;},getTs: function(){return this._ts;},setTs: function(ts){this._ts = ts;},getX: function(){return this._x;},setX: function(x){this._x = x;},getY: function(){return this._y;},setY: function(y){this._y = y;}}

var Data = function(){
	this._hour = 0;		// ���׿��� 3�ð�����
	this._day = 0;		// 1��°��(����/����/�� �� ����)
	this._temp = 0;		// ����ð��µ�
	this._tmx = 0;		// �ְ�µ� missing(���� ���� ���)
	this._tmn = 0;		// �����µ� missing(���� ���� ���)
	this._sky = 0;			// �ϴû����ڵ� : �� 1 : ����, �� 2 : ��������, �� 3 : ��������, �� 4 : �帲
	this._pth = 0;			// ���������ڵ� : �� 0 : ����, �� 1 : ��, �� 2 : ��/��, �� 3 : ��/��, �� 4 : ��
	this._wfKor = "";	// �����ѱ��� : �� ����, �� ���� ����, �� ���� ����, �� �帲, �� ��, �� ��/��, �� ��
	this._wfEn = "";		// �������� : �� Clearly, �� Little Cloudy, �� Mostly Cloudy, �� Cloudy, �� Rainy, �� Snow/Rain, �� Snow
	this._pop = 0;		// ����Ȯ��%
	this._r12 = 0.0;			// 12�ð� ���󰭼���
	this._s12 = 0.0;		// 12�ð� ����������
	this._ws = 0.0;			// ǳ��
	this._wd = 0;			// ǳ��(8��): ����8����/����8���� ǳ�� 0~7 (��, �ϵ�, ��, ����, ��, ����, ��, �ϼ�)
	this._wdKor = "";	// ǳ���ѱ���
	this._wdEn = "";	// ǳ�⿵��
	this._reh = 0;			// ����
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

	str += '<tr><th>�ڽ�</th>';
	for (var i=0; i<len; i++) str += '<th>'+(i+1)+'</th>';
	str += '</tr>';
	str += '</thead>';

	str += '<tbody>';

	str += '<tr><th>����</th>';
	for (var i=0; i<len; i++) {
		if (arr[i].getHour()>18 || arr[i].getHour()<6) {
			var imgPath = './icons/'+arr[i].getWfEn()+'_night'+'.png';
		}else {
			var imgPath = './icons/'+arr[i].getWfEn()+'.png';
		}
		str += '<td><img src="'+imgPath+'" alt='+arr[i].getWfKor()+' width="50" height="50"><br/>'+arr[i].getWfKor()+'</td>';
	}
	str += '</tr>';

	str += '<tr><th>���(��)</th>';
	for (var i=0; i<len; i++) str += '<td>'+arr[i].getTemp()+'</td>';
	str += '</tr>';

	str += '<tr><th>����(mm)</th>';
	for (var i=0; i<len; i++) {
		if (arr[i].getR12()==0.0) str += '<td>-</td>';
		else str += '<td>'+arr[i].getR12()+'</td>';
	}
	str += '</tr>';

	str += '<tr><th>����Ȯ��(%)</th>';
	for (var i=0; i<len; i++) str += '<td>'+arr[i].getPop()+'</td>';
	str += '</tr>';

	str += '<tr><th>����(%)</th>';
	for (var i=0; i<len; i++) str += '<td>'+arr[i].getReh()+'</td>';
	str += '</tr>';

	str += '<tr><th>�ٶ�(m/s)</th>';
	for (var i=0; i<len; i++) str += '<td>'+arr[i].getWdKor()+'('+arr[i].getWs()+')</td>';
	str += '</tr>';

	str += '</tbody>';
	str += '</table>';
	str += '<br>';

	$('body').append(str);
	
	//obj.html(str);
}
</script>

<script>//�߱⿹��
$(document).ready(function(){
	$.ajax({
		url: 'http://www.kma.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=108',
		dataType: 'xml',
		success: function(response){
			console.log(response);
			$(response).find('location').each(function(){
				var city=$(this).find('city').text();
				if(city=='����' || city=='������'){
					$('body').append('<center>'+'<h3>'+'<b>'+city+'<br>'+'</h3>'+'</center>');
					$(this).find('data').each(function(){
						var output="";
						output += '<table class="mid">';
						output += '<thead>';
					
						output += '<tr><th>��¥-�ð�</th>';
						output += '<th>�ϴ� ����</th>';
						output += '<th>�ְ� ���</th>';
						output += '<th>���� ���</th>';
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
	  <li><a href="main.jsp">���ָ� ã�� ����</a></li>
	  <li><a href="">STEP1.DAY</a></li>
	  <li><a href="">STEP2.PLACE</a></li>
	  <li><a class="active" href="#">STEP3.WEATHER</a></li>
	</ul>
<form id="form" method="post" action="postWeather.jsp">
<div id="weather"></div>
<center><input type="submit" value="������ ������ ����"></center><br>
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