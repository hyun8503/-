<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../include/jquery-3.4.1.min.js"></script>
<%@ include file="../include/header.jsp" %>

<script type="text/javascript">
function view(email){
	document.form1.email.value = email;
	document.form1.submit();
}
</script>
<style>
.a{width:1000px; top:10%; margin:auto; padding: 100px; 20px;}
table{border: 1px black solid; width:800px; text-align:center;}
</style>
</head>
<body>
<div class="a">
등록된 회원수 : ${map.count}명
<table>
<c:forEach var="dto" items="${map.list}">
<tr>
<th width="25%">이메일</td>
<th width="25%">이름</th>
<th width="25%">수강과목</th>
<th width="25%">가입일자</th>
</tr>
<tr>
<td width="25%">${dto.email}</td>
<td width="25%">${dto.name}</td>
<td width="25%">${dto.course}</td>
<td width="25%">${dto.join_date}</td>
</tr>
</c:forEach>
</table>

<form name="form1" method="post" action="/project/member_servlet/view.do">
  <input type="hidden" name="email">
</form>
</div>
</body>
</html>