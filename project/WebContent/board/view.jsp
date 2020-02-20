<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	comment_list();
	$("#btnList").click(function(){
		location.href="${path}/board_servlet/list.do";
	});
	
});
</script>
<style>
body{background-color:#010A43;text-align:center;}
.a{position:fixed; width:800px; height:500px; border:none; border-radius:5px; top:300px; margin:auto; background-color:white; color:black;}
table{top: 20px; padding:20px 20px; width:600px; margin:auto; text-align:center;}
button{background-color:#FF2E63; color:white; border-radius:5px;}

</style>
</head>
<body>
<div class="wrapper">
<div class="a">
<h2>수업 자료실</h2>
<form name="form1" method="post">
<table border="1">
  <tr>
    <td>날짜</td>
    <td>${dto.reg_date}</td>
    <td>조회수</td>
    <td>${dto.readcount}</td>
  </tr>
  <tr>
    <td>이름</td>
    <td colspan="3">${dto.writer}</td>
  </tr>
  <tr>
    <td>제목</td>
    <td colspan="3">${dto.subject}</td>
  </tr>
  <tr>
    <td>본문</td>
    <td colspan="3">${dto.content}</td>
  </tr>
    <tr><td>첨부파일</td>
    <td colspan="3">
      <c:if test="${dto.filesize > 0}">
        ${dto.filename}( ${dto.filesize} bytes )
        <a href="${path}/board_servlet/download.do?num=${dto.num}">[다운로드]</a>
      </c:if>
    </td>
  </tr>
  <tr><td colspan="4"><a href="../school/index_student.jsp"><button type="button">뒤로가기</button></a></td></tr>
</table>
</form>
</div>
</div>


</body>
</html>