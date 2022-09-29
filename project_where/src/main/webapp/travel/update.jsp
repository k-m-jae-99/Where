<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web.ConnectionMgr, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Where</title>
<link href="../css/update.css" rel="stylesheet" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/update1.js"></script>
<script src="../js/update2.js"></script>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
<!-- Header Part  -->
 	<header>
		<jsp:include page="mainheader.jsp" />
	</header>
	
<!-- Section Part -->
	<section>
		<h1 align="center">회원정보수정</h1>
		<hr><br><br>
		<form method="post" name="frm" action="updateProc.jsp">
		<table align="center" width="500px">
		<%
		ConnectionMgr cm = new ConnectionMgr();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String id = request.getParameter("id");
			try { 
				con = cm.getConnection();
				pstmt = con.prepareStatement("select id from travel_login where id=?");
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next()) {
		%> 
			<tr>
				<td colspan="2" align="center"><h2><b>회원정보수정</b></h2></td>
			</tr>
			<tr>
				<th width="25%">아 이 디</th>
				<td width="75%"><input type="text" name="id" value=<%= rs.getString(1) %> readonly class=wirte></td>
			</tr>
			
			<tr>
				<th>이&emsp;&ensp;름</th>
				<td><input type="text" name="name" class=wirte></td>
			</tr>
			
			<tr>
				<th>생&emsp;&ensp;일</th>
				<td><input type="text" name="birthday"  placeholder="ex) 220727" class=wirte></td>
			</tr>
			
			<tr>
				<th>이 메 일</th>
				<td><input type="text" name="email"  placeholder="ex) email.naver.com" class=wirte></td>
			</tr>
			
			<tr>
				<th>우편번호</th>
				<td>
					<input name="zipcode" id="postcode" readonly class=wirte>
                    <input type="button" value="우편번호 찾기" onClick="findAddr()" id="addrbtn">
				</td>
			</tr>
			
			<tr>
				<th>주&emsp;&ensp;소</th>
				<td>
					<input type="text" name="address" id="addr" readonly class=wirte size=40><br>
					<input type="text" name="dataladdress" id="datailAddr" placeholder="상세주소" class=wirte size=40>
				</td>
			</tr>
			
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone"  placeholder="ex) 010-1111-2222" class=wirte></td> 
			</tr>
			<tr>
				<td colspan="2" style="text-align:center">
					<input type="button" value="수정" onClick="updatecheck()" id=btn>&emsp;
					<input type="reset" value="다시쓰기" id=btn>&emsp;
					<input type="button" value="취소" onClick="location.href='mypage.jsp?id=<%= rs.getString(1) %>'" id=btn>
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
	
<!-- Footer Part -->
	<jsp:include page="mainfooter.jsp" />
</body>
</html>