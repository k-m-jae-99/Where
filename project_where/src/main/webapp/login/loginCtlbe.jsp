<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="web.UserMgr" %>
<%@ page import="web.UserDTO" %>
    <%
	     request.setCharacterEncoding("UTF-8");
	     String id=request.getParameter("id");
	     String pw=request.getParameter("pw");
	     System.out.println("id:"+id);
	     System.out.println("pw:"+pw);
	     UserMgr um = new UserMgr();
	     UserDTO dto=um.login(id, pw);
	     if(dto.getId()!=null){ 
	      session.setAttribute("id",dto.getId());
	      session.setAttribute("pw",dto.getPw());
	      session.setMaxInactiveInterval(600);
	      response.sendRedirect("../travel/main.jsp");
	     }
    %>
    <script>
	    if(<%=dto.getId() == null%>){ 
	     alert('아이디 혹은 비밀번호가 틀렸습니다.');
	     history.back(); 
	    } 
    </script>
 <html>
 <head>
 </head>
 <body >
 </body>
 </html> 