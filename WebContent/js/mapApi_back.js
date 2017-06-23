  var map;
		var geocoder;
		var address;//주소를 받아올 값 하나만 있으면 된다 .
		var marker = new Array();
		var latlng = new Array();
		var count=0;//마커 카운터 
		var visited = new Array();
		function check(){
			for(var i=0;i<visited.length;i++)
				if(visited[i]==address)
					return false;
			return true;
		}
		function initialize() {
			count=0;
			latlng[0] = {lat: 33.51041350000001, lng: 126.49135339999998};
			var mapOptions = {
  			zoom: 10,
  			center: latlng[0]
				 };
			visited[0]="제주 공항";
			map = new google.maps.Map(document.getElementById('map'),mapOptions);
			marker["제주 공항"] = new google.maps.Marker({
 			 position: latlng[0],
 			 map: map,
 			 label : '1'});
			geocoder = new google.maps.Geocoder();
			count=parseInt(count);
			}//end_of_initialize
				  
		function get_address(input_address){
			if(count>2){
				alert("횟수 초과");
				return false;
			}
			address=input_address;
			add_to_latlng();
			take();
		}
		function add_to_latlng(){
			++count;
			if(check()||address=="제주 공항"){
				visited[count]=address;
			geocoder.geocode( { 'address': address}, function(results, status) {
				 if (status == google.maps.GeocoderStatus.OK) { 
					 
					 latlng[count]={lat:results[0].geometry.location.lat(), lng : results[0].geometry.location.lng()};
				       marker[address] = new google.maps.Marker({ position:latlng[count], map : map, label :''+ (count+1)});
				       draw_path();
				 } 
				 else {
						alert("Geocode was not successful for the following reason: " + status);
				 }
			});
			}
			else{
				count--;
			}
		}
		function take(){
			var temp = "<br>"+address+"&nbsp;<input type='time' min='06:00' max='24:00' step='3600'>";
			document.getElementById('panel').innerHTML+=temp;
			}
		function draw_path()// 경로 그리기
		{  
 			 var Path = new google.maps.Polyline({
  	  		Path: latlng, strokeColor:'#40bf40',stokeOpacity:1.0, strokeWeight:6
  				});
 				Path.setMap(map);
		}
		google.maps.event.addDomListener(window, 'load', initialize);