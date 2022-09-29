<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Where</title>
<link rel="stylesheet" href="../css/login.css?after">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<script src="../js/login.js"></script> <!--로그인 -->
<script src="../js/find.js"></script> <!-- 아이디 & 비밀번호 찾기 -->
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script> <!-- 카카오로그인 -->
<script src="../js/kakao.js"></script> <!-- 카카오로그인 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
<!-- Header Part -->
<jsp:include page="loginheader.jsp" />

<!-- Section Part -->
	<section>
		<h1 align="center">LOGIN</h1><hr>
			
	 	<!-- Login Form -->
			<div class="loginFrm">
				<form name="form_log" method="post">
			       <h2 class="title" align="center"><b>WHERE</b></h2>
			           <div class="align">
			               <input type="text" id="mid" name="id" placeholder="아이디"><br><br>
			               <input type="password" id="pwd" name="pw" placeholder="비밀번호">
			               <br><br>
			               <input type="button" name="member_login" value="로그인" id="btn" onClick="enter()" >
			           </div><br><br>
			 
		<!-- Find Form -->   
			<div class="find">
			    <span><a href="javascript:findid()">아이디찾기 | </a></span>
				<span><a href="javascript:findpw()"> 비밀번호 찾기 | </a></span> 
				<span><a href="../join/join.jsp"> 회원가입</a></span>
			</div>
		
		<!-- 중간 밑줄 -->
			<div class="hr-sect"> <b> or </b> </div>
		
		<!-- Kakao Login -->
			<div class="kakaologin">
				<a onclick="kakaoLogin()">
					<img src="../img/카카오로그인.png" id="kakao"/>
				</a>
			</div>
				</form>
			</div>
	</section>

<!-- Footer Part -->
<jsp:include page="../travel/mainfooter.jsp" />
</body>
</html>