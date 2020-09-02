<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<style>
	table, th, tr, td { border: 1px solid black; border-collapse: collapse;}
	th { text-align: center; background: lightgrey;}
</style>
<script>
	function selectArticleUpdate(bno){
			var btitle = $("#btitle").val();
			var bcontent = $("#bcontent").val();
			/* var ncheck = $("input[name='ncheck']:checked").val(); */
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
			    url: "selectArticleUpdate.do",
			    type: "post",
			    async: false,
			    dataType: "text",
			    data: {
			    	'bno': bno,
			    	'btitle': btitle,
			    	'bcontent': bcontent,
			    	'ncheck': ncheck
			    },
			    success: function(data){
			    	alert("글 수정 완료");
			    	
			    	window.opener.location.href = window.opener.location.href;
					window.close();
			    },
			    error: function (request, status, error){
			    	alert("에러입니다.");
			    }
			  });
	}
	
	function selectArticleDelete(bno){
		var result = confirm("해당 글을 정말 삭제하시겠습니까?");
			if(result == true){
			$.ajax({
			    url: "selectArticleDelete.do",
			    type: "post",
			    async: false,
			    dataType: "text",
			    data: {'bno': bno },
			    success: function(data){
					alert("삭제 되었습니다");		
			    	/* opener.parent.location.reload(); */
			    	window.opener.location.href = window.opener.location.href;
			    	window.close();
			    },
			    error: function (request, status, error){
			    	alert("에러입니다");
			    }
	
			  });
			}
	}
	
	function boardReplyInsertPage(breply, rp){
		$("#ncheck").val();
		$("#bno").val(breply);
		$("#parent_bno").val(breply);
		$("#rp").val(rp)
		$("#bcontent").val();
		$("#bwriter").val();
		$("#btitle").val();
		$("#frm").attr("action","boardReplyInsertPage.do");
		$("#frm").submit();
	}
	
	function winclose(){
		window.close();
	}
	
	function enterNext(){
		if(event.keyCode == 13){
			$("#bcontent").focus();
		}
	}
	
	function insertPosting(bno){
		var pwriter = $("#pwriter").val();
		var pcontent = $("#pcontent").val();
		
		$.ajax({
		    url: "insertPosting.do",
		    type: "post",
		    async: false,
		    dataType: "text",
		    data: {
		    		'bno': bno,
		    		'pwriter': pwriter,
		    		'pcontent': pcontent
		    	},
		    success: function(data){
		    	location.reload();
		    	/* var html = '';
		    	html += '<div id="pInsertArea">';
		    	html += '<input type="text" value="${ pList.pwriter }" disabled="disabled" style="width: 100px; margin-left: 30px; text-align: center;">';
		    	html += '<input type="text" value="${ pList.pcontent }" disabled="disabled" style="width: 300px;">';
		    	html += '<br>';
				html += '<div align="center">${ pList.pdate }</div><hr>';
				html += '</div>'; */
		    },
		    error: function (request, status, error){
		    	alert("에러입니다");
		    }
		  });
	}
	
	function deletePosting(pid){
		var result = confirm("해당 댓글을 정말 삭제하시겠습니까?");
		if(result == true){
			$.ajax({
			    url: "deletePosting.do",
			    type: "post",
			    async: false,
			    dataType: "text",
			    data: {
			    		'pid': pid
			    	},
			    success: function(data){
			    	alert("댓글이 삭제되었습니다.")
			    	location.reload();
			    },
			    error: function (request, status, error){
			    	alert("에러입니다");
			    }
			  });
		}
	}
	
	function updatePostingOn(pid){
		$("#oPcontent"+pid).hide();
		$("#uPcontent"+pid).show();
		$("#uPcontentBtn"+pid).show();
		$("#updatePostingBtn"+pid).hide();
	}
	
	function updatePosting(pid){
		var pcontent = $("#uPcontent"+pid).val();
		
		$.ajax({
		    url: "updatePosting.do",
		    type: "post",
		    async: false,
		    dataType: "text",
		    data: {
		    		'pid': pid,
		    		'pcontent':pcontent
		    	},
		    success: function(data){
		    	alert("댓글이 수정되었습니다.")
		    	location.reload();
		    },
		    error: function (request, status, error){
		    	alert("에러입니다");
		    }
		  });
	}
	
	function replyPostingOn(pid){
		$("#insertReplyPostingBtn"+pid).hide();
		$("#replyWriter"+pid).show();
		$("#replyContent"+pid).show();
		$("#insertReplyPostingBtn"+pid).show();
		$("#replyInsertBtn"+pid).show();
		$("#replySelect"+pid).show();
	}
