<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 조회</title>
</head>
<body>
<div id="nav"><%@ include file="../include/nav.jsp" %></div>
	<div align="center" style="margin: 0 auto;">
		<form method="post">

			<table style="border: 1px solid #bcbcbc;width: 1010px;">
				<tr>
					<td style="border: 1px solid #bcbcbc;width: 80px;text-align: center;">제목</td>
					<td style="border: 1px solid #bcbcbc;text-indent: 20px;">${view.title}</td>
				</tr>
				<tr>
					<td style="border: 1px solid #bcbcbc;text-align: center;">작성자</td>
					<td style="border: 1px solid #bcbcbc;text-indent: 20px;">${view.writer}</td>
				</tr>
				<tr>
					<td style="border: 1px solid #bcbcbc;text-align: center;">작성일자</td>
					<td style="border: 1px solid #bcbcbc;text-indent: 20px;"><fmt:parseDate value="${view.regDate}" var="dateValue" pattern="yyyyMMdd" /> <fmt:formatDate value="${dateValue}" pattern="yy.MM.dd" /></td>
				</tr>
				<tr>
					<td style="border: 1px solid #bcbcbc;height: 300px;text-align: center;">내용</td>
					<td style="border: 1px solid #bcbcbc;width: 920px;text-indent: 20px;">${view.content}</td>
				</tr>

			</table>

			<div align="right" style="width: 1000px;">
				<a href="/board/modify?bno=${view.bno}">게시물 수정</a>
				<a href="/board/delete?bno=${view.bno}">게시물 삭제</a>
			</div>

		</form>
	</div>

</body>
</html>