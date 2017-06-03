<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="memMgr" class="db.MemberMgr"/>
<%
	String id=""; String pass="";
	  request.setCharacterEncoding("euc-kr");
	 if(request.getParameter("id") != null)  
		 id = request.getParameter("id");
	 if(request.getParameter("pass") != null) 
		   pass  = request.getParameter("pass");

	  boolean result = memMgr.loginMember(id,pass);
	  if(result){
	    session.setAttribute("idKey",id); // 세션에 사용자의 id를 idKey라는 이름으로 저장해둔다. 
%>
<script> 
      location.href="loginConfirm.jsp";
	</script>
<%	}else{ %>
	<script>
	  alert("등록되지 않은 회원입니다.");
      location.href="loginForm.jsp";
	</script>
<%	}	%>