/* 카카오 로그인 API */
window.Kakao.init('d583926413749b8c6af11ce164261288');
  
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (authObj) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (res) {
        	  console.log(res);
        	  var kakaoid = res.id;
        	  scope : "account_email";
        	  alert("로그인 성공")
        	  location.href="../login/kakao.jsp";
          }
        })
        console.log(authObj);
        var token = authObj.access_token;
      },
      fail: function (error) {
        alert(JSON,stringify(err));
      }
    })  
};