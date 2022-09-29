<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Where</title>
    <script src="../js/jquery-3.6.0.min.js"></script>
    <script src="../js/jquery-ui.min.js"></script>
    <script src="../js/travel.js"></script>
    <link href="../css/main.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
    section {
    animation: fadein 1.5s; 
   }
   @keyframes fadein {
    0% {
    opacity:0;
    }
    100% {
    opacity:1;
    }
   }
    </style>
</head>	
<body>
    <jsp:include page="mainheader.jsp"></jsp:include>
    <section>
        <h2 id="travel">국내 역사여행</h2>
        <hr>
        <article class="slide">
            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                  <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
                </div>
                <div class="img-thumbnail">
                <div class="carousel-inner">
                  <div class="carousel-item active" data-bs-interval="3000">
                    <img src="../img/img1.jpg" class="d-block w-100" alt="img1">
                  </div>
                  <div class="carousel-item" data-bs-interval="3000">
                    <img src="../img/img2.jpg" class="d-block w-100" alt="img2">
                  </div>
                  <div class="carousel-item" data-bs-interval="3000">
                    <img src="../img/img3.jpg" class="d-block w-100" alt="img3">
                  </div>
                  <div class="carousel-item" data-bs-interval="3000">
                    <img src="../img/img4.jpg" class="d-block w-100" alt="img4">
                  </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                </button>
              </div>
             </div>
        </article>
        <div id="house">우리나라의 문화유산과 전통을 알 수 있는 국내 역사 여행코스 <p>집에 기와를 얹는다는 것은 부유함의 상징이었고, 또 그 안에서도 나름의 층위가 있었다. 그래서 이러한 장면이 그림으로 남아 있어서 선조들의 건축생활상을 엿볼 수 있다. 대표적으로 김홍도의 <기와이기>나 기산 김준근의 풍속도에 잘 나타난다. 사실적으로 표현된 그림 속에서 기와를 얹어 집을 완성하는 과정에 등장하는 사람들 각각이 다른 역할을 하고 있음을 알 수 있다. 다시 말해 기와이기는 많은 노동력과 정교한 기술이 필요한 것이라는 점을 알려 준다.</p></div>
        <br>
        <h2 class="best">이번 달 국내 추천여행</h2>
        <br><br><hr>
        <div class="card" style="width: 18rem;">
            <img src="../img/부산 광안리 해수욕장.jpg" class="card-img-top" alt="부산광안리해수욕장">
            <div class="card-body">
              <h5 class="card-title">부산 광안리 해수욕장</h5>
              <p class="card-text">7월1일 부터 부산 해수욕장이 전부 개장하였다.
                하지만 이왕 간다면 부산 바다축제때 가는게 좋다 판단하기에 추천 하였다.(기간: 07월30일 ~ 08월07일)
                매주 토요일 밤 20:00시, 22:00시에 드론 라이트쇼도 진행하니 낮에 정신없이 놀다가 여유있으면 보는것을 추천한다.
                윈드서핑, 바나나 보트등 해양 레포츠도 즐기고 밤에는 드론쇼를 보며 여름에 더위를 날리기 안성맞춤이다.
            </p>
              <a href="https://www.suyeong.go.kr/tour/index.suyeong?menuCd=DOM_000001102001001000&link=success&cpath=%252Ftour " target="_blank" class="btn btn-primary">자세한 정보</a>
            </div>
        </div>

        <div class="card" style="width: 18rem;">
            <img src="../img/니지모리스튜디오.jpg" class="card-img-top" alt="니지모리 스튜디오">
            <div class="card-body">
              <h5 class="card-title">니지모리 스튜디오</h5>
              <p class="card-text">경기도 동두천에 있는 관광지로 일본 에도시대를 배경으로 마을로 꾸며 놓았다. 코로나로 인해 일본여행을 못 간다면 이곳을 추천한다. 여러 유명한 드라마의 촬영지로도 되었으며 다양한 포토존이 있기에 사진을 남기는걸 좋아하는 분은 더욱 추천한다.</p>
              <a href="https://nijimori.modoo.at/" target="_blank" class="btn btn-primary">자세한 정보</a>
            </div>
        </div>

        <div class="card" style="width: 18rem;">
          <img src="../img/덕풍계곡.jpg" class="card-img-top" alt="덕풍계곡">
          <div class="card-body">
            <h5 class="card-title">덕풍계곡</h5>
            <p class="card-text">강원도 삼척시에 있는 덕풍계곡은 등산을 하며 계곡도 볼 수있는 곳이다. 총 3개의 폭포로 구성이 되어있어 등산코스도 3곳이 있다. 현재는 안전상의 이유로 제2용소까지만 허용된다 하니 자세한 내용은 아래 버튼을 클릭 이후 덕풍계곡 산행코스를 확인하기 바란다.</p>
            <a href="http://valley.invil.org/index.html" target="_blank" class="btn btn-primary">자세한 정보</a>
          </div>
        </div>

        <div class="card" style="width: 18rem;">
          <img src="../img/청풍호반케이블카.jpg" class="card-img-top" alt="청풍 호반 케이블카">
          <div class="card-body">
            <h5 class="card-title">청풍 호반 케이블카</h5>
            <p class="card-text">충북 제천에 방문할때 꼭 간다는 청풍 호반 케이블카는 비봉산 정상까지 연결되어 있어 올라가면서 청풍호 호수와 산을 감상할 수 있다. 그리고 포토존도 많이 있어 사진을 찍고 싶은 사람들이 많이 모이는 곳이다.</p>
            <a href="https://www.cheongpungcablecar.com/" target="_blank" class="btn btn-primary">자세한 정보</a>
          </div>
        </div>
        <br>
        <div id="fastival">
          <h2 class="best">축제</h2>
          <hr id="umm">
          <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
              <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
              <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
              <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="img-thumbnail">
            <div class="carousel-inner">
              <div class="carousel-item active" data-bs-interval="3000">
                <img src="../img/광안리M 드론 라이트쇼.jpg" class="d-block w-100" alt="광안리M 드론 라이트쇼">
                <div class="carousel-caption d-none d-md-block">
                  <h5>광안리M 드론 라이트쇼</h5>
                  <p>매주 토요일 저녁, 새롭고 다양한 콘텐츠로 광안리 밤하늘을 아름답게 장식하는<광안리 M 드론 라이트쇼></p>
                </div>
              </div>
              <div class="carousel-item" data-bs-interval="3000">
                <img src="../img/목포해상W쇼.JPG" class="d-block w-100" alt="목포해상W쇼">
                <div class="carousel-caption d-none d-md-block">
                  <h5>목포해상W쇼</h5>
                  <p>목포해상W쇼는 가족의 시선에서 바라본 아름다운 목포의 이야기</p>
                </div>
              </div>
              <div class="carousel-item" data-bs-interval="3000">
                <img src="../img/신촌 물총축제.jpg" class="d-block w-100" alt="신촌 물총축제">
                <div class="carousel-caption d-none d-md-block">
                  <h5>신촌 물총축제</h5>
                  <p>다양한 워터 어트렉션 및 디제잉 공연과 함께 즐기는 서울 대표 여름축제</p>
                </div>
              </div>
            </div>
          </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>
        <div id="house">대한민국에 일어나는 축제와 즐길거리<p>지역을 알리고 나라를 알리며 모두와 함께 즐기는 신나는 문화생활</p></div>
        </div>
    </section>
    <jsp:include page="mainfooter.jsp"></jsp:include>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</html>