//수정전에 알림창
function check() {
		if(document.updateFrm.pass.value == "") {
			alert("수정을 위해 비밀번호를 입력하세요");
			document.updateFrm.pass.focus();
			return false;
		} else {
		var form = document.postFrm
		var flag = confirm("수정하시겠습니까?");
		if(flag == true) {
		alert("수정되었습니다.");
		}else{
		return;
		}
	}
		document.updateFrm.submit();
}
//취소 버튼 눌렀을때 알림창
function bpg(){
	var flag = confirm("페이지를 나가시겠습니까?");
	if(flag == true) {
	location.href="../travelboard/board.jsp";
	}else{
		return;
	}
}
		