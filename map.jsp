<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Calendar" %>
 <% 
 Calendar cal = Calendar.getInstance();
 int month = cal.get(Calendar.MONTH)+1;//1~12
 int date = cal.get(Calendar.DATE);%> 
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>루트(1.일정)</title>

    
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/modern-business.css" rel="stylesheet">

    <!-- Custom Fonts -->
   
	<!-- Map API -->
		<!-- Google API call&key-->
	<script
  	  src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCm9feXcf-2caAZ-K2PikChgFy375P4Y0Q">
	</script>
		
		<!-- Map API onScreen-->
	<script>
		var map;
		var geocoder;
		var address;//주소를 받아올 값 하나만 있으면 된다 .
		var marker = new Array();
		var latlng = new Array();
		var mark_cnt=0;//마커 카운터 
		
		function initialize() {
		
			latlng[0] = {lat: 33.305894, lng: 126.28942};
			
			/*Testor*/
  			var mapOptions = {
    			zoom: 10,
    			center: latlng[0]
 				 };
  			
  			map = new google.maps.Map(document.getElementById('map'),mapOptions);
  			marker["오설록"] = new google.maps.Marker({
   			 position: latlng[0],
   			 map: map,
   			 label : '0'});
  			geocoder = new google.maps.Geocoder();
  			mark_cnt=parseInt(mark_cnt);
  		////////////////////////////////////////////////////////////////////////	
  			
  			
  			
  			
			}//end_of_initialize
			
		function get_address(input_address){
			address=input_address;
			add_to_latlng();
		}
  				  
		function add_to_latlng(){
			++mark_cnt;
			geocoder.geocode( { 'address': address}, function(results, status) {
				 if (status == google.maps.GeocoderStatus.OK) { 
					 latlng[mark_cnt]={lat:results[0].geometry.location.lat(), lng : results[0].geometry.location.lng()};
				       marker[address] = new google.maps.Marker({ position:latlng[mark_cnt], map : map, label :''+ mark_cnt});
				       draw_path();
				 } 
				 else {
						alert("Geocode was not successful for the following reason: " + status);
				 }
			});
		}
		function check_path(){ //test 용
			for(var i=0;i<latlng.length;i++)
				document.write(latlng[i].lat+"<br>");
		}
		function draw_path()// 경로 그리기
		{ 
   			 var Path = new google.maps.Polyline({
    	  		Path: latlng, strokeColor:'#0000FF',stokeOpacity:1.0, strokeWeight:4
    				});
   				Path.setMap(map);
  		}
		google.maps.event.addDomListener(window, 'load', initialize);
</script>
	<!--route_list_active.js --> 
		
		

</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="main.jsp">제주를 찾는 재주</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="route_day.jsp">루트</a>
                    </li>
                    <li>
                        <a href="datepicker.jsp">게시판</a>
                    </li>
                    <li>
                        <a href="contact.html">마이 루트</a>
                    </li>
					<li>
                        <a href="contact.html">로그인</a>
                    </li>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">루트
                    <!-- <small>일정 선택</small> -->
                </h1>
                <ol class="breadcrumb">
                    <li><a href="route_day.jsp">step1) 일정 선택</a>
                    </li>
                    <li><a href="map.jsp">step2) 장소 선택</a>
                    </li>
					 <li class="active"> step3) 날씨 확인</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
        <!-- route_list -->
  <link href="css/css_route_list.css" type="text/css" rel="Stylesheet" />
  <div id="route_list">
    <ul>
        <li><a href="#"><%=month+"/"+date%></a>
            <ul id="list_2nd">
                <li><a href="#">제주</a></li>
                	<ul>
               		 	 <li><a href="#" onclick="get_address(this.innerHTML)">제주공함</a></li>
               		 	 <li><a href="#" onclick="get_address(this.innerHTML)">섭지코지</a></li>
           			</ul>
                <li><a href="#">서귀포</a></li>
            </ul>
        </li>
        <li><a href="#"><%=month+"/"+(date+1)%></a>
            <ul id="2nd">
                <li><a href="#">제주</a></li>
                <li><a href="#">서귀포</a></li>
            </ul>
        </li>
         <li><a href="#"><%=month+"/"+(date+2)%></a>
             <ul id="2nd">
                <li><a href="#">제주</a></li>
                <li><a href="#">서귀포</a></li>
            </ul>
        </li>
    </ul>
</div>
        <!-- map_component -->
 			<div id="map"></div>
 </div>
</body>
</html>