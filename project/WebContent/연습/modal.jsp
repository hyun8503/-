<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> New Document </title>
<meta charset="UTF-8">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type='text/javascript' src='js/jquery.simplemodal.js'></script>
 <script type="text/javascript">
$(document).ready(function(){
 $("#open").click(function(){
  $("#modal_content").modal(); 
 });

 $("#m_close").click(function(){
  $.modal.close();
 });
}); 
</script>
<style>
#simplemodal-overlay {background-color:#000;}
#modal_content{display:none;margin:50 auto;width:200px;height:100px;background:blue;color:#fff}
</style>
</head>
<body>
<div id="content">
 모달팝업 테스트<input type="button" value="팝업" id="open">
</div> 
</body>
</html>

<div id="modal_content">
 팝업내용<input type="button" value="닫기" id="m_close">
</div> 


