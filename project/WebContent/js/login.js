/**
 * 
 */
$(function(){
	$("#btnLogin").click(function(){
		var param="email="+$("#email").val()
		+"&passwd="+$("#passwd").val();
		$.ajax({
			type: "post",
			url: "/project/session_servlet/login.do",
			data: param,
			success: function(result){
				$("#result").html(result);
			}
		});
	});
});

$(function(){
	$("#btnLogin2").click(function(){
		var param="userid="+$("#userid").val()
		+"&passwd="+$("#passwd").val();
		$.ajax({
			type: "post",
			url: "/project/session_servlet/login.do",
			data: param,
			success: function(result){
				$("#result").html(result);
			}
		});
	});
});

