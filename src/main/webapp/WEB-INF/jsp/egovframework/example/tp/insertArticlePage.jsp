<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	table, tr, th, td { border: 1px solid black; border-collapse: collapse;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script>
	function insertArticle(){
		var btitle = $("#btitle").val();
		var bcontent = $("#bcontent").val();
		var ncheck = $("input[name='ncheck']:checked").val();
		var bwriter = $("#bwriter").val();
		var seccheck = $("#seccheck").val();
		var secpw = $("#secpw").val();
		if(seccheck == 'Y'){
			if(secpw == "" || secpw == null || secpw.trim() == ""){
				alert("비밀글 패스워드를 입력해주세요.");
				return;
			}
		}
		
		if(btitle == "" || btitle == null || btitle.trim() == ""){
			alert("글제목을 입력해주세요.");
			return;
		}
		
		if(bcontent == "" || bcontent == null || bcontent.trim() == ""){
			alert("글내용을 입력해주세요.");
			return;
		}
		
		$.ajax({
		    url: "insertArticle.do",
		    type: "post",
		    async: false,
		    dataType: "text",
		    data: {
		    		'btitle': btitle,
		    		'bcontent': bcontent,
		    		'ncheck': ncheck,
		    		'bwriter': bwriter,
		    		'seccheck': seccheck,
		    		'secpw': secpw
		    },
		    success: function(data){
		    	alert("글 등록 완료");
		    	window.opener.location.href = window.opener.location.href;
		    	window.close();
		    },
		    error: function (request, status, error){        
				alert("Error입니다.")
		    }
		  });
		
	}
	
	function winclose(){
		window.close();
	}
	
	function securitycheck(checked){
		if(checked == 'Y'){
			$("#secpw").show();
		}else{
			$("#secpw").hide();
		}
	}
</script>
</head>
<body>
<form id="frm" name="frm" method="post">
<div align="center">
<div class="container">
<div class="col-md-12">
    <div class="form-area">
        <br style="clear:both">
            <h3 style="margin-bottom: 25px; text-align: center;">게시글 작성</h3>
            <div align="center">
	            <select id="seccheck" name="seccheck" onchange="securitycheck(this.value)">
	            	<option value="N">일반글</option>
	            	<option value="Y">비밀글</option>
	            </select>
	            <input type="password" id="secpw" name="secpw" placeholder="비밀번호 입력" style="display: none; width: 100px" maxlength="10">
	        </div>
            <c:choose>
				<c:when test="${ sessionScope.whoSession.auth == 'A' }">
					<div>
						<label for="ilban">일반</label>
						<input type="radio" id="ilban" name="ncheck" checked="checked" value="N">
						<label for="gongji">공지</label>
						<input type="radio" id="gongji" name="ncheck" value="Y">
					</div><br>
				</c:when>
				<c:otherwise>
					<div class="category" style="display: none;">
						<label for="ilban">일반</label>
						<input type="radio" id="ilban" name="ncheck">
						<label for="gongji">공지</label>
						<input type="radio" id="gongji" name="ncheck" checked="checked" value="Y">
					</div><br>
				</c:otherwise>
			</c:choose>
			<c:if test="${ sessionScope.whoSession.auth == 'U' }">
						<input type="radio" id="ilban" name="ncheck" checked="checked" value="N" style="display: none;">
			</c:if>
				<div class="form-group">
					<input type="text" class="form-control" id="bwriter" name="bwriter" required="required" value="${ sessionScope.whoSession.name }" disabled="disabled" style="text-align: center;">
				</div>
    			<div class="form-group">
					<input type="text" class="form-control" id="btitle" name="btitle" required="required" maxlength="50" placeholder="제목" style="text-align: center;">
				</div>
                 <div class="form-group">
                    <textarea class="form-control" id="bcontent" name="bcontent" maxlength="1000" rows="10" required="required" maxlength="1300" placeholder="내용" style="text-align: center;"></textarea>                    
                 </div>
    </div>
    <div align="center">
	        <button type="reset" class="btn btn-primary pull-right" onclick="winclose()">닫기</button>
	        <button type="button" class="btn btn-primary pull-right" onclick="insertArticle()">등록하기</button>
    </div>
</div>
</div>
</div>
</form>
</body>
</html>