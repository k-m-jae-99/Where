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
