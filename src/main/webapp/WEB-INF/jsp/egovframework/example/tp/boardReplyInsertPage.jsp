<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<style>
	table, tr, th, td { border: 1px solid black; border-collapse: collapse;}
</style>
<script>
	function boardReplyInsert(bno, rp){
		var bwriter = $("#bwriter").val();
		var btitle = $("#btitle").val();
		var bcontent = $("#bcontent").val();
		var ncheck = $("#ncheck").val();
		
		if(btitle == "" || btitle == null || btitle.trim() == ""){
			alert("글제목을 입력해주세요.");
			return;
		}
		
		if(bcontent == "" || bcontent == null || bcontent.trim() == ""){
			alert("글내용을 입력해주세요.");
			return;
		}
		
		$.ajax({
		    url: "boardReplyInsert.do",
		    type: "post",
		    async: false,
		    dataType: "text",
		    data: {
		    		'bwriter': bwriter,
		    		'btitle': btitle,
		    		'bcontent': bcontent,
		    		'ncheck': ncheck,
		    		'parent_bno': bno,
		    		'rp': rp
		    },
		    success: function(data){
		    	alert("글 등록 완료");
		    	/* opener.parent.location.reload(); */
		    	window.opener.location.href = window.opener.location.href;
		    	window.close();
		    },
		    error: function (request, status, error){        
				alert("Error입니다.")
		    }
		  });
	}
	
	function back(){
		history.back();
	}
</script>
</head>
<body>
<div align="center">
<div class="container">
<div class="col-md-12">
    <div class="form-area">
        <br style="clear:both">
            <h3 style="margin-bottom: 25px; text-align: center;">답글 쓰기$</h3>
            글번호:${ toReplyBoard.bno }
            글자식번호:${ toReplyBoard.parent_bno }
           rp번호:${ toReplyBoard.rp }
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
			<button type="button" class="btn btn-primary pull-right" onclick="back()">이전 페이지</button>
	        <button type="button" class="btn btn-primary pull-right" onclick="boardReplyInsert('${ toReplyBoard.bno }','${ toReplyBoard.rp }')">답글 등록</button>
    </div>
</div>
</div>
</div>
<form id="frm" name="frm" method="post">
<div align="center">
<div class="container">
<div class="col-md-12">
    <div class="form-area">
        <br style="clear:both">
            <h3 style="margin-bottom: 25px; text-align: center;">이전 내용</h3>
				<div class="form-group">
					<input type="text" class="form-control" required="required" value="${ toReplyBoard.bwriter }" disabled="disabled" style="text-align: center;">
				</div>
    			<div class="form-group">
					<input type="text" class="form-control" required="required" maxlength="50" placeholder="제목" style="text-align: center;" value="${ toReplyBoard.btitle }" disabled="disabled">
				</div>
                 <div class="form-group">
                    <textarea class="form-control" maxlength="1000" rows="10" required="required" maxlength="1300" placeholder="내용" style="text-align: center;" disabled="disabled">${ toReplyBoard.bcontent }</textarea>                    
                 </div>
    </div>
</div>
</div>
</div>
<input type="hidden" id="parent_bno" name="parent_bno">
<input type="hidden" id="rp" name="rp">
<input type="hidden" id="ncheck" name="ncheck" value="${ toReplyBoard.ncheck }">
</form>
</body>
</html>
