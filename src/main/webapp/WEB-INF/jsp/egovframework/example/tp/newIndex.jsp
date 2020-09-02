<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
.box {
    width: 500px;
    margin: 200px 0;
}

.shape1{
    position: relative;
    height: 150px;
    width: 150px;
    background-color: #0074d9;
    border-radius: 80px;
    float: left;
    margin-right: -50px;
}
.shape2 {
    position: relative;
    height: 150px;
    width: 150px;
    background-color: #0074d9;
    border-radius: 80px;
    margin-top: -30px;
    float: left;
}
.shape3 {
    position: relative;
    height: 150px;
    width: 150px;
    background-color: #0074d9;
    border-radius: 80px;
    margin-top: -30px;
    float: left;
    margin-left: -31px;
}
.shape4 {
    position: relative;
    height: 150px;
    width: 150px;
    background-color: #0074d9;
    border-radius: 80px;
    margin-top: -25px;
    float: left;
    margin-left: -32px;
}
.shape5 {
    position: relative;
    height: 150px;
    width: 150px;
    background-color: #0074d9;
    border-radius: 80px;
    float: left;
    margin-right: -48px;
    margin-left: -32px;
    margin-top: -30px;
}
.shape6 {
    position: relative;
    height: 150px;
    width: 150px;
    background-color: #0074d9;
    border-radius: 80px;
    float: left;
    margin-right: -20px;
    margin-top: -35px;
}
.shape7 {
    position: relative;
    height: 150px;
    width: 150px;
    background-color: #0074d9;
    border-radius: 80px;
    float: left;
    margin-right: -20px;
    margin-top: -57px;
}
.float {
    position: absolute;
    z-index: 2;
}

.form {
    margin-left: 145px;
}
</style>
<script>
	function loginUser(){
		var id = $("#id").val();
		var pw = $("#pw").val();
		
		if(id == '' ||  id.trim() == ''){
			alert("아이디를 입력하세요");
			return;
		}
		
		if(pw == '' ||  pw.trim() == ''){
			alert("비밀번호를 입력하세요");
			return;
		}
		
		$("#frm").attr("action", "loginUser.do");
		$("#frm").submit();
	}
	
	if('${fail}'){
		alert("아이디 및 비밀번호를 확인해주세요");
	}
	
	function enterLogin(){
		if(event.keyCode == 13){
			loginUser();
		}
	}
</script>

<title>Insert title here</title>
</head>
<body>
<div class="container">
        <div id="login-row" class="row justify-content-center align-items-center">
            <div id="login-column" class="col-md-6">
                <div class="box">
                    <div class="shape1"></div>
                    <div class="shape2"></div>
                    <div class="shape3"></div>
                    <div class="shape4"></div>
                    <div class="shape5"></div>
                    <div class="shape6"></div>
                    <div class="shape7"></div>
                    <div class="float">
                        <form class="form" id="frm" name="frm" method="post">
                            <div class="form-group">
                                <label for="username" class="text-white">아이디</label><br>
                                <input type="text" id="id" name="id" onkeypress="enterLogin()" maxlength="19" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-white">비밀번호</label><br>
                                <input type="password" id="pw" name="pw" onkeypress="enterLogin()" maxlength="19" class="form-control">
                            </div>
                            <div class="form-group">
                                <button type="button" onclick="location.href='joinForm.do'" class="btn btn-info btn-md">회원가입</button>
								<button type="button" onclick="loginUser()" class="btn btn-info btn-md">로그인</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>