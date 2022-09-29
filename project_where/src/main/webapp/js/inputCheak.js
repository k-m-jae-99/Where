function inputCheck() {
	if(document.regFrm.id.value == "") {
		alert("아이디를 입력해 주세요");
		document.regFrm.id.focus();
		return;
	}
	if(document.regFrm.pw.value == "") {
		alert("비밀번호를 입력해 주세요");
		document.regFrm.pw.focus();
		return;
	}
	if(document.regFrm.repw.value == "") {
		alert("비밀번호를 확인해 주세요");
		document.regFrm.repw.focus();
		return;
	}
	if(document.regFrm.pw.value != document.regFrm.repw.value) {
		alert("비밀번호가 일치하지 않습니다");
		document.regFrm.repwd.value = "";
		document.regFrm.repwd.focus();
		return;
	}
	if(document.regFrm.name.value == "") {
		alert("이름을 입력해 주세요");
		document.regFrm.name.focus();
		return;
	}
	if(document.regFrm.birthday.value == "") {
		alert("생년월일을 입력해 주세요");
		document.regFrm.birthday.focus();
		return;
	}
	if(document.regFrm.email.value == "") {
		alert("이메일을 입력해 주세요");
		document.regFrm.email.focus();
		return;
	}
	if(document.regFrm.zipcode.value == "") {
		alert("우편번호를 검색해 주세요");
		return;
	}
	if(document.regFrm.address.value == "") {
		alert("주소를 입력해주세요");
		return;
	}
	if(document.regFrm.phone.value == "") {
		alert("전화번호를 입력해주세요");
		return;
	}
	document.regFrm.submit();
}
function win_close() {
	self.close();
}
