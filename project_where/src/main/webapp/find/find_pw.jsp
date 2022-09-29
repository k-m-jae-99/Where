<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Where</title>
<link href="../css/find_pw.css" rel="stylesheet" type="text/css">
<script src ="../js/search.js"></script>
</head>
<body>
	<form name="pwfindscreen" method = "POST">
			<div class = "search-title">
				<h3>비밀번호 찾기</h3>
			</div>
		<section class = "form-search">
				<div class=info>
					<span>아이디</span>
						<input type="text" name="id" class = "btn" placeholder = "아이디 입력"><br><br>
					<span class="num">번호</span>
						<input type="text" name="phone" class = "btn" id="inputnum" placeholder = "전화번호 입력"> <br>
				</div>
	</section>
	<div class ="btnSearch">
		<input type="button" name="enter" value="찾기"  class = "search" onClick="pw_search()">
		<input type="button" name="cancle" value="취소" class = "search" onClick="self.close()">
 	</div>
 </form>
</body>
</html>