<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
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
	}
</style>
<script>
	function trover(si){
		$("#trlight"+si).css("background-color","lightyellow");
	}
	
	function trout(si){
		$("#trlight"+si).css("background-color","white");
	}
	function updateUserAuthPage(uid){
		var url = "updateUserAuthPage.do?id="+uid;
		var preview = window.open(url, "updateUserAuthPage", "scrollbars=1, width=500, height=1000");
	}
	function fn_egov_link_page(pageNo){
    	document.frm.pageIndex.value = pageNo;
    	document.frm.action = "UserAuthManagePage.do";
       	document.frm.submit();
    }
	function enterSearch(){
		if(event.keyCode == 13){
			fn_egov_selectList();
		}
	}
	function fn_egov_selectList(){
		var searchkey1 = $("#searchKeyword").val();
		$("input[name='searchKeyword']").val(searchkey1);
		document.frm.action = "UserAuthManagePage.do";
		document.frm.submit();
	}
</script>
</head>
<body>
<form id="frm" name="frm" method="post">
<div align="center"><br>
<div>
<button type="button" onclick="location.href='mainPage.do'">메인페이지</button>
</div><br>
<div align="center">
	<b>페이징 수</b>
	<select id="pageUnit" name="pageUnit" onchange="fn_egov_selectList()">
		<option value="15" ${ searchVO.pageUnit == 15 ? 'selected="selected"' : '' }>15개</option>
		<option value="30" ${ searchVO.pageUnit == 30 ? 'selected="selected"' : '' }>30개</option>
		<option value="50" ${ searchVO.pageUnit == 50 ? 'selected="selected"' : '' }>50개</option>
	</select>
	
	<b style="margin-left: 100px">검색</b>
	<select id="searchCondition" name="searchCondition">
		<option value="0" ${ searchVO.searchCondition == 0 ? 'selected="selected"' : '' }>아이디</option>
		<option value="1" ${ searchVO.searchCondition == 1 ? 'selected="selected"' : '' }>이름</option>
	</select>
	<input type="text" id="searchKeyword" onkeypress="enterSearch()">
	<input type="hidden" name="searchKeyword">
	<button type="button" onclick="fn_egov_selectList()">검색</button>
</div>
	<h1>회원관리</h1>
	<c:if test="${ not empty userList }"> 
		<table border="1">
			<tr style="background-color: lightblue; text-align: center;">
				<th>회원수</th>
				<th>아이디</th>
				<th>이름</th>
				<th>가입일</th>
				<th>권한</th>
			</tr>
			<c:forEach items="${ userList }" var="uList" varStatus="sts">
			<tr style="text-align: center; font-weight: bold;" onmouseover="trover(${sts.index})" onmouseout="trout(${sts.index})" id="trlight${sts.index}">
				<td style="width: 80px">${ paginationInfo.totalRecordCount - sts.index - paginationInfo.lastRecordIndex + searchVO.pageUnit}</td>
				<td style="width: 200px">${ uList.id }</td>
				<td style="width: 80px">${ uList.name }</td>
				<td style="width: 200px">${ uList.date }</td>
				<td style="width: 100px"><a href="javascript:void(0);" onclick="updateUserAuthPage('${uList.id}')">변경</a></td>
			</tr>
			</c:forEach>
		</table><br>
			<div id="paging">
	        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page"></ui:pagination>
	        		<input type="hidden" id="pageIndex" name="pageIndex" value="1">
	        		<br>
	        </div><br>
     </c:if>
     <c:if test="${ empty userList }">
     	<h1 style="color: red">회원이 존재하지 않습니다.</h1>
     </c:if>
	</div>
</form>
</body>
</html>