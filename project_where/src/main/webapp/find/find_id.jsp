<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Where</title>
<link href="../css/find_id.css" rel="stylesheet" type="text/css">
<script src="../js/search.js"></script>
</head>
<body>
	<form name="idfindscreen" method = "POST">
			<div class = "search-title">
				<h3>아이디 찾기</h3>
			</div>
		<section class = "form-search">
				<div class=info>
					<span>이름</span>
						<input type="text" name="name" class = "btn" placeholder = "등록한 이름"><br><br>
					<span>번호</span>
						<input type="text" name="phone" class = "btn" placeholder = "전화번호 입력"> <br>
				</div>
		</section>
	<div class ="btnSearch">
		<input type="button" name="enter" value="찾기"  class = "search" onclick="id_search()">
		<input type="button" name="cancle" value="취소" class = "search" onclick="self.close()">
 	</div>
 </form>
</body>
</html>