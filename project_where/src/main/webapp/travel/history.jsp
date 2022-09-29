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
    <link href="../css/history.css" rel="stylesheet" type="text/css">
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
          <a class="nav-link" href="overseas.jsp">해외 여행</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="history.jsp">역사 여행</a>
        </li>
      </ul>
      <br>
      <div class="d-flex align-items-start">
        <div class="nav flex-column nav-pills me-3" id="v-pills-tab" role="tablist" aria-orientation="vertical">
          <button class="nav-link active" id="v-pills-home-tab" data-bs-toggle="pill" data-bs-target="#v-pills-home" type="button" role="tab" aria-controls="v-pills-home" aria-selected="true">선사, 고조선시대</button>
          <button class="nav-link" id="v-pills-profile-tab" data-bs-toggle="pill" data-bs-target="#v-pills-profile" type="button" role="tab" aria-controls="v-pills-profile" aria-selected="false">삼국시대</button>
          <button class="nav-link" id="v-pills-messages-tab" data-bs-toggle="pill" data-bs-target="#v-pills-messages" type="button" role="tab" aria-controls="v-pills-messages" aria-selected="false">고려시대</button>
          <button class="nav-link" id="v-pills-settings-tab" data-bs-toggle="pill" data-bs-target="#v-pills-settings" type="button" role="tab" aria-controls="v-pills-settings" aria-selected="false">대한제국</button>
        </div>
        <div class="tab-content" id="v-pills-tabContent">
          <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
            <div class="accordion" id="accordionPanelsStayOpenExample">
              <div class="accordion-item">
                <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                  <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                    여행지 : 삼성궁
                  </button>
                </h2>
                <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
                  <div class="accordion-body"> 
                    <img src="../img/삼성궁.jpg" alt="삼성궁" class="img-thumbnail">
                    <p class="top">환인, 환웅, 단군을 모시는 배달겨레의 성전이며, 수도장이다. 옛날부터 전해 내려오던 선도를 이어받은 한풀선사가 수자(修子)들과 함께 수련하며 돌을 쌓아올린 1,500여 개 돌탑이 주변의 숲과 어울려 이국적인 정취를 풍겨낸다. 이 돌탑들은 이 곳에서 원력 솟대라 부른다. 삼한 시대에 천신께 제사지내던 성지, 소도(蘇塗)엔 보통사람들의 접근을 금하려 높은나무에 기러기 조각을 얹은 솟대로 표시를 했다. 지금 성황당에 기원을 담듯, 소원을 빌며 지리산 자락의 돌로 솟대를 쌓아 옛 소도를 복원하고 있다. 3,333개의 솟대를 쌓아 성전을 이루고 우리 민족 고유의 정신 문화를 되찾아 홍익인간 세계를 이루자며 무예와 가, 무, 악을 수련하는 이들의 터전이다.</p>
                  </div>
                </div>
              </div>
              <div class="accordion-item">
                <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                    여행지 : 인천 검단선사박물관
                  </button>
                </h2>
                <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
                  <div class="accordion-body">
                  	<img src="../img/인천검단선사박물관.jpg" alt="인천검단선사박물관" class="img-thumbnail">
                    <p class="top">검단지역에서는 지난 1999년부터 토지구획정리사업의 일환으로 문화유적 발굴조사가 시행되었다. </br>조사 결과 청동기시대를 중심으로 구석기시대에서 조선시대에 이르는 다양한 시기의 유적과 유물이 확인되었으며,</br> 이러한 발굴성과를 토대로 2008년 11월 27일 검단선사박물관이 개관하게 되었다.</br> 검단선사박물관은 선사시대의 생활상을 시대별, 지역별로 전시하고 있으며,</br> 선사시대 문화를 직접 체험해볼 수 있는 체험학습실도 운영하고 있다.</p>
                  </div>
                </div>
              </div>
              <div class="accordion-item">
                <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                    여행지 : 강화 고인돌 유적
                  </button>
                </h2>
                <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
                  <div class="accordion-body">
                  	<img src="../img/강화고인돌유적.jpg" alt="인천검단선사박물관" class="img-thumbnail">
                    <p class="top">청동기시대의 대표적인 묘제의 하나로서 사적으로 지정되었다. 길이 710cm, 높이 260cm, 넓이 550cm의 커다란 돌을 사용했으며, 형태는 북방식 고인돌로서 상고사와 고대사의 좋은 연구 자료가 되고 있다. 2000년 11월 29일 호주 케인즈 제 24차 유네스코 세계문화유산위원회에서 고창, 화순의 고인돌과 함께 세계문화유산으로 등록되었다. 한국의 고인돌은 거대한 바위를 이용해 만들어진 선사시대 거석기념물로 무덤의 일종이며, 고창, 화순, 강화 세 지역에 나뉘어 분포하고 있다. 한 지역에 수백 기 이상의 고인돌이 집중 분포하고 있으며, 형식의 다양성과 밀집도 면에서 세계적으로 유례를 찾기 어렵다. 이 세 지역의 고인돌은 고인돌 문화의 형성 과정과 함께 한국 청동기시대의 사회구조 및 동북아시아 선사시대의 문화 교류를 연구하는 데 매우 중요한 유산이다.</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
            <div class="accordion" id="accordionPanelsStayOpenExample">
              <div class="accordion-item">
                <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                  <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                    여행지 : 보은 삼년산성
                  </button>
                </h2>
                <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
                  <div class="accordion-body">
                    <img src="../img/보은삼년산성.jpg" alt="보은삼년산성" class="img-thumbnail">
                    <p class="top">충북 보은군 보은읍 성주1길 104에는 신라시대 산성인 삼년산성이 있다. 둘레 1.7km, 넓이 8~10m, 높이 13~20m 규모의 삼년산성은 난공불락의 요새다. 성벽 아래에 서면 정육각형 벽돌로 깎아 쌓은 정교한 솜씨와 높고 튼튼한 기품에 압도된다. 삼년산성이라는 이름은 성을 쌓는 데 3년이 걸렸기 때문이라고도 하고, 삼국시대 보은의 지명이 삼년군이었기 때문이라고도 한다. 백제 성왕을 공격한 신라의 관산성 전투부대가 이곳에 주둔했었다. 태종무열왕이 당나라 사신을 접견한 곳도, 고려 왕건이 패퇴해 물러간 곳도 이곳이다. 삼국통일의 유리한 거점이었던 성곽에는 당시의 치열했던 전투는 간곳없고 돌에 낀 이끼에 평화가 느껴진다.주차장에서 10여 분을 오르면 산성 탐방이 시작되는 서문에 닿는다. 웅장한 성벽이 양쪽으로 서 있는데, 거대한 문은 어디 가고 문을 달았던 자리만이 덩그러니 남아 있다.</p>
                  </div>
                </div>
              </div>
              <div class="accordion-item">
                <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                    여행지 : 무령왕릉
                  </button>
                </h2>
                <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
                  <div class="accordion-body">
                  	<img src="../img/무령왕릉.jpg" alt="무령왕릉" class="img-thumbnail">
                    <p class="top">충청남도 공주시에 위치한 백제 제25대 임금 무령왕의 무덤이다. 무령왕릉을 포함한 이 일대의 고분들은 모두 7기가 전해지는데, 송산을 주산으로 뻗은 구릉 중턱의 남쪽 경사면에 위치한다. 계곡을 사이에 두고 서쪽에는 무령왕릉과 5·6호분이 있고 동북쪽에는 1∼4호분이 있다. 1∼6호분은 일제시대에 조사되어 고분의 구조와 형식이 밝혀졌고, 무령왕릉은 1971년 5 ·6호분의 보수공사 때 발견되었다. 무령왕릉은 연화문(연꽃무늬) 벽돌로 아치를 쌓은 아치형 벽돌무덤으로, 무령왕릉에서 출토된 유물로는 금관, 금은 장신구, 석수(돌짐승), 동자상, 청동거울, 도자기, 지석 등이 있다. 무령왕릉에서 있었던 대규모 발굴 덕분에 백제의 국가상, 사회생활, 남조 양나라와의 문화교류, 장사를 지내는 예법을 알 수 있게 되었으며, 삼국시대 고구려, 백제, 신라 등 나라의 상호 간에 문화교류, 각국 문화의 특수한 점과 공통되는 점을 확인할 수 있었다. 무령왕릉은 백제 문화의 이해라는 측면에서 학술적 가치가 매우 높은 고분이다.</p>
                  </div>
                </div>
              </div>
              <div class="accordion-item">
                <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                    여행지 : 충주 고구려비 전시관
                  </button>
                </h2>
                <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
                  <div class="accordion-body">
                 	<img src="../img/충주고구려비전시관.jpg" alt="충주고구려비전시관" class="img-thumbnail">
                    <p class="top">충주고구려비전시관에 가면 국내 유일의 고구려 석비인 충주 고구려비(국보)를 만나볼 수 있다.</br> 오래전부터 가금면 용전리 입석마을 앞에 서 있었던 이 비석은 1979년에 이르러서야 그 가치가 세상에 알려졌다.</br> 장수왕이 남한강 유역을 공략한 후 세운 기념비로 추정, 고구려비로 명명됐다.</br> 이후 보호각이 건립됐고 2012년에 드디어 충주고구려비전시관이 문을 열었다.</br> 전시관은 고구려의 유산, 설화, 생활상, 역사와 함께 안악 3호분, 광개토대왕비, 충주 고구려비 발견 과정 등을 소개하고 있다.</br> 충주 고구려비의 위대한 역사적 가치를 느낄 수 있다.</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
            <div class="accordion" id="accordionPanelsStayOpenExample">
              <div class="accordion-item">
                <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                  <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                    여행지 : 고려궁지
                  </button>
                </h2>
                <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
                  <div class="accordion-body">
                  <img src="../img/고려궁지.jpg" alt="고려궁지" class="img-thumbnail">
                    <p class="top">고려 고종 19년에 몽골군의 침입에 대항하기 위하여 왕도가 강화로 옮겨졌다. 이때 옮겨진 도읍터가 고려궁지로 원종 11년 환도할 때까지 39년간 사용되었다. 고려궁지는 규모는 작으나 송도 궁궐과 비슷하게 만들어졌고, 궁궐 뒷산 이름도 송악이라 하여 왕도의 제도를 잊지 않으려 하였다고 한다.병자호란 당시 강화성이 청군에게 함락된 사실이 있으며, 그 후 고려 궁터에는 조선 궁전건물(장령전, 행궁, 만령전, 봉선전, 외규장각, 척천정, 세심재 등) 및 유수부 건물들이 있었으나 1866년 병인양요 시 프랑스군에 의해 건물 등이 소실되고 지금은 유수부의 동헌과 이방청 건물만이 남아있다. 이 곳은 1977년 보수 정화되어 우리 민족의 자주정신과 국난극복의 역사적 교훈을 안겨주는 국민 교육의 장으로 활용되고 있다.</p>
                  </div>
                </div>
              </div>
              <div class="accordion-item">
                <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                    여행지 : 경복궁
                  </button>
                </h2>
                <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
                  <div class="accordion-body">
                  	<img src="../img/경복궁.jpg" alt="경복궁" class="img-thumbnail">
                    <p class="top">경복궁은 1395년 태조 이성계에 의해서 새로운 조선왕조의 법궁으로 지어졌다. 경복궁은 동궐(창덕궁)이나 서궐(경희궁)에 비해 위치가 북쪽에 있어 ''북궐''이라 불리기도 했다. 경복궁은 5대 궁궐 가운데 으뜸의 규모와 건축미를 자랑한다. 경복궁 근정전에서 즉위식을 가진 왕들을 보면 제2대 정종, 제4대 세종, 제6대 단종, 제7대 세조, 제9대 성종, 제11대 중종, 제13대 명종 등이다. 경복궁은 임진왜란 때 상당수의 건물이 불타 없어진 아픔을 갖고 있으며, 고종 때에 흥선대원군의 주도 아래 7,700여칸에 이르는 건물들을 다시 세웠다. 그러나 또 다시 명성황후 시해사건이 일어나면서 왕조의 몰락과 함께 경복궁도 왕궁으로서의 기능을 상실하고 말았다. 경복궁에는 조선시대의 대표적인 건축물인 경회루와 향원정의 연못이 원형대로 남아 있으며, 근정전의 월대와 조각상들은 당시의 조각미술을 대표한다. 현재 흥례문 밖 서편에는 국립고궁 박물관이 위치하고 있고, 경복궁 내 향원정의 동편에는 국립민속 박물관이 위치하고 있다.</p>
                  </div>
                </div>
              </div>
              <div class="accordion-item">
                <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                    여행지 : 문경새재
                  </button>
                </h2>
                <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
                  <div class="accordion-body">
                  	<img src="../img/문경새재.jpg" alt="문경새재" class="img-thumbnail">
                    <p class="top">백두대간의 조령산 마루를 넘는 새재는 예로부터 한강과 낙동강 유역을 잇는 영남대로 상의 가장 높고 험한 고개였다. 새도 날아서 넘기 힘든 고개, 억새풀이 우거진 고개, 또는 하늘재와 이우리재 사이, 새로 된 고개 등의 뜻으로 새재라는 이름이 지어졌다. 임진왜란 이후, 이곳에 주흘관, 조곡관, 조령관 등 3개의 관문(사적 제147호)을 설치하고 국방의 요새로 삼았다. 문경읍에서 서북쪽으로 깊은 협곡을 따라 3.5km 가면 조선 숙종 34년 (1708년)에 쌓은 영남 제 1관문인 주흘관문에 이르며, 3km 더 가면 제 2관문인 조곡관, 이곳에서 3.5km 떨어진 곳에 제 3관문인 조령관이 있다. 이 일대를 1981년 도립공원으로 지정했다. 문경의 3관문을 품고 있는 주흘산(1,106m)은 관문까지의 험한 계곡에 이루어진 풍치가 매우 뛰어나며, 여궁폭포, 혜국사, 용추, 원터, 교귀정 등의 명소가 있다. 최근에는 KBS 촬영장이 들어서 관광명소로 거듭나고 있다. 경복궁, 광화문, 사정전, 동궁전, 궐내각사, 양반집, 초가집 등에서 대왕세종 촬영장을 감상하실 수가 있다. 또한 선덕여왕과 SBS 제중원, KBS 추노, 넷플릭스 킹덤 등이 촬영되어 드라마 장소를 볼 수 있는 곳이다. 역사 속으로 시간여행을 떠날 수 있고, 문경새재도립공원을 걸으면서 아름다운 풍광도 관람할 수 있는 곳이다. 사극과 현대물이 수시로 촬영되는 곳이기에 움직이는 무대에서 좋은 추억을 남길 수 있는 곳이다. 제1관문인 주흘관에서 제3관문인 조령관까지는 약 6.5km로 왕복 4시간 정도 걸리는 길이지만 길이 완만하고 나무가 우거져 있어 가벼운 트레킹 코스로 인기다. 조곡관 뒤편의 약수터에서는 휴식을 취하기 좋다. 발 씻는 곳이 따로 있어 편안하게 맨발로 산책하기 좋다. 옛길박물-문경새재 오픈세트장 구간을 운행하는 무공해 전동차를 타고 맑은 공기와 아름다운 경관을 감상할 수도 있다.</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
            <div class="accordion" id="accordionPanelsStayOpenExample">
              <div class="accordion-item">
                <h2 class="accordion-header" id="panelsStayOpen-headingOne">
                  <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
                    여행지 : 일제강점기 군산역사관
                  </button>
                </h2>
                <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" aria-labelledby="panelsStayOpen-headingOne">
                  <div class="accordion-body">
                  	<img src="../img/일제강점기 군산역사관.jpg" alt="일제강점기 군산역사관" class="img-thumbnail">
                    <p class="top">시립 「일제강점기 군산역사관」은 인권과 평화, 화합의 장이며, 과거 일제의 수탈사를 바로 익혀 미래의 대한민국 역사를 만드는 곳이다. 일제강점기 군산역사관은 사람, 유물, 시설이 교감해야 한다고 생각한다. 또한 관람객과의 소통과 군산 개항에서 해방까지의 자료와 유물을 통한 역사는 보존되고 왜곡되지 말아야한다. 이를 바탕으로 현대의 박물관이 지향하는 화합과 교감의 가치를 발현하는 데 노력하고자 한다. 일제에 의한 강제수탈의 아픔은 마땅히 기억되어야 할 준엄한 역사이며, 이를 새롭게 인식하고 치유해가는 미래와의 소통 역시 중요한 문제다. 일제강점기 군산역사관도 아픔의 기억을 지속적으로 수집하고 연구·전시와 교육을 통해 이를 증명하여 과거와 미래의 역사를 지키는 것을 목적을 두고있다.</p>
                  </div>
                </div>
              </div>
              <div class="accordion-item">
                <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseTwo" aria-expanded="false" aria-controls="panelsStayOpen-collapseTwo">
                    여행지 : 서대문 형무소
                  </button>
                </h2>
                <div id="panelsStayOpen-collapseTwo" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingTwo">
                  <div class="accordion-body">
                  	<img src="../img/서대문형무소.jpg" alt="서대문형무소" class="img-thumbnail">
                    <p class="top">서대문형무소는 대한제국 말에 일제의 강압으로 감옥이 지어져 80여 년 동안 우리 근·현대사 격동기의 수난과 민족의 한이 서려있는 역사의 현장이자 우리 민족의 항일 독립운동에 대한 일본 제국주의의 대표적인 탄압기관이었다.1908년 10월 21일에 경성감옥이란 이름으로 문을 연 뒤 일제에게 우리의 국권이 빼앗기자 이에 항거하는 민족독립운동이 전국에서 거세게 일어나고 일제는 수많은 우리의 애국지사들을 체포 투옥시켰다. 수용인원이 증가하자 그들은 마포 공덕동에 또 다른 감옥을 지었고, 이 때문에 1912년 9월 3일에 서대문감옥으로 이름이 바뀌었다. 이름의 변화만큼이나 많은 민족수난의 역사를 간직한 채 1992년 8월15일에 현재의 ''서대문독립공원''으로 개원하였다.</p>
                  </div>
                </div>
              </div>
              <div class="accordion-item">
                <h2 class="accordion-header" id="panelsStayOpen-headingThree">
                  <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseThree" aria-expanded="false" aria-controls="panelsStayOpen-collapseThree">
                    여행지 : 천안 독립기념관
                  </button>
                </h2>
                <div id="panelsStayOpen-collapseThree" class="accordion-collapse collapse" aria-labelledby="panelsStayOpen-headingThree">
                  <div class="accordion-body">
                  	<img src="../img/천안 독립기념관.jpg" alt="천안 독립기념관" class="img-thumbnail">
                    <p class="top">대한민국의 박물관. 이를 운영하는 국가보훈처 산하 공공기관(준정부기관) 역시 '독립기념관'이다. 겨레의 탑과 불굴의 한국인 상이 박물관의 상징이며, 이 박물관이 바로 천안시의 랜드마크이다. 일제강점기의 수난과 나라를 되찾기 위해 싸운 독립 운동이 주요 주제이다. 관람료는 무료이며 관람 시간은 하절기(3월~10월) 9:30~18:00, 동절기(11월~2월) 9:30~17:00로 관람 마감 1시간 전까지는 입장해야 한다. 또한 정기 휴무일은 매주 월요일이다. 독립기념관은 외침을 극복하고 민족의 자주와 독립을 지켜온 우리 민족의 국난극복사와 국가발전사에 관한 자료를 수집·보존·전시·조사·연구함으로써 민족문화의 정체성을 확립 하고 국민의 투철한 민족정신과 국가관을 정립하는데 이바지함을 목적으로 1987년 8월15일 온 국민의 정성어린 성금으로 건립되었다.</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
	<jsp:include page="mainfooter.jsp"></jsp:include>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</html>