<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mMgr" class="web.UserDAO"/>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	boolean result = mMgr.checkId(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	if(result) {
		out.print(id + "는 이미 존재하는 ID 입니다. <p/>");
	} else { 
		out.print(id + "는 사용 가능합니다. <p/>");
	}

%>
	<a href="#" onClick="self.close()">닫기</a>
</body>
</html>