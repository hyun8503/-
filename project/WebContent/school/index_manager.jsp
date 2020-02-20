<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
 <%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="../css/menu.css" />
<link rel="stylesheet" href="../css/index_manager.css" />

<style>
/* div{border: 1px solid black;} */
@media(max-width:1023px){
   #main {width: auto;}
}
@media(max-width:767px){
   #main {width: auto;}
}

nav {z-index:999;}
</style>
<script type="text/javascript">
$(function(){
	$("#logout").click(function(){
		location.href="${path}/managersession_servlet/logout.do";
	});
});
</script>
</head>
<style>#a{width:100%; margin:auto;}</style>
<body>
<div id="a">
 <nav id="navbar" class="navbar">
  <div class="navbar-left">
<!--div1:메뉴 --><div class="navbar-nav">
     <ul class="menu">
     <li><img src="../images/brand.png" style="width:30px; height:30px;"></li>
     <li><a href="manage_main.html" target="section">HOME</a></li>
     <li><<a href="../classroom/basic_manager.jsp" target="section">초급한국어</a></li>
     <li><a href="../classroom/inter_manager.jsp" target="section">중급한국어</a></li>
     <li><a href="../classroom/advan_manager.jsp" target="section">고급한국어</a></li>
     <li><a href="../classroom/topik_manager.jsp" target="section">TOPIK</a></li>
     <li><a href="../member/member.jsp" target="section">회원관리</a></li>
     </ul> 
    </div><!-- navbar-nav -->
  </div>
  <span style="float:right; padding: 5px 5px;"><button class="logout" id="logout">로그아웃</button>&nspn;</span> 
</nav> 

<div id="section">
<section>
<iframe src="manage_main.html" name="section"></iframe>
</section>
</div>

<div id="contact">
<table class="contact">
<tr><td colspan="2"><br><br></td><tr>
<tr><td class="con1" style="float:left">
<table>
<tr><td colspan="2"><img src="../images/phone.png" class="con">연락처: 02-441-6006</td></tr>
<tr><td colspan="2"><img src="../images/email.png" class="con">seoul@gmai.com</td></tr>
<tr><td colspan="2"><img src="../images/address.png" class="con">주소: 서울특별시 성동구 왕십리도선동 무학로2길 54</td></tr>
</table>
</td>
<td width="300px"><iframe id="map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3163.8115234141856!2d127.12999831499447!3d37.535939979803665!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357caffdcecf695b%3A0x603aec7a4dedeb7f!2z6rCV64-Z7Jet!5e0!3m2!1sko!2skr!4v1582067159074!5m2!1sko!2skr"></iframe></td>
<tr><td colspan="2"><br><br></td><tr>
</table>
</div>
</div>
</div>
<footer>© Korean Language School, Inc. <a href="terms_of_service.html">Privacy And Terms</a></sapn></footer>
</body>
</html>