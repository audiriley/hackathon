        var map;
		var geocoder;
		var address;//주소를 받아올 값 하나만 있으면 된다 .
		var marker = new Array();
		var latlng = new Array();
		var count=0;//마커 카운터 
		var visited = new Array();
		//데이터의 폼 이름은 $날짜 (currentPage)$n번쨰 장소((count-1))$(name|place|lat|lng|time)
		//제주 공항이 첫 출발지
		
		
		var RE = 6371.00877; // 지구 반경(km)
		var GRID = 5.0; // 격자 간격(km)
		var SLAT1 = 30.0; // 투영 위도1(degree)
		var SLAT2 = 60.0; // 투영 위도2(degree)
		var OLON = 126.0; // 기준점 경도(degree)
		var OLAT = 38.0; // 기준점 위도(degree)
		var XO = 43; // 기준점 X좌표(GRID)
		var YO = 136; // 기1준점 Y좌표(GRID)
		var rs;
		
		function check(){
			for(var i=0;i<visited.length;i++)
				if(visited[i]==address)
					return false;
			return true;
		}
		function initialize() {
			count=0;
			latlng[0] = {lat: 33.51041, lng: 126.49135339};
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
			add_to_latlng(); //count++;
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

		function flow(){
			
			if(count!=3){
				alert(""+x+" "+y);
				return false;
			}
		}
		var time =  new Array(3);
		
		
		function take(){   
		
			var temp = "<br>"+address;
			document.getElementById('panel').innerHTML+=temp;
			temp = document.createElement("input");
			temp.setAttribute("type",'time'); 
			temp.setAttribute('min','06:00'); temp.setAttribute('max','24:00'); temp.setAttribute('step','3600'); 
			temp.setAttribute('name','$'+(count-1)+'$time'); 
			temp.oninput=function(){
				time[count-1]=temp.value;
				temp.setAttribute('value',time[count-1]);
			}
			document.getElementById('panel').appendChild(temp);
			addFormElement();
			}
		function draw_path()// 경로 그리기
		{  
 			 var Path = new google.maps.Polyline({
  	  		Path: latlng, strokeColor:'#40bf40',stokeOpacity:1.0, strokeWeight:6
  				});
 				Path.setMap(map);
		}

		
		function addFormElement(){

			var form = new Array(3);
			for(var i=0;i<3;i++){
				form[i]= document.createElement("input");
				form[i].setAttribute("type","hidden");
				document.getElementById('panel').appendChild(form[i]);
			}
			
			form[0].setAttribute('name','$'+(count-1)+"$place");
			form[0].setAttribute('value',address);
			form[1].setAttribute('name','$'+(count-1)+"$lat");
			form[1].setAttribute('value',latlng[count-1].lat);
			form[2].setAttribute('name','$'+(count-1)+"$lng");
			form[2].setAttribute('value',latlng[count-1].lng);
		
		}
			
		google.maps.event.addDomListener(window, 'load', initialize);