</script>
</head>
<body>
<form id="frm" name="frm" method="post">
<input type="hidden">
	<div align="center">
	<h1>글 상세 조회 ${boardList.bno}</h1>
	rp의 값: ${boardList.rp}
	bno의 값: ${boardList.bno}
	parent_bno의 값: ${boardList.parent_bno}<br>
	비밀글 비밀번호: ${ boardList.secpw }
	비밀글 여부: ${ boardList.seccheck }<br>
	
		<c:if test="${ sessionScope.whoSession.name == boardList.bwriter && sessionScope.whoSession.auth == 'A'}">
			<c:choose>
				<c:when test="${boardList.ncheck == 'N'}">
					<label for="ncheckN">일반글</label>
					<input type="radio" id="ncheckN" name="ncheck" checked="checked" value="N">
					<label for="ncheckY">공지글</label>
					<input type="radio" id="ncheckY" name="ncheck" value="Y">
				</c:when>
				<c:otherwise>
					<label for="ncheckN">일반글</label>
					<input type="hidden" id="ncheckN" name="ncheck" value="N">
					<label for="ncheckY">공지글</label>
					<input type="hidden" id="ncheckY" name="ncheck" checked="checked" value="Y">
				</c:otherwise>
			</c:choose><br><br>
		</c:if>
		<%-- <c:if test="${ sessionScope.whoSession.auth == 'U' }">
				<input type="radio" name="ncheck" value="N" checked="checked" style="display: none;">
		</c:if> --%>
		<c:if test="${ sessionScope.whoSession.name == boardList.bwriter && sessionScope.whoSession.auth == 'U'}">
			<c:choose>
				<c:when test="${boardList.ncheck == 'N'}">
					<input type="radio" id="ncheckN" name="ncheck" checked="checked" value="N" style="display: none">
					<input type="radio" id="ncheckY" name="ncheck" value="Y" style="display: none">
				</c:when>
				<c:otherwise>
					<input type="hidden" id="ncheckN" name="ncheck" value="N" style="display: none">
					<input type="hidden" id="ncheckY" name="ncheck" checked="checked" value="Y" style="display: none">
				</c:otherwise>
			</c:choose><br><br>
		</c:if>
		<table style="text-align: center;">
			<tr>
				<th>작성자</th>
				<td>${boardList.bwriter}</td>
				<th>작성일</th>
				<td>${boardList.bdate}</td>
				<th>조회수</th>
				<td>${boardList.hit}</td>
			</tr>
			<tr>
				<th>제목</th>
				<c:choose>
					<c:when test="${ boardList.bwriter == sessionScope.whoSession.name }">
						<td colspan="7"><input type="text" id="btitle" name="btitle" value="${boardList.btitle}" style="width: 100%;" maxlength="50"></td>
					</c:when>
					<c:otherwise>
						<td colspan="7"><input type="text" id="btitle" name="btitle" value="${boardList.btitle}" style="width: 100%;" maxlength="50" disabled="disabled"></td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<input type="text" style="display: none;">
				<th>내용</th>
				<c:choose>
					<c:when test="${ boardList.bwriter == sessionScope.whoSession.name }">
						<td colspan="7"><textarea cols="50" rows="30" id="bcontent" name="bcontent" maxlength="1300">${boardList.bcontent}</textarea></td>
					</c:when>
					<c:otherwise>
						<td colspan="7"><textarea cols="50" rows="30" id="bcontent" name="bcontent" disabled="disabled">${boardList.bcontent}</textarea></td>
					</c:otherwise>
				</c:choose>
			</tr>
		</table><br>
		
	<!-- 권한에 따른 분기 조건 시작 -->
			<c:if test="${ boardList.bwriter == sessionScope.whoSession.name}">
				<button type="button" onclick="selectArticleUpdate('${boardList.bno}')" class="btn btn-primary">수정하기</button>
				<button type="button" onclick="selectArticleDelete('${boardList.bno}')" class="btn btn-primary">삭제하기</button>
				<button type="button" onclick="winclose()" class="btn btn-primary">창 닫기</button>
			</c:if>
			<c:if test="${ boardList.bwriter != sessionScope.whoSession.name}">
				<button type="button" onclick="boardReplyInsertPage('${ boardList.bno }', '${ boardList.rp }')" class="btn btn-primary">답글 쓰기</button>
			</c:if>
			<c:if test="${ sessionScope.whoSession.auth == 'A' && boardList.bwriter != sessionScope.whoSession.name}">
				<button type="button" onclick="selectArticleDelete('${boardList.bno}')" class="btn btn-primary">삭제하기</button>
			</c:if>
	<!-- 권한에 따른 분기 조건 끝 -->
	</div><br>
	
	<!-- 댓글 관련 시작 -->
	<div align="left">
		<input type="text" name="pwriter" value="${ sessionScope.whoSession.name }" disabled="disabled" style="width: 100px; margin-left: 30px; text-align: center;">
		<input type="text" name="pcontent" style="width: 300px" placeholder="내용">
		<button type="button" onclick="insertPosting('${ boardList.bno }')">입력</button>
	</div><br>
	<c:forEach items="${ PostingList }" var="pList">
		<div id="pInsertArea">
			<input type="text" value="${ pList.pwriter }" disabled="disabled" style="width: 100px; margin-left: 30px; text-align: center;">
			<input type="text" value="${ pList.pcontent }" id="oPcontent${pList.pid}" disabled="disabled" style="width: 300px;">
			<input type="text" value="${ pList.pcontent }" id="uPcontent${pList.pid}" style="width: 300px; display: none;">
			<button type="button" id="uPcontentBtn${pList.pid}" onclick="updatePosting('${pList.pid}')" style="display: none;">수정</button>
			<div align="center">
				<span style="margin-left: 50px;">${ pList.pdate }</span>
					<button type="button" id="updatePostingBtn${pList.pid}" onclick="updatePostingOn('${pList.pid}')">수정</button>
					<button type="button" onclick="deletePosting('${pList.pid}')">삭제</button>
					<button type="button" id="insertReplyPostingBtn${pList.pid}" onclick="replyPostingOn('${pList.pid}')">댓글</button>
				<br>					
			</div>
			<div align="center">
				<span id="replySelect${ pList.pid }" style="display: none;">↑</span><br>
			</div>
			<input type="text" id="replyWriter${pList.pid}" value="${ sessionScope.whoSession.name }" disabled="disabled" style="width: 100px; margin-left: 30px; text-align: center; display: none;">
			<input type="text" id="replyContent${pList.pid}" style="width: 300px; display: none;">
			<button id="replyInsertBtn${pList.pid}" type="button" onclick="insertReplyPosting('${ pList.pid }')" style="display: none;">입력</button>
			<hr>
		</div>
	</c:forEach>
	<!-- 댓글 관련 끝 -->
	<input type="hidden" id="bno" name="bno">
	<input type="hidden" id="rp" name="rp">
	<input type="hidden" id="btitle" name="btitle" value="${boardList.btitle}">
	<input type="hidden" id="bwriter" name="bwriter" value="${boardList.bwriter}">
	<input type="hidden" id="bcontent" name="bcontent" value="${ boardList.bcontent }">
	<input type="hidden" id="ncheck" name="ncheck" value="${ boardList.ncheck }">
</form>
</body>
</html>
