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
          <a class="nav-link active" aria-current="page" href="korea.jsp">국내 여행</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="overseas.jsp">해외 여행</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="history.jsp">역사 여행</a>
        </li>
      </ul>
      <br>
        <div id="card1" class="card" style="width: 18rem;">
            <img src="../img/여수 해상 케이블카.jpg" class="card-img-top" alt="여수해상케이블카">
            <div class="card-body">
              <h5 class="card-title">여수 해상 케이블카</h5>
              <p class="card-text">전남 여수시에 있는 여수해상케이블카는 바다 위를 통과하여 돌산(섬)과 자산(육지)를 연결하는 해상케이블카이다. 크리스탈 캐빈과 일반 캐빈으로 구성되어 있으며, 크리스탈 캐빈은 투명한 바닥으로 발 밑의 바다를 관망할 수 있어서 탁 트인 시각적인 즐거움과 짜릿한 스릴감을 느낄 수 있다. 그리고 케이블카를 이용하면서 보는 일몰은 장관이다.</p>
              <a href="http://yeosucablecar.com/?ckattempt=1" target="_blank" class="btn btn-primary">자세한 정보</a>
            </div>
        </div>

        <div id="card2" class="card" style="width: 18rem;">
          <img src="../img/원앙폭포.jpg" class="card-img-top" alt="원앙폭포">
          <div class="card-body">
            <h5 class="card-title"> 돈내코 원앙폭포</h5>
            <p class="card-text">제주도 돈내코 원앙폭포는 계곡 양편이 상록수림으로 울창하게 덮여 있고 높이 5m의 원앙폭포 (돈내코 입구에서 1.5㎞, 20분 소요)와 작은 못이 있어 그 경치가 매우 수려하다. 한라산에서 내려오는 얼음같이 차고 맑은 물이 항상 흐르고, 주변경관 또한 빼어나 물맞이를 비롯한 피서지로 유명한 곳이다. 돈내코 유원지 입구에서 계곡까지 약 700m 정도에 달하는 숲길은 나무가 빽빽이 들어서 있고 중간 중간에 나무 벤치가 있어 산림욕하기에 좋다.</p>
            <a href="https://www.visitjeju.net/kr/detail/view?contentsid=CNTS_000000000019594" target="_blank" class="btn btn-primary">자세한 정보</a>
          </div>
        </div>

        <div id="card3" class="card" style="width: 18rem;">
          <img src="../img/석모도 수목원.JPG" class="card-img-top" alt="석모도 수목원">
          <div class="card-body">
            <h5 class="card-title">석모도 수목원</h5>
            <p class="card-text">인천 강화에 위치한 석모도수목원은 기후온난화에 대비하여 북방한계성 식물 및 해양성 식물연구에 적합한 점을 인정받아 석모도에 자리 잡게 되었다. 또한, 석모리 일대의 계곡부를 따라 조성되어 오염되지 않은 천혜의 자연환경을 자랑한다. 산과 바다가 같이 공존하고, 숲이 가진 다양한 가치와 기능을 전달하며 자연과 교감할 수 있는 관광지이다.</p>
            <a href="https://forest.ganghwa.go.kr/arboretum/introduce.jsp" target="_blank" class="btn btn-primary">자세한 정보</a>
          </div>
        </div>

        <div id="card4" class="card" style="width: 18rem;">
          <img src="../img/단양다누리아쿠아리움.jpg" class="card-img-top" alt="단양다누리아쿠아리움">
          <div class="card-body">
            <h5 class="card-title">단양 다누리 아쿠아리움</h5>
            <p class="card-text">충북 단양에 있는 민물고기 생태관 다누리아쿠아리움에는 국내 어류 63종 2만여 마리, 해외 어류 87종 1,600여 마리 등이 있다. 세계 다양한 물고기와 남한간 토종 물고기인 황쏘가리, 은어, 납자루 등을 한 눈에 볼 수 있는 곳이다. 또한, 다누리아쿠아리움의 수족관은 단양팔경 테마로 꾸며져 또 다른 볼거리를 제공한다.</p>
            <a href="https://www.danyang.go.kr/aquarium/1383" target="_blank" class="btn btn-primary">자세한 정보</a>
          </div>
        </div>
		</section>
	<jsp:include page="mainfooter.jsp"></jsp:include>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</html>