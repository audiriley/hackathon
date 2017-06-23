<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="id"/>
<jsp:setProperty name="user" property="password"/>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
</head>
<body>
 <%UserDAO userDAO = new UserDAO();
 	int result = userDAO.login(user.getId(),user.getPassword());
 	if(result ==1){
 		PrintWriter script = response.getWriter();
 		session.setAttribute("idKey",user.getId());
 		script.println("<script>");
 		script.println("location.href='main.jsp'");
 		script.println("</script>");
 	}
	if(result ==0){
 		PrintWriter script = response.getWriter();
 		script.println("<script>");
 		script.println("alert('잘못된 비밀번호입니다.')");
 		script.println("history.back()");
 		script.println("</script>");
 	}
	if(result ==-1){
 		PrintWriter script = response.getWriter();
 		script.println("<script>");
 		script.println("alert('존재하지 않은 아이디입니다.')");
 		script.println("history.back()");
 		script.println("</script>");
 	}
	if(result ==-2){
 		PrintWriter script = response.getWriter();
 		script.println("<script>");
 		script.println("alert('데이터베이스 오류가 발생했습니다.')");
 		script.println("history.back()");
 		script.println("</script>");
 	}
 %>
</body>
</html>