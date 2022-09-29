<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web.ConnectionMgr, java.sql.*" %>
<%@ page import="board.BoardBean" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<jsp:useBean id="bbs" class="board.BoardBean"/>
<jsp:useBean id="bMgr" class ="board.BoardMgr"/>
<%
	request.setCharacterEncoding("UTF-8");
	int totalRecord = 0;     // 전체 레코드 수 : 68개
	int numPerPage = 10;	// 1페이지당 보여주는 레코드 수
	int pagePerBlock = 5;	// 블록당 페이지 수 [1][2][3][4][5]
	
	int totalPage = 0;		// 전체 페이지 수  [1][2][3][4][5][6][7]
	int totalBlock = 0;		// 전체 블록 수  : 2
	
	int nowPage = 1;		// 현재 레코드가 해당하는 페이지 
	int nowBlock = 1;		// 현재 레코드가 해당하는 블록
	
	int start = 0;			// DB테이블의 select시작번호()
	int end = 0;			// DB테이블에서 페이지에 맞는 10개 가져오기
	int listSize = 0;		// 읽어온 게시물의 수
	
	String keyWord = "", keyField ="";
	Vector<BoardBean> vlist = null;
	if (request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
	}
	if (request.getParameter("reload") != null){
		if(request.getParameter("reload").equals("true")) {
			keyWord = "";
			keyField = "";
		}
	}
	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	start = ((nowPage * numPerPage)-numPerPage)+1;
	end = nowPage*numPerPage;
	
	totalRecord = bMgr.getTotalCount(keyField, keyWord);
	totalPage = (int)Math.ceil((double)totalRecord/numPerPage);	// 전체 페이지수
	nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);	// 현재 블럭 계산
	totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);	// 전체 블럭 계산
			
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Where</title>
<link href="../css/mypage.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<jsp:include page="mainheader.jsp"></jsp:include>
<script type="text/javascript">
function read(num) {
	document.readFrm.num.value = num;
	document.readFrm.action = "../travelboard/reading.jsp";
	document.readFrm.submit();
}
</script>
</head>
<body>
	<section>
	<h1 align="center" class="headname">마이페이지</h1>
	<hr><br><br>
	<form method="post" name=frm action="update.jsp">
	<table align="center" class="one">
<%
	ConnectionMgr cm = new ConnectionMgr();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String id = request.getParameter("id");
		try { 
			con = cm.getConnection();
			String sql = "select id, name, birthday, email, address, datailaddress, phone from travel_login where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
%>
			<h2 class="title"><b>회원정보</b></h2></td>
			
			<tr>
				<th width="25%">아 이 디</th>
				<td width="75%" name="id" id=wirte><%=rs.getString(1) %></td>
			</tr>
			
			<tr>
				<th>이&emsp;&ensp;름</th>
				<td name="name" id=wirte><%=rs.getString(2) %></td>
			</tr>
			
			<tr>
				<th>생&emsp;&ensp;일</th>
				<td name="birthday" id=wirte><%=rs.getString(3) %></td>
			</tr>
			
			<tr>
				<th>이 메 일</th>
				<td name="email" id=wirte><%=rs.getString(4) %></td>
			</tr>
			
			<tr>
				<th>주&emsp;&ensp;소</th>
				<td name="address" id=wirte><%=rs.getString(5) %>&nbsp;<%=rs.getString(6) %></td>
			</tr>
			
			<tr>
				<th>전화번호</th>
				<td name="phone" id=wirte><%=rs.getString(7) %></td> 
			</tr>
			<tr>
				<td colspan="2" style="text-align:center">
					<input type="button" value="회원정보수정" onClick="location.href='update.jsp?id=<%=rs.getString(1) %>'" id="btn">&emsp;
				</td>
			</tr>
			<tr>
				<td>
					
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
<article>
<h1 align="center" class="headname">내가 작성한 글</h1>
<table border="1" align="center" class="table caption-top" height="100px;">

		<tr class="table-dark" align="center" height="40px;">
			<td width="10%">번호</td>
			<td width="20%">제목</td>
			<td width="15%">이름</td>
			<td width="25%">날짜</td>
			<td width="10%">조회수</td>
		</tr>	

<%
	BoardBean bean = new BoardBean();
	ConnectionMgr cmm = new ConnectionMgr();
	Connection conn = null;
	PreparedStatement pstmtt = null;
	ResultSet rss = null;
	String name = (String)session.getAttribute("name");
	bean.setName(name);
	try {
		conn = cmm.getConnection();
		String sql = "select * from tblboard where name=?";
		pstmtt = con.prepareStatement(sql);
		pstmtt.setString(1, name);
		rss = pstmtt.executeQuery();
		while(rss.next()) {
%>
		<tr height="40px;">
			<td align="center"><%=rss.getString(1) %></td>
			<td><a href="javascript:read('<%=rss.getString(1) %>')"><%=rss.getString(3) %></a></td>
			<td align="center"><%=rss.getString(2) %></td>
			<td align="center"><%=rss.getString(8) %></td>
			<td align="center"><%=rss.getString(11) %></td>
		</tr>
	
<% 
	}
	} catch(Exception e) {
	e.printStackTrace();
	}
%>
</table>
<form name="readFrm" method="get">
		<input type="hidden" name="num">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
		<input type="hidden" name="keyField" value="<%=keyField %>">
		<input type="hidden" name="keyWord" value="<%=keyWord %>">	
	</form>
</article>
<jsp:include page="mainfooter.jsp"></jsp:include>
</body>
</html>