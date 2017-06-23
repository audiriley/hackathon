<%@ page contentType="text/html; charset=utf-8" %>
<% 
	String memberId = (String)session.getAttribute("idKey");
	if(memberId == null){
%> 
	<script>
	  alert("등록되지 않은 회원정보입니다.");
	     location.href="login.jsp";
	</script>
<%	}
	else{%>
	<script>
	  var rs = confirm("<%=memberId%>님 여행을 계속 하시겠습니까?");
	     if(rs==true) 
	    	 location.href="main.jsp";
	     else 
	    	 location.href="logout.jsp";
	</script>
<%	}%>