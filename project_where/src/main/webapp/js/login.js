/* 아이디 비밀번호 빈칸 체크 */
function enter() {
	  var frm = document.form_log;
	  if (frm.id.value == "") {
	   alert("아이디를 입력해주세요");
	   return;
	  }
	  if (frm.pw.value == "") {
	   alert("비밀번호를 입력해주세요");
	   return;
	  }
	  frm.method = "post";
	  frm.action = "loginCtl.jsp";
	  frm.submit();
	}