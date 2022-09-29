<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardBean" %>
<jsp:useBean id="dbconn" class="board.BoardBean" scope="application" />
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	BoardBean bean = (BoardBean)session.getAttribute("bean");
	String subject = bean.getSubject();
	String name = bean.getName();
	String content = bean.getContent();
	String category = bean.getCategory();
	int depth = bean.getDepth();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Where</title>
<script type="text/javascript">
	function check() {
		if(document.updateFrm.pass.value == "") {
			alert("수정을 위해 비밀번호를 입력하세요");
			document.updateFrm.pass.focus();
			return false;
		}
		document.updateFrm.submit();
	}
</script>
	<link href="../css/writing.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="boardheader.jsp"></jsp:include>
<section>
<form name="updateFrm" method="post" action="boardUpdate">
	<table>
		<tr>
			<td colspan="2" align="center" class="headname">글쓰기 수정</td>
		</tr>
		<tr>
			<td align="center" width="10%" class="bgcolor">작성자</td>
			<td width="90%"><input name="name" id="in" value="<%=name%>" readonly></td>
		</tr>
		<tr>
			<td align="center" class="bgcolor">제목</td>
			<td><input name="subject" id="in" placeholder="제목을 작성하세요" value="<%=subject %>"></td>
		</tr>
		<tr>
			<td align="center" class="bgcolor">카테고리</td>
			<%if(depth == 0) { %>
			<td>
				<input class="form-check-input" type="radio" name="category" value="수도권" checked>수도권
				<input class="form-check-input" type="radio" name="category" value="강원도">강원도
				<input class="form-check-input" type="radio" name="category" value="충청도">충청도
				<input class="form-check-input" type="radio" name="category" value="경상도">경상도
				<input class="form-check-input" type="radio" name="category" value="전라도">전라도
				<input class="form-check-input" type="radio" name="category" value="제주도">제주도
			</td>
			<%} %>
			<%if(depth != 0) { %>
			<td>
				<input name="category" id="in" value="<%=category %>" readonly>
			</td>
			<%} %>
		</tr>
		<tr>
			<td align="center" class="bgcolor">내용</td>
			<td><jsp:include page="./summernote.jsp"></jsp:include></td>
		</tr>
		<tr>
			<td colspan="2" align="center"></td>
		</tr>
		<tr>
			<td align="center" width="10%" class="bgcolor">비밀번호</td>
			<td width="90%"><input type="password" name="pass" id="in" placeholder="수정시에는 비밀번호가 필요합니다"></td>
		</tr>
		<tr>
			<td rowspan="2" align="center" class="bgcolor">등록여부</td>
			<td colspan="2" align="center">
			<input type="button" value="등록" id="in" class="btn btn-outline-secondary" onclick="check()">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="button" value="취소" id="in" class="btn btn-outline-secondary" onclick="bpg()">
			</td>
		</tr>
	</table>
	<input type="hidden" name="nowPage" value="<%=nowPage %>">
	<input type="hidden" name="num" value="<%=num %>">
</form>
</section>
<jsp:include page="boardfooter.jsp"></jsp:include>
</body>
<script src="../js/update.js" type="text/javascript"></script>
</html>