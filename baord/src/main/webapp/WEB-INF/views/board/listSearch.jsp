<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
</head>
<body>

	<div align="center" style="margin: 0 auto;">
		<div id="nav" align="left"><%@ include file="../include/nav.jsp"%></div>

		<div align="center" style="margin: 0 auto;">
			<div align="right" style="width: 1000px;">
				<select name="searchType">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="title_content">제목+내용</option>
					<option value="writer">작성자</option>
				</select> <input type="text" name="keyword" onkeyup="noSpaceForm(this);"
					onchange="noSpaceForm2(this);" />

				<button id="searchBtn" type="button">검색</button>
			</div>

			<table style="margin: 0 auto; text-align: center;width: 1000px;border: 1px solid #bcbcbc;">
				<thead>
					<tr>
						<th style="width: 38px;">번호</th>
						<th style="width: 509px;">제목</th>
						<th style="width: 308px;">작성자</th>
						<th style="width: 73px;">작성일</th>
						<th style="width: 58px;">조회수</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${list}" var="list">
						<tr style="border: 1px solid #bcbcbc;">
							<td style="border: 1px solid #bcbcbc;">${list.number}</td>
							<td style="border: 1px solid #bcbcbc;" onclick="location.href='/board/view?bno=${list.bno}'" style="cursor: pointer;">${list.title}</td>
							<td style="border: 1px solid #bcbcbc;">${list.writer}</td>
							<td style="border: 1px solid #bcbcbc;"><fmt:parseDate value="${list.regDate}" var="dateValue" pattern="yyyyMMdd" /> <fmt:formatDate value="${dateValue}" pattern="yy.MM.dd" /></td>
							<td style="border: 1px solid #bcbcbc;">${list.viewCnt}</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>

	</div>
	<script>
		document.getElementById("searchBtn").onclick = function() {

			let searchType = document.getElementsByName("searchType")[0].value;
			let keyword = document.getElementsByName("keyword")[0].value;

			console.log(searchType)
			console.log(keyword)

			location.href = "/board/listSearch?" + "&searchType=" + searchType
					+ "&keyword=" + keyword;
		};
		// 첫 글자 공백만 사용 못 하게
		function noSpaceForm(obj) {
			if (obj.value == " ") // 공백 체크
			{
				alert("검색에는 공백을 사용할 수 없습니다.\n공백 제거됩니다.");
				obj.focus();
				obj.value = obj.value.replace(' ', ''); // 공백 제거
				return false;
			}
		}
	</script>


</body>
</html>