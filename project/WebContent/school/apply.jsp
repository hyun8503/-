<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Gaegu|Gugi|Jua&display=swap" rel="stylesheet">
<script src="../include/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#btnApply").click(function(){
		document.course.submit();
	});	
});
</script>

</head>
<body>

<h2>수강신청</h2>
${sessionScope.message}<br>
${sessionScope.name}<br>
${sessionScope.email}<br>

<h4>수강하고 싶은 과정을 선택해 주세요!</h4>
<form name="corse" method="post" enctype="multipart/form-data" action="${path}/member_servlet/join1.do">
<input type="radio" name="course" id="course" value="초급한국어" checked="checked">초급한국어
<input type="radio" name="course" id="course" value="중급한국어">중급한국어
<input type="radio" name="course" id="course" value="고급한국어">고급한국어
<input type="radio" name="course" id="course" value="TOPIK 준비반">TOPIK 준비반
<input type="submit" value="수강신청" id="btnApply">
</form>
</body>
</html>