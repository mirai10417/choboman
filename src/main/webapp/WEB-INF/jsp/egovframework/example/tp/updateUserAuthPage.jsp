<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	table, tr, th, td {
		border: 1px solid black;
		border-collapse: collapse;
	}
	td {
	height: 30px;
	width: 200px;
	}
	th {
	text-align: left;
	width: 200px;
	}
	tr {
	height: 50px;
	}
</style>
<script>
	function winclose(){
		window.close();
	}
	
	function updateUserAuth(uid){
		var bwa = $("input[name='bwa']:checked").val();
		var ua = $("input[name='ua']:checked").val();
		var da = $("input[name='da']:checked").val();
		var brwa = $("input[name='brwa']:checked").val();
		var ra = $("input[name='ra']:checked").val();
		var baa = $("input[name='baa']:checked").val();
		var ma = $("input[name='ma']:checked").val();
		
		$.ajax({
		    url: "updateUserAuth.do",
		    type: "post",
		    async: false,
		    dataType: "text",
		    data: {
		    		'id': uid,
		    		'bwa': bwa,
		    		'ua': ua,
		    		'da': da,
		    		'brwa': brwa,
		    		'ra': ra,
		    		'baa': baa,
		    		'ma': ma
		    	},
		    success: function(data){
		    	alert("회원 권한이 변경되었습니다.")
		    	window.close();
		    	window.opener.location.href = window.opener.location.href;
		    },
		    error: function (request, status, error){
		    	alert("에러입니다");
		    }
		  });
	}
</script>
</head>
<body>
<form id="frm" name="frm" method="post">
<div align="center">
<h1>회원 권한 변경 페이지</h1>
<table border="1">
			<tr style="background-color: lightblue; text-align: center;">
				<th colspan="4" style="text-align: center;">아이디 ${UserVO.id}</th>
			</tr>
			<tr style="text-align: center; font-weight: bold;">
				<th>게시글 작성 권한</th>
				<td>
					<c:choose>
						<c:when test="${ UserVO.bwa == 'Y'}">
							가능<input type="radio" id="bwa" name="bwa" value='Y' checked="checked">
							불가능<input type="radio" id="bwa" name="bwa" value='N'>
						</c:when>
						<c:otherwise>
							가능<input type="radio" id="bwa" name="bwa" value='Y'>
							불가능<input type="radio" id="bwa" name="bwa" value='N' checked="checked">
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="text-align: center; font-weight: bold;">
				<th>게시글 업데이트 권한</th>
				<td>
					<c:choose>
						<c:when test="${ UserVO.ua == 'Y'}">
							가능<input type="radio" id="ua" name="ua" value='Y' checked="checked">
							불가능<input type="radio" id="ua" name="ua" value='N'>
						</c:when>
						<c:otherwise>
							가능<input type="radio" id="ua" name="ua" value='Y'>
							불가능<input type="radio" id="ua" name="ua" value='N' checked="checked">
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="text-align: center; font-weight: bold;">
				<th>게시글 삭제 권한</th>
				<td>
					<c:choose>
						<c:when test="${ UserVO.da == 'Y'}">
							가능<input type="radio" id="da" name="da" value='Y' checked="checked">
							불가능<input type="radio" id="da" name="da" value='N'>
						</c:when>
						<c:otherwise>
							가능<input type="radio" id="da" name="da" value='Y'>
							불가능<input type="radio" id="da" name="da" value='N' checked="checked">
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="text-align: center; font-weight: bold;">
				<th>게시글 답글 작성 권한</th>
				<td>
					<c:choose>
						<c:when test="${ UserVO.brwa == 'Y'}">
							가능<input type="radio" id="brwa" name="brwa" value='Y' checked="checked">
							불가능<input type="radio" id="brwa" name="brwa" value='N'>
						</c:when>
						<c:otherwise>
							가능<input type="radio" id="brwa" name="brwa" value='Y'>
							불가능<input type="radio" id="brwa" name="brwa" value='N' checked="checked">
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="text-align: center; font-weight: bold;">
				<th>게시글 댓글 작성 권한</th>
				<td>
					<c:choose>
						<c:when test="${ UserVO.ra == 'Y'}">
							가능<input type="radio" id="ra" name="ra" value='Y' checked="checked">
							불가능<input type="radio" id="ra" name="ra" value='N'>
						</c:when>
						<c:otherwise>
							가능<input type="radio" id="ra" name="ra" value='Y'>
							불가능<input type="radio" id="ra" name="ra" value='N' checked="checked">
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="text-align: center; font-weight: bold;">
				<th>게시판 진입 권한</th>
				<td>
					<c:choose>
						<c:when test="${ UserVO.baa == 'Y'}">
							가능<input type="radio" id="baa" name="baa" value='Y' checked="checked">
							불가능<input type="radio" id="baa" name="baa" value='N'>
						</c:when>
						<c:otherwise>
							가능<input type="radio" id="baa" name="baa" value='Y'>
							불가능<input type="radio" id="baa" name="baa" value='N' checked="checked">
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr style="text-align: center; font-weight: bold;">
				<th>게시판 관리자 권한</th>
				<td>
					<c:choose>
						<c:when test="${ UserVO.ma == 'Y'}">
							가능<input type="radio" id="ma" name="ma" value='Y' checked="checked">
							불가능<input type="radio" id="ma" name="ma" value='N'>
						</c:when>
						<c:otherwise>
							가능<input type="radio" id="ma" name="ma" value='Y'>
							불가능<input type="radio" id="ma" name="ma" value='N' checked="checked">
						</c:otherwise>
					</c:choose>
				</td>
			</tr>	
</table>
<br><br>
<button type="button" class="btn btn-primary" onclick="updateUserAuth('${UserVO.id}')">권한 변경</button>
<button type="button" class="btn btn-primary" onclick="winclose()">닫기</button>
</div>
</form>
</body>
</html>