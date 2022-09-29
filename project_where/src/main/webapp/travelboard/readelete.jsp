<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardBean" %>
<jsp:useBean id="bMgr" class="board.BoardMgr"/>
<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	bMgr.upCount(num);
	BoardBean bean = bMgr.getBoard(num);
	String name = bean.getName();
	String subject = bean.getSubject();
	String regdate = bean.getRegdate();
	String filename = bean.getFilename();
	int filesize = bean.getFilesize();
	String content = bean.getContent();
	String ip = bean.getIp();
	int count = bean.getCount();
	session.setAttribute("bean", bean);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Where</title>
<script>
	function down(filename) {
		document.downFrm.filename.value = filename;
		document.downFrm.submit();
	}
	function list() {
		document.listFrm.submit();
	}
</script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style>
	.table{width:1650px; margin-left:120px}
	a{text-decoration:none;color:black;}
	a:hover{text-decoration:yes;color:#66CCFF;}
	a:visited {text-decoration:none;}
</style>
</head>
<body>
		<table class="table">
	    <thead class="table-dark">
	      <tr class="table-dark">
	        <td colspan="4" align="center" height="25" class="headname">삭제할 게시물</td>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
	        <td align="center" width="15%" height="25"><b>이름</b></td>
	        <td width="35%"><%=name %></td>
	        <td align="center" width="15%"><b>등록날짜</b></td>
	        <td  width="35%"><%=regdate %></td>
	      </tr>
	      <tr>
	        <td align="center" width="15%" height="25"><b>제목</b></td>
	        <td colspan="3"><%=subject %></td>
	      </tr>
	      <tr>
	        <td align="center" width="15%" height="25"><b>첨부파일</b></td>
	        <td colspan="3">
	        <%
	          if(filename != null && !filename.equals("")) {
	        %>
	            <a href="javascript:down('<%=filename %>')"><%=filename %></a>&emsp;
	            <font color="blue">(<%=filesize %> KByte)</font>
	        <%
	          } else {
	            out.print("등록된 파일이 없습니다.");
	          }
	        %>
	        </td>
	      </tr>
	      <tr>
	        <td colspan="4"><br/><pre><%=content %></pre><br/></td>
	      </tr>
	      </tbody>
	  </table>
	<form name="downFrm" method="post" action="download.jsp">
		<input type="hidden" name="filename">
	</form>
	<form name="listFrm" method="post" action="board.jsp">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
		<%
			if(!(keyWord == null || keyWord.equals(""))) {
		%>
			<input type="hidden" name="keyField" value="<%=keyField %>">
			<input type="hidden" name="keyWord" value="<%=keyWord %>">
		<%
			}
		%>
	</form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</html>





