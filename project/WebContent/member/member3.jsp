<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>jQuery Mobile</title>
<link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<style type="text/css">
li {list-style: none;}
.picture {list-style: none; padding: 0; margin: 0;}
.picture li {float: left; width: 50%;}
.picture li a {display: block; margin: 5px; border: 1px}
.picture li img {display: block; width: 50%; height: auto;}
.picture li img:hover {
	display: block; width: 100%; height: auto;
}
#memberList {font-size:14px;}

</style>
<script type="text/javascript">
$(function(){
	list();
	$("#btnSave").click(function(){
		insert();
	});
});

function insert(){
	var param="userid="+$("#userid").val()
	+"&passwd="+$("#passwd").val()
	+"&name="+$("#name").val()
	+"&email="+$("#email").val()
	+"&hp="+$("#hp").val();

	$.ajax({
		type: "post",
		url: "/jsp02/member_servlet/join.do",
		data: param,
		success: function(){
			list();//회원목록 갱신
			//입력값 초기화
			$("#userid").val("");
			$("#passwd").val("");
			$("#name").val("");
			$("#email").val("");
			$("#hp").val("");
		}
	});
}

function list(){
	$.ajax({
		type: "post",
		url: "/jsp02/member_servlet/list.do",
		success: function(result){
			console.log(result);//F12 개발자모드
			$("#memberList").html(result);
		}
	});
}

