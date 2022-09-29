<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Where</title>
<script type="text/javascript" src="../js/inputCheak.js" charset="utf-8"></script> <!-- Input이 null인지 Cheak -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 주소 API Part -->
<script src="../js/join.js"></script> <!-- 중복확인 & 주소창 -->
<link href="../css/join.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
<!--Header Part -->
<jsp:include page="joinheader.jsp" />

<!-- Section Part -->
	 <section>
        <h1 align="center">회원가입</h1>
        <hr><br><br>
        <form name="regFrm" method ="post" action="joinProc.jsp">
            <table border="1" align="center" width="800">
                <tr>
                	<td align="center" colspan="4"><h2 class="title"><b>회원가입</b></h2></td>
                </tr>
                <tr>
                    <th>아이디</th>
                    <td>
                        <input name="id" class="input">
                        <input type="button" value="ID중복확인" onClick="idCheck(this.form.id.value)" id=btm>
                    </td>
                    <td>아이디를 입력해 주세요.</td>
                </tr>
                <tr>
                    <th>패스워드</th>
                    <td>
                        <input type="password" name="pw" class="input">
                    </td>
                    <td>패스워드를 입력해 주세요.</td>
                </tr>
                <tr>
                    <th>패스워드 확인</th>
                    <td>
                        <input type="password" name="repw" class="input">
                    </td>
                    <td>패스워드를 한번 더 입력하세요.</td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td>
                        <input name="name" class="input">
                    </td>
                    <td>이름을 입력해 주세요.</td>
                </tr>
                <tr>
                    <th>성별</th>
                    <td>
                        <input type="radio" name="gender" value="1" checked>남&emsp;&emsp;
                        <input type="radio" name="gender" value="2" >여
                    </td>
                    <td>성별을 선택해 주세요.</td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td>
                        <input name="birthday" placeholder="ex) 190315" class="input">
                    </td>
                    <td>생년월일을 입력해 주세요.</td>
                </tr>
                <tr>
                    <th>Email</th>
                    <td>
                        <input name="email" size="40" placeholder="ex) email@naver.com" class="input">
                    </td>
                    <td>이메일을 입력해 주세요.</td>
                </tr>
                <tr>
                    <th>우편번호</th>
                    <td>
                        <input name="zipcode" id="postcode" readonly class="input">
                        <input type="button" value="우편번호 찾기" onClick="findAddr()" id=btm>
                    </td>
                    <td>우편번호를 검색하세요.</td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td>
                        <input name="address" id="addr" size="60" readonly><br>
                        <input name="datailAddress" id="datailAddr" placeholder="상세주소 넣기" size="60">
                    </td>
                    <td>상세주소를 입력해주세요.</td>
                </tr>
                <tr>
                	<th>전화번호</th>
                		<td>
                			<input name="phone" placeholder="ex) 010-1111-2222" onKeyup = "addHypen(this);">
                		</td>
                		<td>전화번호를 입력해주세요.</td>
                </tr>
               
                <tr>
                    <td colspan="3" align="center">
                            <input type="button" value="회원가입" onClick="inputCheck()" id="btn">&emsp;
                            <input type="reset" value="다시쓰기" id="btn">&emsp;
                            <input type="button" value="로그인" onClick="location.href='../login/login.jsp'" id="btn">
                    </td>
                </tr>
            </table>
        </form>
   </section>
   
<!-- Footer Part -->
<jsp:include page="../travel/mainfooter.jsp" />
</body>
</html>