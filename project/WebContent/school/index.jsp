<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<script src="../include/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script src="../js/join.js"></script>
<script src="../js/login.js"></script>
<script src="../js/nav.js"></script>
<script src="https://sdk.accountkit.com/en_US/sdk.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<link rel="stylesheet" href="../css/menu.css" />
<link rel="stylesheet" href="../css/login.css" />
<link rel="stylesheet" href="../css/carousel.css" />
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">
<%@ include file="../include/header.jsp" %>
<style>

@media(max-width:1023px){
   #main {width: auto;}
}
@media(max-width:767px){
   #main {width: auto;}
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
     <li><a href="#main"><img src="../images/brand.png" style="width:30px; height:30px;"></a></li>
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
     </ul> 
    </div><!-- navbar-nav -->
  </div>
 <div class="navbar-right">
    <div class="at-navbar-item"><a href="#modalLayer" class="modalLink">Sign IN </a></div>
    <div class="at-navbar-item"><a href="#modalLayer2" class="modalLink2"> Sign UP</a></div>
   <div class="at-navbar-item"><a href="#modalLayer3" class="modalLink3"><button type="button">관리자모드</button></a></div>
   </div>
</nav> 

<div id="modalLayer" align="center"> 
  <div class="modalContent">
  <span class="x" style="float:right"><button>X</button></span>
  <h4>Welcome to Korean Language School</h4>
  <form method="post" name="form1" id="form1" action="${path}/session_servlet/login.do">
  <table>
  <tr><td><button class="login"><img class="login_img" src="../images/facebook.jpg" width="30px" height="30px">FaceBook Log In</button></td></tr>
  <tr><td><button class="login"><img class="login_img" src="../images/google.jpg" width="30px" height="30px">google Log In</button></td></tr>
  <tr><td>--------------------or---------------------</td></tr>
  <tr><td>Email</td></tr>
  <tr><td><input class="login_box" id="email" name="email" placeholder="이메일을 입력하세요"></td></tr>
  <tr><td><!-- 경고 메시지 뜨는 곳 : 빨간색 글씨: email cannot be empty / 형식에 맞지 않습니다 ( 정규식 이용 )--></td></tr>
  <tr><td>Password</td></tr>
  <tr><td><input class="login_box" type="password" id="passwd" name="passwd" placeholder="비밀번호를 입력하세요"></td></tr>
  <tr><td><!-- 경고 메시지 뜨는 곳 : 빨간색 글씨: password cannot be empty 
  / password cannot less than 8 character / --></td></tr>
  <tr><td><button type="submit" id="btnLogin" class="btnLogin">로그인</button></td></tr>
  <tr><td class="forget"><a href="#">Forget Password</a></td></tr>
 <tr><td>  <br><div id="result"></div> <br></td></tr>
 <tr><td><br><br></td></tr>
  </table>
</form>
</div>
</div>

<div id="modalLayer2" align="center"> 
  <div class="modalContent2">
  <span class="x" style="float:right"><button>X</button></span>
  <h4>Welcome to Korean Language School</h4>
  <form name="join" onsubmit="return validate();" action="${path}/member_servlet/join.do" method="post">
  <table>
  <tr><td><button class="join"><img class="login_img" src="../images/facebook.jpg"  width="30px" height="30px">Facebook Sign In</button></td></tr>
  <tr><td><button class="join"><img class="login_img" src="../images/google.jpg"  width="30px" height="30px">google Sign In</button></td></tr>
  <tr><td>--------------------or---------------------</td></tr>
  <tr><td><input class="join_box" id="email" name="email" placeholder="email"></td></tr>
  <tr><td><!-- 경고 메시지 뜨는 곳 : 빨간색 글씨: email cannot be empty --></td></tr>
  <tr><td><input class="join_box" id="name" name="name" placeholder="name"></td></tr>
  <tr><td><!-- 경고 메시지 뜨는 곳 : 빨간색 글씨: email cannot be empty / 형식에 맞지 않습니다 ( 정규식 이용 )--></td></tr>
  <tr><td><input class="join_box" type="password" id="passwd" name="passwd" placeholder="password"></td></tr>
  <tr><td><!-- 경고 메시지 뜨는 곳 : 빨간색 글씨: password cannot be empty 
  / password cannot less than 8 character / --></td></tr>
  <tr><td><input class="join_box" type="password" id="passwd_confirm" name="passwd_confirm" placeholder="password confirm"></td></tr>
  <tr><td><!-- 경고 메시지 뜨는 곳 : 빨간색 글씨: password cannot be empty 
  / password cannot less than 8 character / --></td></tr>
  <tr><td><button class="btnSave" type="submit" id="btnSave">가입하기</button></td></tr>
  <tr><td class="forget"><a href="#">Forget Password</a></td></tr>
   <tr><td><br><br></td></tr>
  </table>
  </form>
</div>
</div>

<div id="modalLayer3" align="center"> 
  <div class="modalContent3">
  <span class="x" style="float:right"><button>X</button></span>
  <h4>관리자 모드입니다!</h4>
  <form method="post" name="form" id="form" action="${path}/managersession_servlet/login.do">
  <table>
  <tr><td>User ID</td></tr>
  <tr><td><input class="login_box" id="userid" name="userid" placeholder="아이디를 입력하세요"></td></tr>
  <tr><td><!-- 경고 메시지 뜨는 곳 : 빨간색 글씨: email cannot be empty / 형식에 맞지 않습니다 ( 정규식 이용 )--></td></tr>
  <tr><td>Password</td></tr>
  <tr><td><input class="login_box" type="password" id="passwd" name="passwd" placeholder="비밀번호를 입력하세요"></td></tr>
  <tr><td><!-- 경고 메시지 뜨는 곳 : 빨간색 글씨: password cannot be empty 
  / password cannot less than 8 character / --></td></tr>
  <tr><td><button type="submit" id="btnLogin2" class="btnLogin2">로그인</button></td></tr>
  <tr><td class="forget"><a href="#">Forget Password</a></td></tr>
 <tr><td>  <br><div id="result"></div> <br></td></tr>
 <tr><td><br><br></td></tr>
  </table>
</form>
</div>
</div>

<div id="main">
  <br>
    <br>
      <br>
 <div id="container">
    <div class="slide_wrap">
    
      <div class="slide_box">
        <div class="slide_list clearfix">
          <div class="slide_content slide01">
            <img class="img" src="../images/5.jpg" width="1000px" height="400px">
          </div>
          <div class="slide_content slide02">
            <img class="img" src="../images/2.jpg" width="1000px" height="400px">
          </div>
          <div class="slide_content slide03">
            <img class="img" src="../images/1.jpg" width="1000px" height="400px">
          </div>
          <div class="slide_content slide04">
            <img class="img" src="../images/4.jpg" width="1000px" height="400px">
          </div>
          <div class="slide_content slide05">
            <img class="img" src="../images/3.jpg" width="1000px" height="400px">
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

 
<div id="courses"><iframe src="courses.jsp"></iframe></div>
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
