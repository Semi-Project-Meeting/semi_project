<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>semi project viewpage</title>
<link rel="stylesheet" href="css/view.css" />
</head>
<body>
	<div id="bg">

		<div class="container">
			<div class="row">
				<table>
					<%--  <c:forEach var="vo" items="${vos}">  --%>

					<thead>
						<tr>
							<th colspan="3">게시판</th>
							<button><a href="board.jsp"></button>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="title"><label></label></td>
							<td colspan="2">${vo2.title}</td>
						</tr>
						<tr>
							<td id="writer"><label>작성자</label></td>
							<td colspan="2">${vo2.writer}</td>
						</tr>
						<tr>
							<td id="wdate"><label>작성일자</label></td>
							<td colspan="2">${vo2.wdate}</td>
						</tr>
						<tr>
							<td id="contents"><label>게시판 글</label></td>
							<td colspan="3" style="min-height: 200px">${vo2.contents}</td>
						</tr>
						<tr>
							<td colspan="3">
							<button><a href="boardUpdate.do?board_id=${param.board_id}">게시글 수정</a></button>
								<button><a href="boardDelete.do?board_id=${param.board_id}">게시글 삭제</a></button></td>
						</tr>
					</tbody>
					<%-- </c:forEach>  --%>
				</table>
			</div>


		</div>
	</div>
</body>
</html>
