<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/session_check.jsp" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<script src="../include/jquery-ui.min.js"></script>
<script src="../include/jquery-3.4.1.min.js"></script>
<script src="../js/carousel.js"></script>
<script src="https://sdk.accountkit.com/en_US/sdk.js"></script>
<link rel="stylesheet" href="../css/menu.css" />
<link rel="stylesheet" href="../css/carousel.css" />
<link rel="stylesheet" href="../css/student_info.css" />
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Do+Hyeon|Gaegu|Gugi|Jua&display=swap" rel="stylesheet">
<style>
/* div{border: 1px solid black;} */
@media(max-width:1023px){
   #main {width: auto;}
}
@media(max-width:767px){
   #main {width: auto;}
   #container{display:none;}   
}

nav {z-index:999;}


</style>

</head>

<body>
<div id="mask"></div>
 <nav id="navbar" class="navbar">
  <div class="navbar-left">
<!--div1:메뉴 --><div class="navbar-nav">
     <ul class="menu">
     <li><img src="../images/brand.png" width="30px" height="30px"></li>
     <li><a href="#" id="menu">MENU</a>
       <ul>
         <li><a href="#courses">COURSES</a></li>
         <li><a href="#teachers">TEACHERS</a></li>
         <li><a href="#contact">CONTACT</a></li>     
       </ul></li>
     <li><a href="#main">HOME</a></li>
     <li><a href="#courses">COURSES</a></li>
     <li><a href="#teachers">TEACHERS</a></li>
     <li><a href="#contact">CONTACT</a></li>
     <li><a href="apply.jsp" target="main">APPLY<img src="../images/notes.png" width="20px" height="20px"></a></li>
     </ul> 
    </div><!-- navbar-nav -->
  </div>
   <div class="navbar-right"><div class="at-navbar-item">
  

<script type="text/javascript">
$(function(){
	$("#btnLogout").click(function(){
		location.href="${path}/session_servlet/logout.do";
	});
});
</script>
  
    <button id="open">${sessionScope.message}</button>
</div></div>
</nav> 
    <div class="modal hidden">
    <div class="modal_content">  
    <span style="float:right"><button id="button">X</button></span>
    <br>
     ${sessionScope.message}
     <p><a href="students_view.jsp"><button type="button" id="button2">내 강의실 가기</button></a></p>
     <p>
     <p><button type="button" id="btnLogout">Logout</button></p>
     <br><br>
    </div></div>
  <script>
    const openButton = document.getElementById("open");
    const modal = document.querySelector(".modal");
    const closeBtn = modal.querySelector("#button");
    const openModal =  () => {modal.classList.remove("hidden");}
    const closeModal = () => {modal.classList.add("hidden");}
    closeBtn.addEventListener("click", closeModal);
    openButton.addEventListener("click", openModal);
  </script>
    
    
<div id="main">
  <br>
    <br>
      <br>
 <div id="container">
    <div class="slide_wrap">
      <div class="slide_box">
        <div class="slide_list clearfix">
          <div class="slide_content slide01">
            <img class="img" src="../images/1.jpg" width="1000px" height="400px">
          </div>
          <div class="slide_content slide02">
            <img class="img" src="../images/2.jpg" width="1000px" height="400px">
          </div>
          <div class="slide_content slide03">
            <img class="img" src="../images/3.jpg" width="1000px" height="400px">
          </div>
          <div class="slide_content slide04">
            <img class="img" src="../images/4.jpg" width="1000px" height="400px">
          </div>
          <div class="slide_content slide05">
            <img class="img" src="../images/5.jpg" width="1000px" height="400px">
          </div>
        </div><!-- // .slide_list -->
      </div><!-- // .slide_box -->
      <div class="slide_btn_box">
        <button type="button" class="slide_btn_prev"> prev </button>
        <button type="button" class="slide_btn_next"> next </button>
      </div><!-- // .slide_btn_box -->
      <ul class="slide_pagination"></ul><!-- // .slide_pagination : 페이징, 페이지 매김 : 개별 페이지로 나누는 프로세스-->
    </div><!-- // .slide_wrap -->
  </div><!-- // .container -->
 <script src="../js/carousel.js"></script>


<div id="courses"><iframe src="students_view.jsp"></iframe></div>
<div id="teachers"><iframe src="teachers.jsp"></iframe></div>

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

<footer>© Korean Language School, Inc. <a href="terms_of_service.html">Privacy And Terms</a></sapn></footer>
</body>
</html>
