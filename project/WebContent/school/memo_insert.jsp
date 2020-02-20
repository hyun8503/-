<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <%@ include file="../include/header.jsp" %>
<script type="text/javascript">
$(function(){
	list();
	$("#btnSave").click(function(){
		insert();
	});
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

function insert(){
	var param="name="+$("#name").val()
	+"&memo="+$("#memo").val();

	$.ajax({
		type: "post",
		url: "/project/memo_servlet/insert.do",
		data: param,
		success: function(){
			list();
			$("#name").val("");
			$("#memo").val("");
		}
	});
}
</script>
</head>
<body>
<form method="post" name="form2" id="form2" action="${path}/memo_servlet/insert.do">
<table class="memo" border="0">
<tr><td>이름</td><td><input id="name" name="name"></td></tr>
<tr><td>메모</td><td><input id="memo" name="memo" size="40"></td></tr>
<tr><td colspan="2"><input type="button" id="btnSave" value="수강평 남기기"></tr>
</table>
</form>
<div class="result"></div>
</body>
</html>