		var map;
		var geocoder;
		var address;//주소를 받아올 값 하나만 있으면 된다 .
		var marker = new Array();
		var latlng = new Array();
		var mark_cnt=0;//마커 카운터 
		
		function initialize() {
		
			latlng[0] = {lat: 33.305894, lng: 126.28942};
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
			}//end_of_initialize
				  
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