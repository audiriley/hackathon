<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 String memberId=(String) session.getAttribute("idKey");
 %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>제주를 찾는 재주_routeDay</title>

	<!-- css -->
	<link href="css/main.css?v=1" rel="stylesheet">
	<link href="css/routeDay.css?v=8" rel="stylesheet">
	
	<!-- webFont -->
	<STYLE>
		@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
		h2,h5,h3,h6,h1{
			font-family: 'Jeju Gothic';
		}
	</STYLE>
	
	<!-- 제이쿼리 -->
    <link  href="resources/jqueryui/css/ui-lightness/jquery-ui-1.8.16.custom.css" rel="stylesheet">
	<script src="resources/jqueryui/js/jquery-ui-1.8.16.custom.min.js"></script>	    
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    
    <script>   
    //datepicker
    $(function() {    	
    	$( "#datepicker" ).datepicker();
    	$("#today").text(new Date().toLocaleDateString());

        //시작일. 시작일(fromDate)은 종료일(toDate) 이후 날짜 선택 불가
        $('#fromDate').datepicker({
            maxDate :  "+9d" , 	//현재일로부터 10일 이내의 날짜들만 선택할 수 있음
        	dateFormat: "yy-mm-dd",             // 날짜의 형식(2017-06-08)
            onClose: function( selectedDate ) {    
                // 시작일(fromDate) datepicker가 닫힐때
                // 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                $("#toDate").datepicker( "option", "minDate", selectedDate );
            } 
        });

        //종료일. 종료일(toDate)은 시작일(fromDate) 이전 날짜 선택 불가
        $('#toDate').datepicker({
        	maxDate :  "+9d" , //현재일로부터 10일 이내의 날짜들만 선택할 수 있음
            dateFormat: "yy-mm-dd"
        }); 
    });
	</script>
	
	<script>
	/*인풋효과*/
	$(document).ready(function() {
		  var placeholderTarget = $('.textbox input[type="text"], .textbox input[type="password"]');
		  
		  //포커스시
		  placeholderTarget.on('focus', function(){
		    $(this).siblings('label').fadeOut('fast');
		  });

		  //포커스아웃시
		  placeholderTarget.on('focusout', function(){
		    if($(this).val() == ''){
		      $(this).siblings('label').fadeIn('fast');
		    }
		  });

	});
	</script>
	
  
</head>
<body>

	<!-- navigation bar -->
	<ul style="font-family: 'Jeju Gothic'; font-size:13pt; margin-bottom:30px;">
	  <li><a href="main.jsp">제주를 찾는 재주</a></li>
	  <li><a class="active" href="#">STEP1.DAY</a></li>
	  <li onclick="jsp:alert('이번 단계를 마무리해주세요');"><a href="">STEP2.PLACE</a></li>
	  <li onclick="jsp:alert('이번 단계를 마무리해주세요');"><a href="">STEP3.WEATHER</a></li>
	</ul>
	
	<!-- image-->
	<h3 style="text-align:center;">여러분의 제주도 여행 날짜와 여행 루트의 이름을 정해주세요!!</h3>
	<h5 style="text-align:center;">★주의사항★ 저희는 기상청에서 제공하는 정보를 이용하기 때문에 여행날짜 선택은 오늘로부터 10일 이내만 가능합니다.</h5>
	
	<!-- content -->
	<div id="jb-header"  style="font-family: 'Jeju Gothic'; font-size:30pt; width:1250px;
						color : white; text-align:center; background-color : #4087a2;  margin:auto; border: 2px solid #4087a2;">
		BOARDING PASS
	</div>
	
	<div id="jb-container">
	
      <div id="jb-content">
        <img src="image/routeDate.JPG" width="370" height="260" style="float:center; margin-top:20px;"><br>
        <img src="image/bar.JPG" height="110" width="370" style="margin-top:8px; margin-bottom:8px;">
      </div>
      
      <form name="calendarFrm" id="calendarFrm" action="map.jsp" method="post">
	      <div id="jb-sidebar" style="margin: auto;">
	      	 <div class="row" style="text-align:left; margin-bottom:20px;">
	      	 
			    <div class="col-lg-4" style="margin-left:30px;">
					<Br><h2>FROM</h2>			                      	
				    <h1>GIMPO >> JEJU</h1><bR>
				   	<input type="text" id="fromDate" name="start">
				</div>
				
				<div class="col-lg-3">
					<img src="image/airplane.jpg" width="200px" height="180px">
				</div>
				
				<div class="col-lg-5">
				    <br><h2>TO</h2>
					<H1>JEJU >> GIMPO</H1><br>
				   	<input type="text" id="toDate" name="end"><br><Br>
				</div>
				
				<div class="side-footer">
					<div id="footer1">
	           			<h4>passenger</h4>
	           			<h3>web08</h3>
	           		</div>
	            	<div id="footer2">
	           			<h4>seat</h4>
	           			<H3>A08</H3>
	            	</div>
	           		<div id="footer3" style="text-align:center;">
	           			<h4>trip name</h4>
	           			<input type="text" name="pj" placeholder="제주도 여행 제목" style="font-family: 'Jeju Gothic'; outline-style: none;">
	           		</div>
	           		<div id="footer4">
	           			<input type="submit" value="NEXT STEP">
	           		<div>
	           		
				</div>
				 
			</div> <!-- row 끝 -->
		  </div> <!-- side bar 끝 -->
		</form>
		
     	</div> <!-- container 끝 -->
     	
    </div>
    <!-- Footer -->
    


</body>
</html>