<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(function(){
	list();
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
</script>
<style>
body {text-align:center;}
.wrapper {text-align:center; max-width:1100px; margin: auto;}
.table1 {border:0px none; text-align:center; margin: auto;}          
.img{width:200px; height:250px; border-radius:30px;}
</style>

</head>
<body>
<div class="wrapper">
<table class="table1">
<tr><td><img class="img" src="../images/teacher1.jpg"></td>
    <td><!-- width="800px" -->
<h2 style="color:orange">여러분의 TOPIK성적을 책임질 박용건 선생님입니다.</h2>
<br>서울대학교 경영학과 학사
<br>경희대학교 교육대학원 외국어로서의 한국어교육 석사
<br>現) 경희대학교 국제교육원 한국어 강의
<br>前) 호서대학교 유학생교육단 한국어 강의
<br>前) 대한무역투자진흥공사(KOTRA) 한국어 강의
<br>前) 한국과학기술연구원(KIST) 한국어 강의
<br>前) 삼성물산 외국인 임원 튜터링 수업
<br>前) 한국어능력시험(TOPIK) 채점위원</td>
</tr>
<tr><td colspan="2"><br><br></td>
<tr><td colspan="2">
<div class="result"></div></td></tr>
</table>
<br><br><br>
<table class="table1">
<tr><td><img class="img" src="../images/teacher2.jpg"></td>
    <td width="800px">
<h2 style="color:orange"> 안녕하세요! 이진경입니다!</h2>
<br>경희대학교 교육대학원 외국어로서의 한국어교육 석사
<br>경희대학교 일반대학원 국어국문학과 박사 수료
<br>現) 경희대학교 국제교육원 객원교수
<br>現) 경희대학교 국제교육원 한국어교육부 강의
<br>前) ㈜ 보이스텍, 음성 인식팀 DB 업무
<br>前) ㈜ 엠티컴, 음성 합성 객원 연구원
<br>저서 - 한국국제교류재단) 인도네시아인을 위한 종합한국어 중급 1,2</td>
</tr>
<tr><td colspan="2"><br><br></td>
<tr><td colspan="2"><div class="result"></div></td></tr>
</table>
</div>
</body>
</html>