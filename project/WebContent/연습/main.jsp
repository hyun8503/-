<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/session_check.jsp" %>
<script type="text/javascript">
$(function(){
	$("#btnLogout").click(function(){
		location.href="${path}/session_servlet/logout.do";
	});
});
</script>
</head>
<body>
      <a href="../school/index_student.jsp">세션페이지2로이동</a>
      <h4 style="color: white;">${sessionScope.message}</h4>
      <span style="color: white;">${sessionScope.name}님이 접속중입니다.</span>
      <button type="button" id="btnLogout">Logout</button>

</body>
</html>
    