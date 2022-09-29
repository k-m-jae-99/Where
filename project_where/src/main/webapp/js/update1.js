/* 회원정보 수정 Form*/
function updatecheck() {
	if(frm.name.value == "") {
		alert("이름을 입력하세요.");
		frm.name.focus();
		return;
	}if(frm.birthday.value == "") {
		alert("생년월일을 입력하세요.");
		frm.birthday.focus();
		return;
	}if(frm.email.value == "") {
		alert("이메일을 입력하세요.");
		frm.email.focus();
		return;
	}if(frm.address.value == "") {
		alert("주소를 입력하세요.");
		frm.address.focus();
		return;
	}if(frm.dataladdress.value == "") {
		alert("상세주소를 입력하세요.");
		frm.dataladdress.focus();
		return;
	}if(frm.phone.value == "") {
		alert("전화번호를 입력하세요");
		frm.phone.focus();
		return;
	}
	frm.submit();
}
