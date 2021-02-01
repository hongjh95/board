<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
</head>
<body>

<div id="nav"><%@ include file="../include/nav.jsp" %></div>
<div align="center" style="margin: 0 auto;">
	<form method="post">

		<table style="border: 1px solid #bcbcbc; width: 1010px;">
			<tr>
				<td style="border: 1px solid #bcbcbc; width: 80px; text-align: center;">제목</td>
				<td style="border: 1px solid #bcbcbc;"><input type="text" name="title" maxlength="50" style="width: 99%;" required/></td>
			</tr>
			<tr>
				<td style="border: 1px solid #bcbcbc; text-align: center;">작성자</td>
				<td style="border: 1px solid #bcbcbc;"><input type="text" name="writer" maxlength="30" style="width: 99%;" required/></td>
			</tr>
	
			<tr>
				<td style="border: 1px solid #bcbcbc; height: 300px; text-align: center;">내용</td>
				<td style="border: 1px solid #bcbcbc; width: 920px;"><textarea cols="50" rows="5" name="content" required style="width: 99%;height: 300px;"></textarea></td>
			</tr>
	
		</table>

		<div align="right" style="width: 1000px;">
			<button type="submit" style="width: 100px;"> 작성</button>
		</div>
	</form>
</div>
</body>
</html>