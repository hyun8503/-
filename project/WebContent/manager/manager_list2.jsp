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
</head>
<body>

등록된 회원수 : ${map.count}명
<table border="1" width="100%">
  <tr>
    <th>이름</th>
    <th>아이디</th>
    <th>가입일자</th>

  </tr>
  <c:forEach var="dto" items="${map.list}">
  <tr>
    <td>
    <!-- ${dto.userid} 에서 dto에 있는 userid라는 private
    멤버변수를 호출하는게 아니라 내부적으로 getter메소드인
    getUserid()가 자동으로 호출되는 메카니즘이 되어있다. -->
      <a href="#" onclick="view('${dto.email}')">${dto.name}</a>
    </td>
    <td>${dto.email}</td>
    <td>${dto.join_date}</td>


  </tr>
  </c:forEach>
</table>

<form name="form1" method="post" 
action="/project/member_servlet/view.do">
  <input type="hidden" name="email">
</form>


</body>
</html>