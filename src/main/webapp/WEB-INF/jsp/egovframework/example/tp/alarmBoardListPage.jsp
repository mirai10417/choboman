<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
table, tr, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

td {
	height: 50px;
}
</style>
</head>
<body>
	<div align="center">
	<h1>아직 읽지 않은 글</h1>
		<table>
			<tr style="background: lightblue;">
				<th>글번호</th>
				<th>제목</th>
				<th>조회수</th>
				<th>작성자</th>
				<th>작성시간</th>
			</tr>
			<c:forEach items="${alarmBoardList}" var="boardList">
				<tr style="text-align: center;">
					<td>${ boardList.bno }</td>
					<td>${ boardList.btitle }</td>
					<td>${ boardList.hit }</td>
					<td>${ boardList.bwriter }</td>
					<td>${ boardList.bdate }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>