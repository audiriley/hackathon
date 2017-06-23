<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<TABLE border="1" width="60%">
<TR>
<%
     for(int k=1;k<16;k++){
    	 if((k%4)==0){
%>
</tr>
<tr> 
			 
    <%
    	}
    %>
         <TD align=center>
         <img src="image/day.JPG"><%= k %></TD>
    <%
     }
     %>
</TR>

</TABLE>
 

</body>
</html>