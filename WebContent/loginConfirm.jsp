<%@ page contentType="text/html; charset=utf-8" %>
<% 
	String memberId = (String)session.getAttribute("idKey");
	if(memberId == null){
%> 
	<script>
	  alert("등로되지 않은 회원정보입니다.");
	     location.href="loginForm.jsp";
	</script>
<%	}
	else{%>
	<script>
	  alert("즐거운 여행 되세요");
	     location.href="main.jsp";
	</script>
<%	}%>