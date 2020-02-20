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
	$("#btnSave").click(function(){
		document.form1.submit();
	});
	$("#back").click(function(){
		location.href="${path}/classroom/basic_manager.jsp";
	});
	
});
</script>

<style>
body{overflow-y:hidden; font-family: 'Jua',sans-serif;}
.a{background-color:#FF2E63; padding:350px 200px; width:900px; height:500px;margin:auto; }
.wrapper{positin:sticky; ailgn:center; width:800px; height:400px; border-radius:5px; margin:auto; padding: 30px 30px; background-color:white;}
.b{width:200px;}
#buttonbtnSave{background-color:#FF2E63; color:white; border-radius:5px;}

</style>

</head>
<body>
<div class="a">
<div class="wrapper">
<h2>글쓰기</h2>
<form name="form1" method="post" enctype="multipart/form-data" action="${path}/board_servlet/insert.do">
<table>
  <tr>
    <td class="b">이름</td>
    <td><input name="writer" id="writer"></td>
  </tr>
  <tr>
    <td class="b">제목</td>
    <td><input name="subject" id="subject" size="60"></td>
  </tr>
  <tr>
    <td class="b">본문</td>
    <td><textarea rows="5" cols="60" 
    name="content" id="content"></textarea></td>
  </tr>
  <tr>
    <td class="b">첨부파일</td>
    <td><input type="file" name="file1"></td>
  </tr>
  <tr>
    <td class="b">비밀번호</td>
    <td><input type="password" name="passwd" id="passwd"></td>
  </tr>
  <tr>
    <td colspan="2" align="center">
      <input type="button" value="확인" id="btnSave">&nbsp;<input type="button" value="뒤로가기" id="back">
    </td>
  </tr>
</table>
</form>
</div>
</div>
</body>
</html>