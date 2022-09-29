<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="web.UserDAO, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function login() {
		location.href = "../login/login.jsp"
	}
</script>
</head>
<body>
<%
 	request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String phone = request.getParameter("phone");
     
	UserDAO dao = new UserDAO();
 	String pw = dao.find_pw(id, phone);  
%>

  <form name="idsearch" method="post">
      <%
       if (pw != null) {
      %>
      
      <div class = "container">
      	<div class = "found-success">
	      <h4>  회원님의 비밀번호는  <%=pw %> 입니다.</h4>  
	     </div>
	     <div class = "found-login">
 		    <input type="button" id="btnLogin" value="닫기" onClick = "self.close()"/>
       	</div>
       </div>
      <%
  } else {
 %>
        <div class = "container">
      	<div class = "found-fail">
	      <h4>  등록된 정보가 없습니다 </h4>  
	     </div>
	     <div class = "found-login">
 		    <input type="button" id="btnback" value="다시 찾기" onClick="history.back()"/>
 		    <input type="button" id="btnjoin" value="회원가입" onClick="joinin()"/>
       	</div>
       </div>
 <% } %> 
      </form>
</body>
</html>