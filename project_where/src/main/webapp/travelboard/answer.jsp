<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web.ConnectionMgr, java.sql.*" %>
<jsp:useBean id="bean" class="board.BoardBean" scope="session" />
<jsp:useBean id="dbconn" class="board.BoardBean" scope="application" />
<%
	String nowPage = request.getParameter("nowPage");
	String subject = bean.getSubject();
	String content = bean.getContent();
	String category = bean.getCategory();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Where</title>
	<link href="../css/writing.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="boardheader.jsp"></jsp:include>
<section>
<form name="boardReply" method="post" action="boardReply">
	<table class="write">
		<tr>
			<td colspan="2" align="center" class="headname">답변쓰기</td>
		</tr>
		<tr>
			<td align="center" width="10%" class="bgcolor">작성자</td>
			<td width="90%"><input name="name" id="in" value="<%=session.getAttribute("name") %>" readonly></td>
		</tr>
		<tr>
			<td align="center" class="bgcolor">게시글</td>
			<td><input type="text" id="in" value="<%=subject %>" readonly></td>
		</tr>
		<tr>
			<td align="center" class="bgcolor">카테고리</td>
			<td><input name="category" id="in" value="<%=category %>" readonly></td>
		</tr>
		<tr>
			<td align="center" class="bgcolor">답변제목</td>
			<td><input name="subject" id="in" value="↳ " placeholder="제목을 작성하세요"></td>
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
			<td width="90%"><input type="password" id="in" name="pass" placeholder="비밀번호를 입력하세요"></td>
		</tr>
		<tr>
			<td rowspan="2" align="center" class="bgcolor">등록여부</td>
			<td colspan="2" align="center">
			<input type="button" value="등록" id="in" class="btn btn-outline-secondary" onclick="sub()">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="button" value="취소" id="in" class="btn btn-outline-secondary" onclick="bpg()">
			</td>
		</tr>
	</table>
	<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
		<input type="hidden" name = "ref" value="<%=bean.getRef() %>">
		<input type="hidden" name ="pos" value="<%=bean.getPos() %>">
		<input type="hidden" name="depth" value="<%=bean.getDepth() %>">
		<input type="hidden" name="category" value="<%=bean.getCategory() %>">
</form>
</section>
<jsp:include page="boardfooter.jsp"></jsp:include>
</body>
<script src="../js/answer.js" type="text/javascript"></script>
</html>




