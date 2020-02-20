<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<script src="../include/jquery-3.4.1.min.js"></script>
<style>
table{border: solid 1px black;
      border-radius:20px;
      width:100%;}
</style>
</head>
<body>
등록된 수강평 : ${map.count}명
<br>
<table>
<c:forEach var="dto" items="${map.list}">
<tr>
<td width="10%">${dto.name}</td>
<td width="80%">${dto.memo}</td>
<td width="10%">${dto.post_date}</td>
</tr>
</c:forEach>
</table>
</body>
</html>