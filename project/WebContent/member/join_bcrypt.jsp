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
	$("#btnJoin").click(function(){
		var param="userid="+$("#userid").val()
		+"&passwd="+$("#passwd").val()
		+"&name="+$("#name").val()
		+"&email="+$("#email").val()
		+"&hp="+$("#hp").val();
		$.ajax({
			type: "post",
			url: "/jsp02/member_servlet/join_bcrypt.do",
			data: param,
			success: function(result){
				alert("추가되었습니다.");
			}
		});
	});
});
</script>
</head>
<body>
<h2>회원가입과 로그인(BCrypt 방식)</h2>
아이디 : <input id="userid"><br>
비번 : <input type="password" id="passwd"><br>
이름 : <input id="name"><br>
이메일 : <input id="email"><br>
휴대폰 : <input id="hp"><br>
<button id="btnJoin">회원가입</button>
</body>
</html>