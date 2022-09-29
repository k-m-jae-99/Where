/* 회원가입시 아이디 중복확인*/
function idCheck(id) {
	frm = document.regFrm;
	if(id == "") {
		alert("아이디를 입력해 주세요");
		frm.id.focus();
		return;
	}
	url = "idCheck.jsp?id=" + id;
	window.open(url, "IDCheck", "width=300,height=150");
}
/* 회원가입시 주소창 띄우기 */
function findAddr() {
	new daum.Postcode({
        oncomplete: function(data) {
            var roadAddr = data.roadAddress;
            var jibunAddr = data.jibunAddress;
            var extraAddr = '';
            
            document.getElementById('postcode').value = data.zonecode;
            
            if(roadAddr != '') {
            	if(data.bname != '') {
            		extraAddr += data.bname;
            	}
            	if(data.buildingName != '') {
            		extraAddr += (extraAddr != '' ? ', ' + data.buildingName : data.buildingName);
            	}
            	roadAddr += (extraAddr != '' ? '(' + extraAddr + ')' : '')
            	document.getElementById('addr').value = roadAddr;
            } else if(jibunAddr != '') {
            	document.getElementById('addr').value = jibunAddr;
            }
            document.getElementById('datailAddr').focus();
        }
    }).open();	
}