$(function(){
	$("#btnUpdate").click(function(){
		//폼 데이터 제출할 주소
		document.form1.action="/jsp02/member_servlet/update.do";
		document.form1.submit();
	});
	$("#btnDelete").click(function(){
		if(confirm("삭제하시겠습니까?")){
			document.form1.action="/jsp02/member_servlet/delete.do";
			document.form1.submit();
		}
	});
});
</script>
</head>
<body>
<div data-theme="b">
  <div data-role="page" id="home">
    <div data-role="header" data-theme="b" data-position="fixed">
      <h1>독도 소개 앱</h1>
    </div>
    <div data-role="content" style="text-align: center;">
      <img src="images/bgdokdo1.png">
      <ul data-role="listview" data-inset="true">
        <li><a href="#intro">독도소개</a></li>
        <li><a href="#movie" data-rel="dialog">독도영상</a></li>
        <li><a href="#wizard3-1" data-rel="dialog">독도음악</a></li>
        <li><a href="#gallery">독도사진</a></li>
        <li><a href="#member">회원가입</a> </li>
      </ul>
    </div>
    <div data-role="footer" data-position="fixed" data-theme="b">
      <h1>독도사랑_홍길동</h1>
    </div>
  </div>
  
  <div data-role="page" id="intro" data-theme="b">
    <div data-role="header" data-theme="b" data-position="fixed">
      <a href="#home" data-icon="arrow-l" 
      data-direction="reverse">처음</a>
      <h1>독도 소개</h1>
    </div>
    <div data-role="content">
      <div style="text-align: center;">
        <img src="images/bgdokdo2.png">
      </div>
      <div data-role="collapsible-set" data-theme="b" 
      data-content-theme="a">
        <div data-role="collapsible" data-collapsed="false">
          <h3>독도역사</h3>
          <p>독도(獨島)라는 명칭은 한국어와 중국어 화자들이 일반적으로
          사용하는 이름이다. 인도유럽어권에서는 리앙쿠르 바위섬,
          일본어권에서는 다케시마 섬이라 부른다. 20세기 초까지는 독도,
          석도 또는 마쓰시마라고 불리었다. ...생략</p>
        </div>
        <div data-role="collapsible">
          <h3>독도지리</h3>
          <p>독도는 주로 두 개의 섬으로 이루어지며 150미터 떨어진
          두 섬은 동도와 서도로 불린다. 약 90개의 섬과 암초로
          이루어진 신생대 화산암으로 구성되어 있다. 도고는 동경
          약 131º 52´ 위도 약 37도 14분에 위치한다. ...생략</p>
        </div>
        <div data-role="collapsible">
          <h3>독도생활</h3>
          <p>900명이 넘는 한국인 시민들이 이 섬에 거주하며, 실제로
          영구거주를 하는 사람은 단 두 사람이다. 한국정부는 거주 주장을
          하기 위해 이들에게 보조금을 지불하고 있다. ...생략</p> 
        </div>
      </div>
    </div>
    <div data-role="footer" data-position="fixed" data-theme="b">
      <h1>독도사랑_홍길동</h1>
    </div>
  </div>
  
  <div data-role="page" id="movie" data-theme="b">
    <div data-role="header" data-position="fixed" data-theme="b">
       <h1>독도 영상</h1>
    </div>
    <div data-role="content">
      <div class="ui-bar ui-bar-a">외교부 독도 소개 동영상</div><br>
      <li><iframe width="100%" src="http://www.youtube.com/embed/muB4_LNZ2Rk"></iframe>
      </li><br>
      <div class="ui-bar ui-bar-a">플래시몹(서울역광장)동영상</div><br>
      <li><video controls="controls" width="100%" preload="metadata">
        <source src="media/mop.mp4" type="video/mp4">
      </video></li>
    </div>
    <div data-role="footer" data-position="fixed" data-theme="b">
    </div>
  </div>
  
  <div data-role="page" id="wizard3-1">
    <div data-role="header">
      <h1>독도 노래1</h1>
    </div>
    <div data-role="content">
      <div class="ui-bar ui-bar-a">홀로 아리랑</div><br>
      <audio controls width="100%" preload="metadata">
        <source src="media/arirangalone.mp3" type="audio/mp3">
      </audio>
      <img src="images/3-1.jpg" width="100%">
    </div>
    <div data-role="footer">
      <a href="#home" data-direction="reverse">이전</a>
      <a href="#wizard3-2" data-rel="dialog" 
      data-transition="slider">다음</a>
    </div>
  </div>
  
  <div data-role="page" id="wizard3-2">
    <div data-role="header">
      <h1>독도 노래2</h1>
    </div>
    <div data-role="content">
      <div class="ui-bar ui-bar-a">독도는 우리땅</div><br>
      <audio controls width="100%" preload="metadata">
        <source src="media/dockdo.mp3" type="audio/mp3">
      </audio>
      <img src="images/3-2.jpg" width="100%">
    </div>
    <div data-role="footer">
      <a href="#wizard3-1" data-direction="reverse">이전</a>
      <a href="#home">처음</a>
    </div>
  </div>
  
  <div data-role="page" id="gallery" data-theme="b">
    <div data-role="header" data-position="fixed" data-theme="b">
      <a href="#home" data-icon="arrow-l" 
      data-direction="reverse">처음</a>
      <h1>독도 갤러리</h1>
    </div>
    <div data-role="content">
      <ul class="picture">
        <li><a href="images/4-1.jpg" rel="external">
        <img src="images/4-1.jpg"></a></li>
        <li><a href="images/4-2.jpg" rel="external">
        <img src="images/4-2.jpg"></a></li>
        <li><a href="images/4-3.jpg" rel="external">
        <img src="images/4-3.jpg"></a></li>
        <li><a href="images/4-4.jpg" rel="external">
        <img src="images/4-4.jpg"></a></li>
        <li><a href="images/4-5.jpg" rel="external">
        <img src="images/4-5.jpg"></a></li>
        <li><a href="images/4-6.jpg" rel="external">
        <img src="images/4-6.jpg"></a></li>
        <li><a href="images/4-7.jpg" rel="external">
        <img src="images/4-7.jpg"></a></li>
        <li><a href="images/4-8.jpg" rel="external">
        <img src="images/4-8.jpg"></a></li>
        <li><a href="images/4-9.jpg" rel="external">
        <img src="images/4-9.jpg"></a></li>
        <li><a href="images/4-10.jpg" rel="external">
        <img src="images/4-10.jpg"></a></li>
        <li><a href="images/4-11.jpg" rel="external">
        <img src="images/4-11.jpg"></a></li>
        <li><a href="images/4-12.jpg" rel="external">
        <img src="images/4-12.jpg"></a></li>
      </ul>
    </div>
    <div data-role="footer" data-position="fixed" data-theme="b">
      <h1>독도사랑_홍길동</h1>
    </div>
  </div>
  
    <div data-role="page" id="member" data-theme="b">
    <div data-role="header" data-theme="b" data-position="fixed">
      <a href="#home" data-icon="arrow-l" 
      data-direction="reverse">처음</a>
      <h1>독도 소개</h1>
    </div>
    <div data-role="content">
      <div style="text-align: center;">
        <img src="images/bgdokdo2.png">
      </div>
      <div data-role="collapsible-set" data-theme="b" 
      data-content-theme="a">
        <div data-role="collapsible" data-collapsed="false">
          <h3>회원목록</h3>
				<div id="memberList"></div>
        </div>
        <div data-role="collapsible">
          <h3>회원가입</h3>
          <p>
		           아이디 : <input id="userid">
						비번 : <input type="password" id="passwd"><br>
						이름 : <input id="name">
						이메일 : <input id="email"><br>
						핸드폰 : <input id="hp">
						<button type="button" id="btnSave">추가</button>
          </p>
        </div>
      </div>
    </div>
    <div data-role="footer" data-position="fixed" data-theme="b">
      <h1>독도사랑_홍길동</h1>
    </div>
  </div>
  
</div>
</body>
</html>