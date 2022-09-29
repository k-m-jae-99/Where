<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Where</title>
<script src="../js/jquery-3.6.0.min.js"></script>
    <script src="../js/jquery-ui.min.js"></script>
    <script src="../js/travel.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="../css/main.css" rel="stylesheet" type="text/css">
<style>
	#card1{
  animation-duration: 1s;
   }
	#card2{
  animation-duration: 1.5s;
   }
   #card3{
  animation-duration: 2s;
   }
   #card4{
  animation-duration: 2.5s;
   }
.card {
  animation-name: slidein;
  animation-direction: top;
	}
	@keyframes slidein {
	from {
	margin-top: 10%;
	opacity:0;
	}
	top{
	margin-top: 0%;
	opacity:1;
	}
</style>
</head>
<body>
	<jsp:include page="mainheader.jsp"></jsp:include>
		<section>
      <ul class="nav nav-tabs">
        <li class="nav-item">
          <a class="nav-link" href="month.jsp">이번 달 추천</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="korea.jsp">국내 여행</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="overseas.jsp">해외 여행</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="history.jsp">역사 여행</a>
        </li>
      </ul>
      <br>
        <div id="card1" class="card" style="width: 18rem;">
            <img src="../img/하와이.jpg" class="card-img-top" alt="하와이">
            <div class="card-body">
              <h5 class="card-title">하와이</h5>
              <p class="card-text">미국의 50번째 주로 태평양의 낙원이다. 항상 따뜻한 날씨와 아름다운 바다로 서퍼들에게 사랑받는 곳이다. 그 이외에도 여러 좋은 리조트들과 경관, 여러 엑티비티를 즐길 수 있어 여름 휴가로 최적화 되어있다.</p>
            </div>
        </div>

        <div id="card2" class="card" style="width: 18rem;">
          <img src="../img/태국 방콕.jpg" class="card-img-top" alt="태국 방콕">
          <div class="card-body">
            <h5 class="card-title">태국 방콕</h5>
            <p class="card-text">태국 방콕은 태국의 수도로 저렴한 물가로 여러 여행객들이 주로 가는 곳이라 한다. 기후로 인한 열대과일과 여러 먹거리를 저렴하게 즐길 수 있고, 고급 호텔도 저렴한 가격으로 이용할 수 있다.</p>
          </div>
        </div>

        <div id="card3" class="card" style="width: 18rem;">
          <img src="../img/캐나다 밴프.jpg" class="card-img-top" alt="캐나다 밴프">
          <div class="card-body">
            <h5 class="card-title">캐나다 밴프</h5>
            <p class="card-text">캐나다 로키 산맥에서 1~2시간 쯤 떨어져 있는 도시 밴프는 주로 캐나다 인들이 여름 휴가오는 장소중 하나로 로키산맥과 여러 아름다운 경관을 자랑하는 도시하고한다. 여름 철에는 로키산맥에 빙하가 녹아 에메랄드 빛 호수를 볼 수 있다고한다.</p>
            </div>
        </div>

        <div id="card4" class="card" style="width: 18rem;">
          <img src="../img/호주 시드니.jpg" class="card-img-top" alt="호주 시드니">
          <div class="card-body">
            <h5 class="card-title">호주 시드니</h5>
            <p class="card-text">호주에서 가장 큰 도시인 시드니는 지구의 남반부에 있어 대한민국과 반대인 날씨로 시원한 여름을 보낼수 있다. 나폴리, 리우데자네이루와 함께 세계 3대 미항 도시로 불리며 고층 빌딩과 현대적인 건축물이 아름답게 조화를 이루고 있다.</p>
          </div>
        </div>
    </section>
	<jsp:include page="mainfooter.jsp"></jsp:include>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</html>