<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberDTO" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../include/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#btnUpdate").click(function(){
		//폼 데이터 제출할 주소
		document.form3.action="/project/member_servlet/update.do";
		document.form3.submit();
	});
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form3.action="/project/member_servlet/delete.do";
			document.form3.submit();
		}
	});
});

</script>
</head>
<body>
<%
MemberDTO dto=(MemberDTO)request.getAttribute("dto");
%>
<form name="form3" method="post">
<table border="1">
  <tr>
    <td>이메일</td>
    <td><%=dto.getEmail() %></td>
  </tr>
  <tr>
    <td>비밀번호</td>
    <td><input type="password" name="passwd" 
    value="<%=dto.getPasswd()%>"></td>
  </tr>
  <tr>
    <td>이름</td>
    <td><input name="name" value="<%=dto.getName()%>"></td>
  </tr>
  <tr>
    <td>수강 과목</td>
    <td><%=dto.getCourse() %></td>
  </tr>
  <tr>
    <td>회원가입일자</td>
    <td><%=dto.getJoin_date()%></td>
  </tr>

  <tr>
    <td colspan="2" align="center">
      <!-- userid가 반드시 필요하기 때문에 hidden 타입으로 넘긴다. -->
      <input type="hidden" name="email" value="<%=dto.getEmail()%>">
      <button type="button" id="btnUpdate">수정</button>
      <button type="button" id="btnDelete">삭제</button>
    </td>
  </tr>
</table>
</form>
</body>
</html>