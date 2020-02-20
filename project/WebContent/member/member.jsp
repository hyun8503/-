<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../include/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	list();
	$("#btnSave").click(function(){
		insert();
	});
});

function insert(){
	var param="email="+$("#email").val()
	+"&passwd="+$("#passwd").val()
	+"&name="+$("#name").val()
	+"&course="+$("#course").val();

	$.ajax({
		type: "post",
		url: "/project/member_servlet/join.do",
		data: param,
		success: function(){
			list();//회원목록 갱신
			//입력값 초기화
			$("#email").val("");
			$("#passwd").val("");
			$("#name").val("");
			$("#course").val("");
		}
	});
}

function list(){
	$.ajax({
		type: "post",
		url: "/project/member_servlet/list.do",
		success: function(result){
			console.log(result);//F12 개발자모드
			$("#memberList").html(result);
		}
	});
}

</script>
</head>
<body>
<div class="a">
<h2>회원관리</h2>
<table>
<tr><td colspan="2"><br></td></tr>
<tr><td>이 메 일 : </td><td><input id="email"></td></tr>
<tr><td>비밀번호 : </td><td><input type="password" id="passwd"></td></tr>
<tr><td>이      름 : </td><td><input id="name"></td></tr>
<tr><td>이 메 일 : </td><td><input id="course"></td></tr>
<tr><td colspan="2"><button type="button" id="btnSave">추가</button></td></tr>
<tr><td colspan="2"><br></td></tr>
</table>
<div id="memberList"></div>
</div>

</body>
</html>