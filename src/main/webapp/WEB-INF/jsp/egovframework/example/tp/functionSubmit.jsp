<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<style>
	table, tr, th, td {
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	td {
	height: 30px;
	}
	
	select { -webkit-appearance: none; /* 네이티브 외형 감추기 */ -moz-appearance: none; appearance: none; background: url(이미지 경로) no-repeat 95% 50%; /* 화살표 모양의 이미지 */ } /* IE 10, 11의 네이티브 화살표 숨기기 */ select::-ms-expand { display: none; }
	select { width: 100px; /* 원하는 너비설정 */ padding: 1px /* 여백으로 높이 설정 */ font-family: inherit; /* 폰트 상속 */ background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ border: 1px solid #999; border-radius: 0px; /* iOS 둥근모서리 제거 */ -webkit-appearance: none; /* 네이티브 외형 감추기 */ -moz-appearance: none; appearance: none; }
</style>	
<script>
	function insertArticle(){
		var url = "insertArticlePage.do";
		var preview = window.open(url, "fullscreen", "scrollbars=1, width=500, height=1000");
	}
	
	function trover(si){
		$("#trlight"+si).css("background-color","lightyellow");
	}
	
	function trout(si){
		$("#trlight"+si).css("background-color","white");
	}
	
	function selectArticleOne(bno){
		var status = "scrollbars=1, width=500, height=1000";
		window.open("selectArticleOne.do?bno="+bno,'window',status);
	}
	
	/* pagination 페이지 링크 function */
    function fn_egov_link_page(pageNo){
    	document.frm.pageIndex.value = pageNo;
    	document.frm.action = "functionSubmit.do";
       	document.frm.submit();
    }
	
	function fn_egov_selectList(){
		var searchkey1 = $("#searchKeyword").val();
		$("input[name='searchKeyword']").val(searchkey1);
		document.frm.action = "functionSubmit.do";
		document.frm.submit();
	}
	
	function enterSearch(){
		if(event.keyCode == 13){
			fn_egov_selectList();
		}
	}
</script>
</head>
<body>
<!-- <script type="text/javascript">
$(document).ready(function() {
	<c:forEach items="${boardNoticeList }" var="nList" varStatus="sts">
		var currentCookie = document.cookie;
		console.log("currentCookie= "+currentCookie)
		var cookieCheck = document.cookie.indexOf('notice${nList.bno}');
		
		if(cookieCheck < 0){
			window.open('cookieTest.do?bno=${nList.bno}',"${sts.index}",'width=500, height=300');
		}
	</c:forEach>
});
</script> -->
<form id="frm" name="frm" method="get">
<div style="height: 50px; text-align: center; background: lightyellow;" onclick="location.href='mainPage.do'">
메인
</div>
<div align="center"><br>
<b style="color: red; font-size: larger;">${sessionScope.whoSession.name}</b>님 환영합니다.
<button type="button" onclick="location.href='logout.do'" class="btn btn-info btn-md">로그아웃</button>
</div><br>
<div align="center">
		<b>페이징 수</b>
		<select id="pageUnit" name="pageUnit" onchange="fn_egov_selectList()">
			<option value="10" ${ searchVO.pageUnit == 10 ? 'selected="selected"' : '' }>10개</option>
			<option value="30" ${ searchVO.pageUnit == 30 ? 'selected="selected"' : '' }>30개</option>
			<option value="50" ${ searchVO.pageUnit == 50 ? 'selected="selected"' : '' }>50개</option>
		</select>
		<c:if test="${ sessionScope.whoSession.auth == 'A' }">
		<b>카테고리</b>
		<select id="ncheck" name="ncheck" onchange="fn_egov_selectList()">
			<option value="0" ${ searchVO.ncheck == 0 ? 'selected="selected"' : '' }>일반글</option>
			<option value="1" ${ searchVO.ncheck == 1 ? 'selected="selected"' : '' }>공지글</option>
		</select>
		</c:if>
  		<select id="searchCondition" name="searchCondition" style="margin-left: 200px;">
			<option value="0" ${ searchVO.searchCondition == 0 ? 'selected="selected"' : '' }>작성자</option>
			<option value="1" ${ searchVO.searchCondition == 1 ? 'selected="selected"' : '' }>제목</option>
			<option value="2" ${ searchVO.searchCondition == 2 ? 'selected="selected"' : '' }>내용</option>
			<option value="3" ${ searchVO.searchCondition == 3 ? 'selected="selected"' : '' }>전체</option>
		</select>
           	<input type="text" id="searchKeyword" onkeypress="enterSearch()">
           	<input type="hidden" name="searchKeyword">
       		<button type="button" onclick="fn_egov_selectList()" class="btn btn-primary">검색</button>
		       	<script>
		       		$("#searchKeyword").val("${searchVO.searchKeyword}");
		       		$("input[name='searchKeyword']").val("${searchVO.searchKeyword}");
		       	</script>
</div><br>
<%-- <div align="center">
<span>
	<b>페이징 수</b>
	<select id="pageUnit" name="pageUnit" onchange="fn_egov_selectList()">
		<option value="10" ${ searchVO.pageUnit == 10 ? 'selected="selected"' : '' }>10개</option>
		<option value="30" ${ searchVO.pageUnit == 30 ? 'selected="selected"' : '' }>30개</option>
		<option value="50" ${ searchVO.pageUnit == 50 ? 'selected="selected"' : '' }>50개</option>
	</select>
</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<c:if test="${ sessionScope.whoSession.auth == 'A' }">
<span>
	<b>카테고리</b>
	<select id="ncheck" name="ncheck" onchange="fn_egov_selectList()">
		<option value="0" ${ searchVO.ncheck == 0 ? 'selected="selected"' : '' }>일반글</option>
		<option value="1" ${ searchVO.ncheck == 1 ? 'selected="selected"' : '' }>공지글</option>
	</select>
</span>
</c:if>
</div> --%>
	<div align="center">
	<h1>게시판</h1>
	<c:if test="${ not empty boardList }">
		<table border="1">
			<tr style="background-color: lightblue; text-align: center;">
				<th>글번호</th>
				<th>제목</th>
				<th>조회수</th>
				<th>작성자</th>
				<th>작성시간</th>
			</tr>
			<c:forEach items="${ boardList }" var="blist" varStatus="sts">
			<c:if test="${ blist.ncheck == 'Y' }">
			<tr style="text-align: center; color: red; font-weight: bold;" onmouseover="trover(${sts.index})" onmouseout="trout(${sts.index})" id="trlight${sts.index}" onclick="selectArticleOne(${blist.bno})">
				<td style="width: 80px">${ paginationInfo.totalRecordCount - sts.index - paginationInfo.lastRecordIndex + searchVO.pageUnit}</td>
				<td style="width: 800px; text-align: left;">
					<c:forEach begin="2" end="${blist.lvl}">
						└─      
					</c:forEach>
				${ blist.btitle }
				</td>
				<td style="width: 80px">${ blist.hit }</td>
				<td style="width: 100px">${ blist.bwriter }</td>
				<fmt:formatDate value="${blist.bdate}" pattern="yyyy-MM-dd HH:mm:ss" var="regDate" />
				<td style="width: 200px">${ regDate }</td>
			</tr>
			</c:if>
			<c:if test="${ blist.ncheck == 'N' }">
			<tr style="text-align: center;" onmouseover="trover(${sts.index})" onmouseout="trout(${sts.index})" id="trlight${sts.index}" onclick="selectArticleOne(${blist.bno})">
				<td style="width: 80px">${ paginationInfo.totalRecordCount - sts.index - paginationInfo.lastRecordIndex + searchVO.pageUnit}</td>
				<td style="width: 800px; text-align: left;">
					<c:forEach begin="2" end="${blist.lvl}">
						└─      
					</c:forEach>
				${ blist.btitle }
				</td>
				<td style="width: 80px">${ blist.hit }</td>
				<td style="width: 100px">${ blist.bwriter }</td>
				<fmt:formatDate value="${blist.bdate}" pattern="yyyy-MM-dd HH:mm:ss" var="regDate" />
				<td style="width: 200px">${ regDate }</td>
			</tr>
			</c:if>
			</c:forEach>
		</table><br>
		<div id="paging">
        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page" />
        		<input type="hidden" id="pageIndex" name="pageIndex" value="1">
        </div><br>
     </c:if>
     <c:if test="${ empty boardList }">
     	<h1 style="color: red">데이터가 존재하지 않습니다.</h1>
     </c:if>
		<button type="button" onclick="insertArticle()" class="btn btn-primary">글 등록</button>
	</div>
<input type="hidden" id="bno" name="bno">
</form>
</body>
</html>