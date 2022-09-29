<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/header.css" rel="stylesheet" type="text/css">
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/jquery-ui.js"></script>
</head>
<body>
	<header>
		<a href="../travel/main.jsp"><img src="../img/종이비행기.png" alt="종이비행기" id="paperairplane"></a>
        <h1 id="where"><a href="../travel/main.jsp">Where</a></h1>
        <nav>
            <ul class="menu">
<%
	if(session.getAttribute("id") == null) {
%>
                <li><a href="../login/login.jsp">로그인</a></li>
                <li><a href="../join/join.jsp">회원가입</a></li>
                <%
	} else {
%>
			<li><a href="../login/logout.jsp">로그아웃</a></li>
			<li><a href="mypage.jsp?id=<%=session.getAttribute("id") %>">마이페이지</a></li>
<% } %>
                <li class="dropdown"><a class="nav dropdown" data-bs-toggle="dropdown" id="dropdownMenuLink" aria-expanded="false" href="#">&emsp;&emsp;&emsp;추천여행</a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="../travel/month.jsp">이번달추천</a></li>
                    <li><a class="dropdown-item" href="../travel/korea.jsp">국내여행</a></li>
                    <li><a class="dropdown-item" href="../travel/overseas.jsp">해외여행</a></li>
                    <li><a class="dropdown-item" href="../travel/history.jsp">역사여행</a></li>
                </ul>
                </li>
                <li><a href="../tour/tourList.jsp">여행검색</a></li>
                <li><a href="../travelboard/board.jsp">게시판</a></li>
            </ul>
        </nav>
	 </header>
</body>
</html>