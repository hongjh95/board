<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert title here</title>
</head>
<body>
<div id="nav"><%@ include file="../include/nav.jsp" %></div>

	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${list}" var="list">
				<tr>
					<td>${list.number}</td>
					<td><a href="/board/view?bno=${list.bno}">${list.title}</a></td>
					<td>${list.writer}</td>
					<td>
						<fmt:parseDate value="${list.regDate}" var="dateValue" pattern="yyyyMMdd"/>
						<fmt:formatDate value="${dateValue}" pattern="yy.MM.dd"/>
					</td>
					<td>${list.viewCnt}</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>
	<div>
		<select name="searchType">
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="title_content">제목+내용</option>
			<option value="writer">작성자</option>
		</select> <input type="text" name="keyword" />

		<button id="searchBtn" type="button">검색</button>
	</div>

	<script>
		document.getElementById("searchBtn").onclick = function() {

			let searchType = document.getElementsByName("searchType")[0].value;
			let keyword = document.getElementsByName("keyword")[0].value;

			console.log(searchType)
			console.log(keyword)
			
			location.href = "/board/listSearch?" + "&searchType=" + searchType + "&keyword=" + keyword;
		};
	</script>
</body>
</html>