/* 아이디 찾기 버튼 Form*/
function id_search() { 
 	var frm = document.idfindscreen;

 	if (frm.name.value.length < 1) {
	  alert("이름을 입력해주세요");
	  frm.name.focus();
	  return;
	 }

	 if (frm.phone.value.length != 13) {
		  alert("핸드폰번호를 정확하게 입력해주세요");
		  frm.phone.focus();
		  return;
	 }
 frm.method = "post";
 frm.action = "find_id_Result.jsp";
 frm.submit();  
 }
 
/* 비밀번호 찾기 Form */
function pw_search() { 
 	var frm = document.pwfindscreen;

 	if (frm.id.value.length < 3) {
	  alert("아이디를 입력해주세요");
	  frm.id.focus();
	  return;
	 }

	 if (frm.phone.value.length != 13) {
		  alert("핸드폰번호를 정확하게 입력해주세요");
		  frm.phone.focus();
		  return;
	 }
 frm.method = "post";
 frm.action = "find_pw_Result.jsp";
 frm.submit();  
 }