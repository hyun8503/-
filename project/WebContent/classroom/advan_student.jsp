<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>초급한국어</title>
<link rel="stylesheet" href="classroom.css" />
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	list();
	list2();
});

function list(){
	$.ajax({
		type:"post",
		url:"/project/memo_servlet/list.do",
		success: function(result){
			$(".result").html(result);
		}
	});
}

function list2(){
	$.ajax({
		type:"post",
		url:"/project/board_servlet/list.do",
		success: function(result){
			$(".result2").html(result);
		}
	});
}

</script>
<style>
.a{width:1000px; top:10%; margin:auto;}
</style>
</head>
<body>
<div class="a">
<table>
<tr><td colspan="2" class="class_name">초급한국어</td></tr>
<tr><td><img class="class_img" src="../images/teacher1.jpg"></td><td style="float:right;"><a href="https://zoom.us/j/967518124"><button class="class">교실들어가기</button></a></td></tr>
<tr><td colspan="2" >박용건 선생님 <br>수업시간: 화 pm7-9</td></tr>
<tr><td colspan="2"><br><div class="box">수업내용</div></td></tr>
<tr><td colspan="2"><br>인사하기, 자기 소개하기, 물건 사기, 음식 주문하기, 길 묻기, <br>
 약속하기 등의 가장 기초적인 일상생활 회화와 가족,취미,여행 등의 <br>
 친숙한 일상생활 주제에 대해 이야기 하고 관련된 표현을 학습한다. <br><br>
</td></tr>
<tr><td colspan="2" class="back"><a href="../school/students_view.jsp">뒤로가기</a></td></tr><br>
<tr><td colspan="2">
<form method="post" name="form2" id="form2" action="${path}/memo_servlet/insert.do">
<table class="memo" border="0">
<tr><td>이름</td><td><input id="name" name="name"></td></tr>
<tr><td>메모</td><td><input id="memo" name="memo" size="40"></td></tr>
<tr><td colspan="2"><input type="button" id="btnSave" value="수강평 남기기"></tr>
</table>
</form>
<div class="result"></div></td></tr>
<tr><td colspan="2">
<div class="result2"></div></td></tr>
</table>
<br><br><br>
</div>
</body>
</html>