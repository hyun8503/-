<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>로그인</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <%@ include file="../include/header.jsp" %>
  <c:if test="${param.message == 'error' }">
    <script>
      alert("아이디 또는 비밀번호가 일치하지 않습니다.")
    </script>
</c:if>
<c:if test="${param.message == 'logout' }">
    <script>
      alert("로그아웃되었습니다.");
    </script>
</c:if> 
<style>
.a{width:500px; height:500px; border-radius:5px; top:10%; margin:auto; background-color:white; color:black;}
body{background-color:#010A43; color:white; text-align:center;}
.table{padding: 5% 20%;}
.error{color:#FF2E63;}
button{background-color:#FF2E63;}
</style> 
</head>

<body> 
<div class="a">
<br><br>
<h2>관리자 로그인</h2>
<form method="post" name="form1" id="form1" action="${path}/managersession_servlet/login.do">
<div class="table">
<table>
  <tr>
    <td>아이디</td>
    <td><input name="userid"></td>
  </tr>
  <tr>
    <td>비밀번호</td>
    <td><input type="password" name="passwd"></td>
  </tr>
  <tr>
    <td colspan="2"><br><br></td>
  </tr>
  <tr>
    <td colspan="2" align="right">
      <input type="submit" value="로그인">
    </td>
  </tr>
  <tr>
    <td colspan="2" class="error"><br>아이디 / 비밀번호가 일치하지 않습니다.<br>다시 입력하여 주십시오.</td>
  </tr>
    <tr>
    <td colspan="2" class="error"><br><a href="../school/index.jsp"><button type="button">홈으로 가기</button></a></td>
  </tr>
</table>
</div>
</body>
</html>
    