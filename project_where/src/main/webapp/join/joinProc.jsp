<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="web.UserDAO" %>
<jsp:useBean id="mgr" class="web.UserDAO"/>
<jsp:useBean id="bean" class="web.UserDTO"/>
<jsp:setProperty property = "*" name ="bean"/>
<%
	boolean result = mgr.insertMember(bean);
	String msg = "회원가입에 실패하였습니다.";
	String url = "./join.jsp";
	if(result) {
		msg = "회원가입을 하였습니다.";
		url = "../login/login.jsp";
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
alert("<%=msg%>");
location.href = "<%=url%>";
</script>
</body>
</html>