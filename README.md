>제주를 찾는 재주 / Way to Jeju <br>
>제주도 여행자들이 편리하게 여행을 할 수 있도록 도와주는 웹사이트입니다. <br>
>audiriley, lynring24, 최수연

1.Main
![Main](./capture/main.gif)

2. 경로 / route
<dl> 
    <dt>날짜</dt>
          <dd>![date](./capture/date.png)</dd>
    <dt>장소</dt>
          <dd>![place](./capture/map.png)<br>
          문화관광부가 제공하는 제주도 내의 관광지 데이터들을 사용하여 DB의 TOUR테이블에 저장 후, 그 곳에서 읍/면 단위로 제주도의 관광지 리스트를 보여주어 사용자에게 선택할 수 있게끔 하였다.<br>
         사용자가 선택한 관광지는 지도에 표시해준다. 지도로는 goole API를 하였다. <br>
          </dd>
    <dt>날씨</dt>
         <dd>RSS 방식의 기상청 동네예보, 중기예보 API를 활용하였는데 그 활용 방법은 다음과 같다.<br>
              &nbsp;&nbsp;1) 장소 선택 단계에서 받았던 위도, 경도 데이터를 기상청 API에 맞게 함수를 통해 변환한다.<br>
              &nbsp;&nbsp;2) 1번 과정을 한 번 거친 후 변환한 정보를 통해 기상청의 단기, 중기 정보를 가져온다.</dd>
 </ul>
 ![routeTable](./capture/routeTable.png)</li>
2. 회원가입 / register
3. 회원가입 / register    


>Way to Jeju <br>
>Website for helping visitors planning trip to Jeju island<br>
>work done by audiriley,lynring24, 최수연
<ul>
<li> weather forecast : local, every hour
<li> selecting route
<li> board
</ul>
