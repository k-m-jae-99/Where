<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web.ConnectionMgr, java.sql.*" %>
<jsp:useBean id="dbconn" class="board.BoardBean" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Where</title>
	<link href="../css/writing.css" rel="stylesheet" type="text/css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="boardheader.jsp"></jsp:include>
<section>
<form method="post" name="postFrm" action="boardPost" enctype="multipart/form-data">
	<table class="write">
<%
	ConnectionMgr cm = new ConnectionMgr();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String id = request.getParameter("id");
		try {
			con = cm.getConnection();
			pstmt = con.prepareStatement("select name from travel_login where id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
%>
		<tr>
			<td colspan="2" align="center" class="headname">글쓰기</td>
		</tr>
		<tr>
			<td align="center" width="10%" class="bgcolor">작성자</td>
			<td width="90%"><input name="name" id="in" value="<%=session.getAttribute("name") %>" readonly></td>
		</tr>
		<tr>
			<td align="center" class="bgcolor">제목</td>
			<td><input name="subject" id="in" placeholder="제목을 작성하세요"></td>
		</tr>
		<tr>
			<td align="center" class="bgcolor">카테고리</td>
			<td>
				<input class="form-check-input" type="radio" name="category" value="수도권" checked>수도권
				<input class="form-check-input" type="radio" name="category" value="강원도">강원도
				<input class="form-check-input" type="radio" name="category" value="충청도">충청도
				<input class="form-check-input" type="radio" name="category" value="경상도">경상도
				<input class="form-check-input" type="radio" name="category" value="전라도">전라도
				<input class="form-check-input" type="radio" name="category" value="제주도">제주도
			</td>
		</tr>
		<tr>
			<td align="center" class="bgcolor">파일첨부</td>
			<td><input type="file" id="in" name="filename" class="btn btn-outline-secondary"></td>
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
			<td width="90%"><input type="password" name="pass" id="in" placeholder="비밀번호를 입력하세요"></td>
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
		<%
		}
		} catch(Exception e) {
			e.printStackTrace();
		}
		%>
	</table>
</form>
</section>
<jsp:include page="boardfooter.jsp"></jsp:include>
</body>
<script src="../js/writing.js" type="text/javascript"></script>
</html>