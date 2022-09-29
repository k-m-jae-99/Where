<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web.ConnectionMgr, java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	ConnectionMgr cm = new ConnectionMgr();
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String msg = "회원정보 수정에 실패하였습니다.";
	String url = "update.jsp";
	try { 
		con = cm.getConnection();
		pstmt = con.prepareStatement("update travel_login set name=?, birthday=?, email=?, zipcode=?, address=?, datailaddress=?, phone=? where id=?");
		pstmt.setString(1, request.getParameter("name"));
		pstmt.setString(2, request.getParameter("birthday"));
		pstmt.setString(3, request.getParameter("email"));
		pstmt.setString(4, request.getParameter("zipcode"));
		pstmt.setString(5, request.getParameter("address"));
		pstmt.setString(6, request.getParameter("dataladdress"));
		pstmt.setString(7, request.getParameter("phone"));
		pstmt.setString(8, request.getParameter("id"));
		if(pstmt.executeUpdate() == 1) {
			msg = "회원정보를 수정하였습니다.";
			url = "main.jsp";
		}
	} catch(Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if(con != null)
				con.close();
			if(pstmt != null)
				pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>
</body>
</html>