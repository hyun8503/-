 function wrapWindowByMask(){
        //화면의 높이와 너비를 구한다.
        var maskHeight = $(document).height();  
        var maskWidth = $(window).width();  

        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
        $('#mask').css({'width':maskWidth,'height':maskHeight});  

        //애니메이션 효과 - 일단 1초동안 까맣게 됐다가 80% 불투명도로 간다.
        $('#mask').fadeIn("fast");      
        $('#mask').fadeTo("slow",0.5);    

        //윈도우 같은 거 띄운다.
        $('.navbar').show();
    }
 
$(document).ready(function(){
	  var modalLayer = $("#modalLayer");
	  var modalLink = $(".modalLink");
	  var modalCont = $(".modalContent");
	  var marginLeft = modalCont.outerWidth()/2;
	  var marginTop = modalCont.outerHeight()/2;
	  var mask = $("#mask");

	  modalLink.click(function(){
		    wrapWindowByMask();
		    modalLayer.fadeIn("slow", function(){
				$("#modalLayer2").fadeOut('fast');
		        $("#modalLayer3").fadeOut('fast');});
		    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
		    $(this).blur();
		    $(".modalContent > login").focus();
		    return false;
		  });

	  $(".modalContent > span").click(function(){
	    modalLayer.fadeOut("slow");
	    mask.fadeOut("slow");
	    modalLink.focus();
	  });	  
	});
	
$(document).ready(function(){
	  var modalLayer2 = $("#modalLayer2");
	  var modalLink2 = $(".modalLink2");
	  var modalCont2 = $(".modalContent2");
	  var marginLeft2 = modalCont2.outerWidth()/2;
	  var marginTop2 = modalCont2.outerHeight()/2; 
	  var mask = $("#mask");

	  modalLink2.click(function(){
		wrapWindowByMask();
	    modalLayer2.fadeIn("slow", function(){
			$("#modalLayer").fadeOut('fast');
			$("#modalLayer3").fadeOut('fast');});
	    modalCont2.css({"margin-top" : -marginTop2, "margin-left" : -marginLeft2});
	    $(this).blur();
	    $(".modalContent2 > login").focus();
	    return false;
	  });

	  $(".modalContent2 > span").click(function(){
	    modalLayer2.fadeOut("slow");
	    mask.fadeOut("slow");
	    
	  });		
	});

$(document).ready(function(){
	  var modalLayer3 = $("#modalLayer3");
	  var modalLink3 = $(".modalLink3");
	  var modalCont3 = $(".modalContent3");
	  var marginLeft3 = modalCont3.outerWidth()/2;
	  var marginTop3 = modalCont3.outerHeight()/2; 
	  var mask = $("#mask");

	  modalLink3.click(function(){
		wrapWindowByMask();
	    modalLayer3.fadeIn("slow", function(){
			$("#modalLayer").fadeOut('fast');
			$("#modalLayer2").fadeOut('fast');});
	    modalCont3.css({"margin-top" : -marginTop3, "margin-left" : -marginLeft3});
	    $(this).blur();
	    $(".modalContent3 > login").focus();
	    return false;
	  });

	  $(".modalContent3 > span").click(function(){
	    modalLayer3.fadeOut("slow");
	    mask.fadeOut("slow");
	    
	  });		
	});


