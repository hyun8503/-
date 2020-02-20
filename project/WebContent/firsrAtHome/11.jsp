<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Insert title here</title>
<style>
/* unset이 뭐지? 
   padding: 위/아래   양옆 */
body{font-family: sans-serif;}
button{all:unset; background-color:steelblue; color:white; padding: 5px 20px; 
       border-radius:5px; cursor:pointer;}
.modal{positon: fixed; 
       top: 0;
       left: 0;
       width:100%; 
       height:100%;
       display: flex;
       justify-content: center;
       align-items: center; }
.modal_overlay{
               background-color: rgba(0,0,0,0.6); 
               width:100%; 
               height:100%;
               position: absolute; 
               }
.modal_content{background-color: white;
               padding: 50px 100px; 
               text-align:center;
               position:relative; 
               border-radius: 10px;
               width: 10%;
               box-shadow: 0 10px 20px; rgba(0,0,0,0.19), 0 6px 6px, rgba(0,0,0,0.23);}
h1{margin:0;}
.hidden{display:none;}
</style>
</head>
<body>
<button id="open">open modal</button>
<div class="modal hidden">
  <div class="modal_overlay"></div> <!-- 다른 창을 어둡게 하는 효과 -->
  <div class="modal_content">
   <h1>I'm a modal</h1>
   <button>X</button>
  </div>
</div> 
  <script>
    const openButton = document.getElementById("open");
    const modal = document.querySelector(".modal");
    const overlay = modal.querySelector(".modal_overlay");
    const closeBtn = modal.querySelector("button");
    const openModal =  () => {
    	modal.classList.remove("hidden");
    }
    const closeModal = () => {
    	modal.classList.add("hidden");
    }
    
    overlay.addEventListener("click", closeModal);
    closeBtn.addEventListener("click", closeModal);
    openButton.addEventListener("click", openModal);
  </script>
</body>
</html>