<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<%@ page import="conn.ConnectionContext, java.util.*, java.sql.*, java.text.*"%>
<%	
	String NAME[][]= new String[12][50];
	String ADDR[]= {"구좌읍","남원읍","대정읍","서귀포시","성산읍","안덕면","우도면","제주시","조천읍","표선면","한경면","한림읍"};
	try{
       		Connection conn = ConnectionContext.getConnection();
        	Statement stmt = conn.createStatement();
        	ResultSet rs=null;
        	for(int i=0;i<ADDR.length;i++){
        		String strSQL = "SELECT NAME FROM tour where ADDR='"+ADDR[i]+"'";
        		 rs= stmt.executeQuery(strSQL);
        		for(int j=0;rs.next();j++){
        			NAME[i][j]=new String(rs.getString("NAME"));
        		}
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
    <script src="js/mapApi.js"></script>
    <style>
    @import url("css/map.css");
    </style>
    <script>
    var ul2 = document.getElementById("ul2");
    var child = ul2.firstElementChild;
	var NAME = new Array();
    for(var i=0;i<ul2.childElementCount;child=child.nextElmentSibling){
		child.onclick=function (){
		}
     }//end of for 
    </script> 
  </head>
  <body>
  <form name="mapForm" action="mapControl.jsp" method="post">
<ul id="ul1">
	<% for(int i=0;i<12;i++){ %>
	<li><%=i%>
    		<ul id="ul2">
 					<% for(int j=0;j<12;j++){ %>
 					<li><%=ADDR[j]%>
 								<ul id="ul3">
 									<%for(int k=0;k<NAME[j].length;k++){%>
	   									<li><%=NAME[j][k]%></li>
   									<%}%>
    							</ul>
    				</li>
 					<%}%>
    		</ul>	
		
    </li>
    <%}%>
</ul>    
   <div id="map"></div>
   </form>
  </body>
</html>