<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
.row{
  margin-top: 50px;
  margin-bottom: 50px;
}

.masthead-text{
  height: 300px;
}

.form-control{
  height: 45px;
}

.login-or {
    position: relative;
    font-size: 18px;
    color: #aaa;
    margin-top: 20px;
    margin-bottom: 20px;
    padding-top: 10px;
    padding-bottom: 10px;
  }
  .span-or {
    display: block;
    position: absolute;
    left: 50%;
    top: -2px;
    margin-left: -25px;
    background-color: #fff;
    width: 50px;
    text-align: center;
  }
  .hr-or {
    background-color: #cdcdcd;
    height: 1px;
    margin-top: 0px !important;
    margin-bottom: 0px !important;
  }

#login-dp{
    min-width: 250px;
    padding: 14px 14px 0;
    overflow:hidden;
    background-color:rgba(255,255,255,.8);
}
#login-dp .help-block{
    font-size:12px    
}

#login-dp .social-buttons{
    margin:12px 0    
}
#login-dp .social-buttons a{
    width: 49%;
}
#login-dp .form-group {
    margin-bottom: 10px;
}
.btn-fb{
    color: #fff;
    background-color:#3b5998;
}
.btn-fb:hover{
    color: #fff;
    background-color:#496ebc 
}
.btn-tw{
    color: #fff;
    background-color:#55acee;
}
.btn-tw:hover{
    color: #fff;
    background-color:#59b5fa;
}
@media(max-width:768px){
    #login-dp{
        background-color: inherit;
        color: #fff;
    }
    #login-dp .bottom{
        background-color: inherit;
        border-top:0 none;
    }
}




body {
  font-family: 'Lato', sans-serif;
}

.progress {
  height: 5px;
}

.form-horizontal {
  padding: 25px 20px;
  border: 1px solid #eee;
  border-radius: 5px;
}

.modal {
  text-align: center;
  padding: 0!important;
}

.modal:before {
  content: '';
  display: inline-block;
  height: 100%;
  vertical-align: middle;
  margin-right: -4px;
}

.modal-dialog {
  display: inline-block;
  text-align: left;
  vertical-align: middle;
}

.divider {
  position: absolute;
  height: 2px;
  border: 1px solid #eee;
  width: 100%;
  top: 10px;
  z-index: -5;
}

.ex-account {
  position: relative;
}

.ex-account p {
  background-color: rgba(255, 255, 255, 0.41);
}

select:hover {
  color: #444645;
  background: #ddd;
}

.block-help {
        font-weight: 300;
    }

.mar-top-bot-50 {
  margin-top: 50px;
  margin-bottom: 50px;
}

.hide {
  display: none;
}

