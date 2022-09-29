<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Where</title>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/jquery-ui.js"></script>
<script src="../js/travel.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="../css/header.css" rel="stylesheet" type="text/css">
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
			<li><a href="../travel/mypage.jsp?id=<%=session.getAttribute("id") %>">마이페이지</a></li>
<% } %>
                <li class="dropdown"><a class="nav dropdown" data-bs-toggle="dropdown" id="dropdownMenuLink" aria-expanded="false" href="#">&emsp;&emsp;&emsp;추천여행</a>
                  <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="../travel/month.jsp"><center>이번달추천</center></a></li>
                    <li><a class="dropdown-item" href="../travel/korea.jsp"><center>국내여행</center></a></li>
                    <li><a class="dropdown-item" href="../travel/overseas.jsp"><center>해외여행</center></a></li>
                    <li><a class="dropdown-item" href="../travel/history.jsp"><center>역사여행</center></a></li>
                </ul>
                </li>
                <li><a href="../tour/tourList.jsp">여행검색</a></li>
                <li><a href="../travelboard/board.jsp">게시판</a></li>
            </ul>
        </nav>
	 </header>
</body>
</html>