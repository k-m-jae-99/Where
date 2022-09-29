//글쓰기 등록전에 알림창
function sub(){
	var form = document.postFrm
	var flag = confirm("등록하시겠습니까?");
	if(flag == true) {
		alert("등록되었습니다.");
		location.href="../travelboard/board.jsp";
	}else{
		return;
	}
	form.submit();
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
		