</style>
<script>
	function back(){
		history.back();
	}
	
	function idCheck(){
		var id = $("#id").val();
		var idRule = /^[a-z]+[a-z0-9]{5,19}$/g;
		
		if(!idRule.test(id)){
			$("#idCheckBlur1").html("6~20자 영문자 또는 숫자 입력(공백없음)");
			$("#idCheckBlur1").css("color","red");
			return false; 
		}
		$.ajax({
		    url: 'idCheck.do',
		    type: 'post',
		    dataType: 'text',
		    data: { 'id' : $("#id").val() },
		    success: function(data){
		    	if(data==1){
		    		$("#idCheckBlur1").html("이미 존재하는 아이디입니다.");
					$("#idCheckBlur1").css("color","red");
					return false;
		    	}else{
		    		$("#idCheckBlur1").html("사용 가능한 아이디입니다.");
					$("#idCheckBlur1").css("color","blue");
		    	}
		    },
		    error: function (request, status, error){        
				alert("Error입니다.")
		    }
		  });
		
	}
	
	function insertUserCheck(){
		var cnt = 0;
		var id = $("#id").val();
		var idRule = /^[a-z]+[a-z0-9]{5,19}$/g;
		
		if(id == '' || id == null || id.trim() == ''){
			alert("아이디를 입력하세요");
			return;
		}
		
		$.ajax({
		    url: 'idCheck.do',
		    type: 'post',
		    dataType: 'text',
		    data: { 'id' : $("#id").val() },
		    success: function(data){
		    	if(data==1){
		    		$("#idCheckBlur1").html("이미 존재하는 아이디입니다.");
					$("#idCheckBlur1").css("color","red");
					cnt++;
		    	}else{
		    		if(idRule.test(id)){
			    		$("#idCheckBlur1").html("사용 가능한 아이디입니다.");
						$("#idCheckBlur1").css("color","blue");
		    		}
		    	}
		    },
		    error: function (request, status, error){        
				alert("Error입니다.")
		    }
		  });
		
		if(!idRule.test(id)){
			$("#idCheckBlur1").html("6~20자 영문자 또는 숫자 입력");
			$("#idCheckBlur1").css("color","red");
			cnt++;
		}else{
			$("#idCheckBlur1").html("사용 가능한 아이디입니다.");
			$("#idCheckBlur1").css("color","blue");
		}
				
		var pw = $("#pw").val();
		var pw2 = $("#pw2").val();
		var pwcheck = /^[a-zA-Z0-9]{6,18}$/;
		
		if(pw == '' || pw == null || pw.trim() == ''){
			alert("비밀번호를 입력하세요");
			return;
		}
		
		if(pw2 == '' || pw2 == null || pw2.trim() == ''){
			alert("비밀번호 확인부분을 입력하세요");
			return;
		}
		
		if (!pwcheck.test(pw)) {
			$('#pwcheck1').html("6~18자 영문자 또는 숫자 입력.");
			$('#pwcheck1').css("color", "red");
			cnt++;
		}else{
			$('#pwcheck1').html("확인");
			$('#pwcheck1').css("color", "blue");
			}
		if (pwcheck.test(pw) && pw == pw2){
			$('#pwcheck2').html("패스워드 일치");
			$('#pwcheck2').css("color", "blue");
		}else{
			$('#pwcheck2').html("패스워드 확인 부탁");
			$('#pwcheck2').css("color", "red");
			cnt++;
		}
		
		var name = $("#name").val();
		var nameRule = /^[가-힣]{2,5}$/;
		
		if(name == '' || name == null || name.trim() == ''){
			alert("이름을 입력하세요");
			return;
		}
		
		if(!nameRule.test(name)){
			$('#nameblur').html(" 2~5글자(공백 없음) 한글만 입력 가능.");
			$('#nameblur').css("color", "red");
			cnt++;
		}else{
			$('#nameblur').html("확인");
			$('#nameblur').css("color", "blue");
		}
		
		if(cnt > 0){
			alert("가입 조건을 정확히 확인해주세요.");
			return false;
		}else{
			return true;
		}
	}
</script>
</head>
<body>
<div class="container">
  <div class="row">
    <div class="col-md-4"></div>
    <div class="col-md-5">
      <div class="card cardbox">
        <div class="card-header" style="font: italic; font-weight: bold; text-align: center;">회원가입</div>
        <div class="card-body">
		  <div class="login-or">
            <hr class="hr-or">
          </div>
          
          <div class="form-group">
            
            <form id="frm" name="frm" method="post" action="insertUser.do" onsubmit="return insertUserCheck()">
			<div align="center"><span>아이디</span></div>
              <div class="form-group">
                <label class="sr-only">ID</label>
                <input type="text" id="id" name="id" required="required" maxlength="20" class="form-control">
                <button type="button" onclick="idCheck()" class="btn btn-block btn-primary">아이디 중복체크</button>
                <div align="center"><span id="idCheckBlur1"></span></div>
              </div>
           
			  <div align="center"><span>비밀번호</span></div>
			  <div class="form-group">
                <label class="sr-only">Password</label>
                <input type="password" id="pw" name="pw" required="required" maxlength="20" class="form-control">
                <div align="center"><span id="pwcheck1"></span></div>
              </div>

			  <div align="center"><span>비밀번호 확인</span></div>
			  <div class="form-group">
                <label class="sr-only">Password</label>
                <input type="password" id="pw2" required="required" maxlength="20" class="form-control">
                <div align="center"><span id="pwcheck2"></span></div>
              </div>
			  		
			  <div align="center"><span>이름</span></div>		
			  <div class="form-group">
                <label class="sr-only">Name</label>
                <input type="text" id="name" name="name" required="required" maxlength="10" class="form-control">
                <div align="center"><span id="nameblur"></span></div>
              </div>
       
              <!-- Submit -->
              <div class="form-group">
                <input type="submit" class="btn btn-block btn-primary" value="가입하기">
              </div>
            </form>
          </div>
		  
          <div class="login-or"><hr class="hr-or"></div>
		  <!-- Links -->
          <div class="bottom text-center">
            <a href="newIndex.do"><b>로그인 페이지</b></a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>