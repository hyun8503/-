/*
$(function(){
	$("#btnSave").click(function(){
		var email=$("#email").val();
		var name=$("#name").val();
		var passwd=$("#passwd").val();
		var passwd2m=$("#passwd_confirm").val();
		check();

		var param={"email":email, "name":name, "passwd":passwd, "passwd2":passwd2};
		$.ajax({
			type: "post",
			url: "/project/member_servlet/join.do",
			data: param,
			success: function(){
				alter("가입되었습니다.");
			}
		});
	});
});
*/


//id가 아니라 각 name의 값을 넣는군!!
function validate() {
    var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
    var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    // 이메일이 적합한지 검사할 정규식

    var email = document.getElementById("email");
    var passwd = document.getElementById("passwd");
    var name = document.getElementById("name");

    if(join.email.value=="") {
        alert("이메일을 입력해 주세요");
        join.email.focus();
        return false;
    }else if(!check(re2, join.email, "적합하지 않은 이메일 형식입니다.")) {
        return false;
    }else if(join.name.value=="") {
        alert("이름을 입력해 주세요");
        join.name.focus();
        return false;
    }else if(!check(re,join.passwd,"패스워드는 4~12자의 영문 대소문자와 숫자로만 입력")) {
        return false;
    }else if(join.passwd.value != join.passwd_confirm.value) {
        alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
        join.passwd_confirm.value = "";
        join.passwd_confirm.focus();
        return false;
    } 
    else {
    	alert("회원가입이 완료되었습니다.");
		location.href = "../school/index.jsp";
	}
}

function check(re, what, message) {
    if(re.test(what.value)) {
        return true;
    }
    alert(message);
    what.value = "";
    what.focus();
    //return false;
}

