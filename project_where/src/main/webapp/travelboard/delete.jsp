<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardBean" %>
<jsp:useBean id="bMgr" class="board.BoardMgr"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Where</title>
<link href="../css/delete.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<%
	request.setCharacterEncoding("UTF-8");
	String nowPage = request.getParameter("nowPage");
	int num = Integer.parseInt(request.getParameter("num"));

	if(request.getParameter("pass") != null) {
		String inPass = request.getParameter("pass");
		BoardBean bean = (BoardBean)session.getAttribute("bean");
		String dbPass = bean.getPass();
		if(inPass.equals(dbPass)) {
%>
			<script>
			var flag = confirm("삭제 하시겠습니까?");
			if(flag == true) {				
			<%
				bMgr.deleteBoard(num);
			%>
				alert("삭제되었습니다.");
				location.href="../travelboard/board.jsp";
			}else{
				history.back();
			}
			</script>
<% 

		} else {
%>		
			<script>
				alert("비밀번호가 다릅니다");
				history.back();
			</script>
<%
		}
	} else {
%>
		<script>
			function check() {
				if(document.delFrm.pass.value=="") {
					alert("비밀번호를 입력하세요");
					document.delFrm.pass.focus();
					return false;
				}
				document.delFrm.submit();
			}
		</script>
</head>
<body>
<section>
	<form method="post" name="delFrm" action="delete.jsp">
		<table align="center" class="table table-striped">
			<thead>
			<tr>
				<td align="center" class="headname">사용자의 비밀번호를 입력해주세요</td>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td align="center"><img src='../img/alert.svg'>&emsp;주의: 삭제하면 복구할 수 없습니다!&emsp;<img src='../img/alert.svg'></td>
			</tr>
			<tr>
				<td align="center"><input type="password" name="pass"></td>
			</tr>
			</tbody>
			<tfoot>
			<tr>
				<td align="center">
				<div class="btn-group" role="group" aria-label="Basic example">
				  <button type="button" class="btn btn-secondary" value="삭제완료" onClick="check()">삭제</button>
				  <button type="reset" class="btn btn-secondary" value="다시쓰기">다시쓰기</button>
				  <button type="button" class="btn btn-secondary" value="뒤로" onClick="history.go(-1)">뒤로</button>
				</div>
				</td>
			</tr>
			</tfoot>			
		</table>
		<input type="hidden" name="num" value="<%=num %>">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
	<jsp:include page="readelete.jsp"></jsp:include>
	</form>
<%
	}
%>
</section>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</html>