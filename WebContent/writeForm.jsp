<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script>
	function check(){
		if(writeForm.title.value==""){
			alert("제목을 입력하세요");
			return false;
		}
		if(writeForm.content.value==""){
			alert("내용을 입력하세요.");
			return false;
		}
	}
</script>
<style> 
	@import url(css/writer.css)
</style>
</head>
<body>
 <hr>
 <form name="writeForm" action="write.jsp" method="Post" onsubmit="return check()" enctype="multipart/form-data">
	<table id="table">
	<tr>
		<td cols="2"><b>Title </b> <input type="text" name="title" size="30" ></td>
	</tr>
	</tr>
	<tr>
		<td cols="2"><b>Story </b><textarea name="content" rows="20" cols="40"></textarea></td>
	</tr>
	<tr>
		<td cols="2"><b>File </b> <input type="file"  name="file" size="30"></td>
	</tr>
   <tr> 
   		<td><button type="reset" id="cancel">Cancel</button><button type="submit" id="submit">Submit</button></td>
   </tr>
	</table>
	
</form>
</body>
</html>