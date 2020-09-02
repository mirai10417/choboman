<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function boardPwCheck(){
		var bno = $("#bno").val();
		var secpw = $("#secpw").val();
		
		if(secpw == "" || secpw == null || secpw.trim() == ""){
			alert("비밀번호를 입력해주세요");
			return;
		}
		
		$.ajax({
		    url: "boardPwCheck.do",
		    type: "post",
		    dataType: "html",
		    data: {
		    	'bno': bno,
		    	'secpw': secpw
		    },
		    success: function(data){
		    	if(data == 1){
		    		window.close();
		    		var status = "scrollbars=1, width=500, height=1000";
					window.open("selectArticleOne.do?bno="+bno,'',status);
		    	}else{
		    		alert("비밀번호가 틀렸습니다.");	
		    	}
		    },
		    error: function (request, status, error){
		    	alert("에러. 관리자 문의");
		    }
		  });
	}
</script>
</head>
<body>
<form id="frm" name="frm" method="post">
<div align="center">
	<h1>비밀글 비밀번호를 입력해주세요.</h1>
	<input type="password" id="secpw" name="secpw">
	<button type="button" onclick="boardPwCheck()">입력</button>
</div>
<input type="hidden" id="bno" name="bno" value="${ bvo.bno }">
</form>
</body>
</html>