<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>testProject_boardTest</title>
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
	height: 50px;
	}
	select { -webkit-appearance: none; /* 네이티브 외형 감추기 */ -moz-appearance: none; appearance: none; background: url(이미지 경로) no-repeat 95% 50%; /* 화살표 모양의 이미지 */ } /* IE 10, 11의 네이티브 화살표 숨기기 */ select::-ms-expand { display: none; }
	select { width: 100px; /* 원하는 너비설정 */ padding: 1px /* 여백으로 높이 설정 */ font-family: inherit; /* 폰트 상속 */ background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%; /* 네이티브 화살표 대체 */ border: 1px solid #999; border-radius: 0px; /* iOS 둥근모서리 제거 */ -webkit-appearance: none; /* 네이티브 외형 감추기 */ -moz-appearance: none; appearance: none; }
	
	.dot {
	  height: 40px;
	  width: 40px;
	  background-color: yellowgreen;
	  border-radius: 100%;
	  display: inline-block;
	  }
</style>
<script>
	function insertArticle(session, total){
		
		$.ajax({
		    url: "sessionCheck.do",
		    type: "post",
		    dataType: "html",
		    data: {
		    	'id': session
		    },
		    success: function(data){
		    	var url = "insertArticlePage.do";
				var preview = window.open(url, "insertArticlePage", "scrollbars=1, width=500, height=1000");
		    },
		    error: function (request, status, error){
		    	alert("에러");
		    	window.opener.location.href = window.opener.location.href;
		    }
		  });
		}
	
	function trover(si){
		$("#trlight"+si).css("background-color","lightyellow");
	}
	
	function trout(si){
		$("#trlight"+si).css("background-color","white");
	}
	
	function selectArticleOne(bno, bw, sn, sp, sc, si){
		var bwriter = bw;
		var sname = sn;
		var seccheck = sc;
		var sid = si;
		if(bwriter != sname && seccheck == 'Y'){
			var status = "scrollbars=1, width=500, height=300";
			window.open('boardPwCheckPage.do?secpw='+sp+'&bno='+bno,"",status);
		}else{
			var status = "scrollbars=1, width=500, height=1000";
			window.open("selectArticleOne.do?bno="+bno+"&id="+sid ,'',status);	
		}
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
	
	
	function setCookie(cookie_name, value, days) {
		  var exdate = new Date();
		  exdate.setDate(exdate.getDate() + days);
		  console.log("exdate= "+exdate);
		  // 설정 일수만큼 현재시간에 만료값으로 지정

		  var cookies = escape(value) + ((days == null) ? '' : ';    expires=' + exdate.toUTCString());
		  console.log("cookies= "+cookies)
		  
		  
		  document.cookie = cookie_name + '=' + cookies;
	} 
	
	function enterSearch(){
		if(event.keyCode == 13){
			fn_egov_selectList();
		}
	}
	
	function alarmTypeCheck(checked){
		if(checked == 'Y'){
			$("#dot").show();
		}else{
			$("#dot").hide();
		}
	}
	
	function alarmBoardList(){
		var status = "scrollbars=1, width=500, height=900";
		window.open("alarmBoardListPage.do?","",status);
	}
</script>
</head>
<body>
<script type="text/javascript">
$(document).ready(function() {
	var position1 = 20;
	var position2 = 0;	
	var cookies = document.cookie;
	console.log("ready.cookies= "+cookies);
		<c:forEach items="${boardNoticeList }" var="nList" varStatus="sts">		
			if(cookies.indexOf('cookies${nList.bno}=${nList.bno}') < 0) {				
				var win = window.open("","${sts.index}","top="+position1+", left="+position2+", width=500, height=300");
				console.log("position1= " + position1);
				console.log("position2"+position2);
				position2 = position2 + 300;
				var html = '';
				/* html += '${nList.btitle}'; */
				html += '${nList.bcontent}'+'<br><br><br><br><br><br>';
				html += '<div id="pop_03" style="position:absolute; z-index:9999; visibility:done;">';
				html += '<div>' + '<br>'+ '<br>'+ '<br>'+ '<br>'+ '<br>';
				html += '<a href="#" style="text-align: right;position: fixed;bottom:50px; margin-left: 300px" onclick="opener.parent.setCookie(\'cookies${nList.bno}\',\'${nList.bno}\',1); window.close(); ">오늘하루동안 열지않기</a>';
				html += '</div>';
				html += '</div>';
				win.document.write(html);
			}
		</c:forEach>
	});
</script>
<form id="frm" name="frm" method="get">
<div style="height: 50px; text-align: center; background: lightyellow;" onclick="location.href='mainPage.do'">
</div>
<div align="center"><br>
<h1>boardTest</h1>
<b style="color: red; font-size: larger;">${sessionScope.whoSession.name}</b>님 환영합니다.
<button type="button" onclick="location.href='logout.do'" class="btn btn-info btn-md">로그아웃</button>
</div>
<br>
<div align="center">
<button type="button" class="btn btn-info btn-md" onclick="location.href='UserAuthManagePage.do'">권한 관리 페이지</button>
<select id="alarm" name="alarm" onchange="alarmTypeCheck(this.value)">
	<option value="N" ${ searchVO.alarm == 'N' ? 'selected="selected"' : '' }>일반</option>
	<option value="Y" ${ searchVO.alarm == 'Y' ? 'selected="selected"' : '' }>알림</option>
</select>
<span class="dot" id="dot" style="display: none; font-size: larger;font-weight: bold;"><a href="javascript:void(0);" onclick="alarmBoardList()">${alarmCnt}개</a></span>
</div>
<div align="center">
		<b>페이징 수</b>
		<select id="pageUnit" name="pageUnit" onchange="fn_egov_selectList()">
			<option value="15" ${ searchVO.pageUnit == 15 ? 'selected="selected"' : '' }>15개</option>
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
           	<input type="hidden" name="searchKeyword" maxlength="20">
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
				<th>부모글</th>
				<th>${ blist.id }</th>
			</tr>
			<c:forEach items="${ boardList }" var="blist" varStatus="sts">
			<c:if test="${ blist.ncheck == 'Y' }">
			<tr style="text-align: center; color: red; font-weight: bold;" onmouseover="trover(${sts.index})" onmouseout="trout(${sts.index})" id="trlight${sts.index}" onclick="selectArticleOne('${blist.bno}', '${ blist.bwriter }', '${ sessionScope.whoSession.name }','${ blist.secpw }','${ blist.seccheck }','${ sessionScope.whoSession.id }')">
				<td style="width: 80px">${ paginationInfo.totalRecordCount - sts.index - paginationInfo.lastRecordIndex + searchVO.pageUnit} + ${paginationInfo.totalRecordCount }</td>
				<c:choose>
					<c:when test="${ blist.seccheck == 'Y' }">
						<td style="width: 800px; text-align: left;">
							<c:forEach begin="2" end="${blist.lvl}">
								└─      
							</c:forEach>
							<img src="${pageContext.request.contextPath}/images/egovframework/example/lock.png" style="width: 30px; height: 30px">
							${ blist.btitle }
						</td>
					</c:when>
					<c:otherwise>
						<td style="width: 800px; text-align: left;">
							<c:forEach begin="2" end="${blist.lvl}">
								└─      
							</c:forEach>
							${ blist.btitle }
						</td>
					</c:otherwise>
				</c:choose>
				<td style="width: 80px">${ blist.hit }</td>
				<td style="width: 100px">${ blist.bwriter }</td>
				<fmt:formatDate value="${blist.bdate}" pattern="yyyy-MM-dd HH:mm:ss" var="regDate" />
				<td style="width: 200px">${ regDate }</td>
				<td style="width: 200px">${ blist.parentBno }</td>
			</tr>
			</c:if>
			<c:if test="${ blist.ncheck == 'N' }">
			<tr style="text-align: center;" onmouseover="trover(${sts.index})" onmouseout="trout(${sts.index})" id="trlight${sts.index}" onclick="selectArticleOne('${blist.bno}', '${ blist.bwriter }', '${ sessionScope.whoSession.name }', '${ blist.secpw }','${ blist.seccheck }','${ sessionScope.whoSession.id }')">
				<td style="width: 80px">${ paginationInfo.totalRecordCount - sts.index - paginationInfo.lastRecordIndex + searchVO.pageUnit} + ${paginationInfo.totalRecordCount}</td>
					<c:choose>
					<c:when test="${ blist.seccheck == 'Y' }">
							<td style="width: 800px; text-align: left;">
								<c:forEach begin="2" end="${blist.lvl}">
									└─      
								</c:forEach>
								<img src="${pageContext.request.contextPath}/images/egovframework/example/lock.png" style="width: 30px; height: 30px">
								${ blist.btitle }
							</td>
					</c:when>
					<c:otherwise>
						<td style="width: 800px; text-align: left;">
							<c:forEach begin="2" end="${blist.lvl}">
								└─      
							</c:forEach>
							${ blist.btitle }
						</td>
					</c:otherwise>
				</c:choose>
				<td style="width: 80px">${ blist.hit }</td>
				<td style="width: 100px">${ blist.bwriter }</td>
				<fmt:formatDate value="${blist.bdate}" pattern="yyyy-MM-dd HH:mm:ss" var="regDate" />
				<td style="width: 200px">${ regDate }</td>
				<td style="width: 200px">${ blist.parentBno }</td>
			</tr>
			</c:if>
			</c:forEach>
		</table><br>
			<div id="paging">
	        		<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_egov_link_page"></ui:pagination>
	        		<input type="hidden" id="pageIndex" name="pageIndex" value="1">
	        </div><br>
     </c:if>
		     <c:if test="${ empty boardList }">
		     	<h1 style="color: red">데이터가 존재하지 않습니다.</h1>
		     </c:if>
			<button type="button" onclick="insertArticle('${sessionScope.whoSession.id}', '${paginationInfo.totalRecordCount }')" class="btn btn-primary">글 등록</button>
	</div>
<input type="hidden" id="bno" name="bno" value>
</form>
</body>
</html>