<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="tour.*" %>
<%@ page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<jsp:useBean id="tMgr" class="tour.TourMgr"></jsp:useBean>
<jsp:useBean id="cmgr" class="tour.BCommentMgr"/>
<%
	request.setCharacterEncoding("UTF-8");
	int totalRecord = 0;   // 전체 레코드 수 : 68개
	int numPerPage = 12;   // 한 페이지당 보여주는 레코드 수
	int pagePerBlock = 10;  // 블록당 페이지 수 [1][2][3][4][5]
			
	int totalPage = 0;     //  전체 페이지 수 [1][2][3][4][5][6][7] // 68개면 7까지 나와야됨
	int totalBlock = 0;    //  전체 블록 수 : 2    [1][2][3][4][5]  [6][7]
			
	int nowPage = 1;       //  현재 레코드가 해당하는 페이지  
	int nowBlock = 1;      //  현재 레코드가 해당하는 블록
	
	int start = 0;         //  DB테이블의 SELECT 시작번호()
	int end = 0;           //  DB테이블에서 페이지에 맞는 10개 가져오기
	int listSize = 0;      //  읽어온 게시물의 수 
	
	String keyWord = "", keyField = "", keyWord2 = "";
	Vector<TourBean> vlist = null;
	if(request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
	}
	if(request.getParameter("reload") != null) {
		if(request.getParameter("reload").equals("true")) {
			keyWord = "";
			keyField = "";
		}
	}
	if(request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	start = ((nowPage * numPerPage) - numPerPage) +1;
	end = nowPage * numPerPage;
	
	totalRecord = tMgr.getTotalCount(keyField, keyWord);
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage);  // 전체 페이지 수
	nowBlock = (int)Math.ceil((double)nowPage / pagePerBlock);     // 현재 블럭 계산
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock); // 전체 블럭 계산
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Where</title>
<style>
	a:link {text-decoration:none;color:black;}
	a:hover{text-decoration:yes;color:#66CCFF;}
	a:visited {text-decoration:none;}

	tr { width: 300px; }

	.hiddenth { display: none; }

	img { width: 250px; height: 250px; border-radius: 10px; }

	span { overflow: hidden; display: block; width:250px; white-space: nowrap; text-overflow: ellipsis; }

.page_wrap {
	text-align:center;
	font-size:0;
 }
.page_nation {
	display:inline-block;
}
.page_nation .none {
	display:none;
}
.page_nation a {
	display:block;
	margin:0 3px;
	float:left;
	border:1px solid #e6e6e6;
	width:30px;
	height:30px;
	line-height:28px;
	text-align:center;
	background-color:#fff;
	font-size:13px;
	color:#191919;
	text-decoration:none;
}
.page_nation .arrow {
	border:1px solid #ccc;
}
.page_nation .pprev {
	background:#CDCDCD no-repeat center center;
	margin-left:0;
}
.page_nation .prev {
	background:#CDCDCD no-repeat center center;
	margin-right:7px;
}
.page_nation .next {
	background:#CDCDCD no-repeat center center;
	margin-left:7px;
}
.page_nation .nnext {
	background:#CDCDCD no-repeat center center;
	margin-right:0;
}

.back {
	background:#f8f8f8 no-repeat center center;
	margin-right:0;
}

.back {
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
   
.comm { width: 25px; height: 20px; }

</style>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script type="text/javascript">
	function check() {
		if(document.searchFrm2.keyWord.value == "") {
			alert("검색어를 입력하세요");
			document.searchFrm2.keyWord.focus();
			return;
		}
		document.searchFrm2.submit();
	}
	function read(num) {
		document.readFrm.num.value = num;
		document.readFrm.action = "tourRead.jsp";
		document.readFrm.submit();
	}
	function list() {
		document.listFrm.action = "tourList.jsp";
		document.listFrm.submit();
	}
	function block(value) {
		document.readFrm.nowPage.value = <%=pagePerBlock %>*(value-1)+1;
		document.readFrm.submit();
	}
	function pageing(page) {
		document.readFrm.nowPage.value = page;
		document.readFrm.submit();
	}
	
	function categoryChange(e) {
		
		var addr = ["지역을 선택하세요","서울특별시", "인천광역시", "대전광역시", "대구광역시", "광주광역시", "부산광역시", "울산광역시", "세종특별자치시", "경기도", "강원도", "충청북도", "충청남도", "경상북도", "경상남도", "전라북도", "전라남도", "제주특별자치도", "온라인개최"];
		var cat2 = ["타입을 선택하세요","자연", "인문", "레포츠", "쇼핑", "음식", "숙박", "추천코스"];
		
		var target = document.getElementById("opt1");
			
			if(e.value == "addr") var a = addr;
			else if(e.value == "cat2") var a = cat2;
			
			target.options.length = 0;
			
			for (x in a) {
				var opt = document.createElement("option");
				opt.value = a[x];
				opt.innerHTML = a[x];
				target.appendChild(opt);
				
		}
	}
	
	
	
	function optChange(e) {
		var seoul = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
		var incheon = ["계양구","남동구","동구","미추홀구","부평구","서구","연수구","중구","강화군","옹진군"];
		var daejeon = ["대덕구","동구","서구","유성구","중구"];
		var daegu = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
		var gwangju = ["광산구","남구","동구","북구","서구"];
		var busan = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
		var ulsan = ["남구","동구","북구","중구","울주군"];
		var sejong = [""];
		var gyeonggi = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","여주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","연천군"];
		var gangwon = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
		var chungbuk = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군"];
		var chungnam = ["계룡시","공주시","논산시","당진시","보령시","서산시","아산시","천안시","금산군","부여군","서천군","예산군","청양군","태안군","홍성군"];
		var gyeongbuk = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
		var gyeongnam = ["거제시","김해시","밀양시","사천시","양산시","진주시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
		var jeonbuk = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
		var jeonnam = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
		var jeju = ["서귀포시","제주시"];
		var online = [""];
		
		var A01 = ["A0101","A0102"];
		var A02 = ["A0201","A0202","A0203","A0204","A0205","A0206","A0207","A0208"];
		var A03 = ["A0301","A0302","A0303","A0304","A0305"];
		var A04 = ["A0401"];
		var A05 = ["A0502"];
		var B02 = ["B0201"];
		var C01 = ["C0112","C0113","C0114","C0115","C0116","C0117"];
		
		var 자연 = ["자연관광지","관광자원"];
		var 인문 = ["역사관광지","휴양관광지","체험관광지","산업관광지","건축/조형물","문화시설","축제","공연/행사"];
		var 레포츠 = ["레포츠소개","육상레포츠","수상레포츠","항공레포츠","복합레포츠"];
		var 쇼핑 = ["쇼핑"];
		var 음식 = ["음식점"];
		var 숙박 = ["숙박시설"];
		var 추천코스 = ["가족코스","나홀로코스","힐링코스","도보코스","캠핑코스","맛코스"];
		
		var target = document.getElementById("opt2");
		
		if(e.value == "서울특별시") { var d = seoul; var d2 = seoul; var value = e.value+" "; }
		else if(e.value == "인천광역시") { var d = incheon; var d2 = incheon; var value = e.value+" "; }
		else if(e.value == "대전광역시") { var d = daejeon; var d2 = daejeon; var value = e.value+" "; }
		else if(e.value == "대구광역시") { var d = daegu; var d2 = daegu; var value = e.value+" "; }
		else if(e.value == "광주광역시") { var d = gwangju; var d2 = gwangju; var value = e.value+" "; }
		else if(e.value == "부산광역시") { var d = busan; var d2 = busan; var value = e.value+" "; }
		else if(e.value == "울산광역시") { var d = ulsan; var d2 = ulsan; var value = e.value+" "; }
		else if(e.value == "세종특별자치시") { var d = sejong; var d2 = sejong; var value = e.value+" "; }
		else if(e.value == "경기도") { var d = gyeonggi; var d2 = gyeonggi; var value = e.value+" "; }
		else if(e.value == "강원도") { var d = gangwon; var d2 = gangwon; var value = e.value+" "; }
		else if(e.value == "충청북도") { var d = chungbuk; var d2 = chungbuk; var value = e.value+" "; }
		else if(e.value == "충청남도") { var d = chungnam; var d2 = chungnam; var value = e.value+" "; }
		else if(e.value == "경상북도") { var d = gyeongbuk; var d2 = gyeongbuk; var value = e.value+" "; }
		else if(e.value == "경상남도") { var d = gyeongnam; var d2 = gyeongnam; var value = e.value+" "; }
		else if(e.value == "전라북도") { var d = jeonbuk; var d2 = jeonbuk; var value = e.value+" "; }
		else if(e.value == "전라남도") { var d = jeonnam; var d2 = jeonnam; var value = e.value+" "; }
		else if(e.value == "제주특별자치도") { var d = jeju; var d2 = jeju; var value = e.value+" "; }
		else if(e.value == "온라인개최") { var d = online; var d2 = online; var value = e.value+""; }
		
		else if(e.value == "자연") { var d = A01; var d2 = 자연; var value = ""; }
		else if(e.value == "인문") { var d = A02; var d2 = 인문; var value = ""; }
		else if(e.value == "레포츠") { var d = A03; var d2 = 레포츠; var value = ""; }
		else if(e.value == "쇼핑") { var d = A04; var d2 = 쇼핑; var value = ""; }
		else if(e.value == "음식") { var d = A05; var d2 = 음식; var value = ""; }
		else if(e.value == "숙박") { var d = B02; var d2 = 숙박; var value = ""; }
		else if(e.value == "추천코스") { var d = C01; var d2 = 추천코스; var value = ""; }

		target.options.length = 0;
		
		for (x in d) {
			var opt = document.createElement("option");
			opt.value = value+d[x];
			opt.innerHTML = d[x];
			opt.innerHTML = d2[x];
			target.appendChild(opt);
		}
	}
	
	
</script>
</head>
<jsp:include page="tourheader.jsp"></jsp:include>
<br><br><br>
<body align="center" style="width: 1650px;">
<div style="height: 200px;">
<form name="searchFrm" method="get" action="tourList.jsp">
		<table width="500" style="float: right; margin-right: 200px; margin-top: 20px;">
		<tr>
			<td align="center">
				<select  onchange="categoryChange(this)" name=keyField style="width: 70px; height: 25px;">
					<option value="addr">선택</option>
					<option value="addr">지역</option>
					<option value="cat2">관광</option>
				</select>
				
				<select onchange="optChange(this)" id="opt1" style="width: 160px; height: 25px;">
					<option>???</option>
				</select>

				<select id="opt2" name=keyWord style="width: 110px; height: 25px;">
					<option value="">???</option>
				</select>
				<input type="submit" value="검색" style="background-color: #CDCDCD; color: 191919; border: none; width: 100px; height: 25px;">
				<input type="hidden" name="nowPage" value="1">
			</td>
		</tr>
	</table>
</form>	
<form name="searchFrm2" method="get" action="tourList.jsp" >
	<table align="center" width="500" style="clear:both;  margin-right: 200px;">
		<tr>
			<td align="center">
				<select name ="keyField" style="width: 140px; height: 25px;">
					<option value="title">키워드</option>	
				</select>
				<input name="keyWord" placeholder="ex)축제" style="width: 205px; height: 25px;">
				<input type="button" value="찾기" onclick="javascript:check()" style="background-color: #CDCDCD; color: 191919; border: none; width: 100px;">
				<input type="hidden" name="nowPage" value="1">
			</td>
		</tr>
	</table>
</form>	
</div>
	<form name="listFrm" method="post">
		<input type="hidden" name="reload" value="true">
		<input type="hidden" name="nowPage" value="1">
	</form>
	<form name="readFrm" method="get">
		<input type="hidden" name="num">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
		<input type="hidden" name="keyField" value="<%=keyField %>">
		<input type="hidden" name="keyWord" value="<%=keyWord %>">
	</form>
	<%-- <table width="1000">
		<tr>
			<td colspan="5">Total : <%=totalRecord %>개(<font color="red"><%=nowPage %>/<%=totalPage %>Pages</font>)</td>
		</tr>
	</table> --%>
	<div class="back">
	<hr width="1650">
	<%
	keyWord2 = keyWord;
	if(keyWord.equals("A0101")) {
		keyWord2 = "자연관광지";
	} else if(keyWord.equals("A0102")) {
		keyWord2 = "관광자원";
	} else if(keyWord.equals("A0201")) {
		keyWord2 = "역사관광지";
	} else if(keyWord.equals("A0202")) {
		keyWord2 = "휴양관광지";
	} else if(keyWord.equals("A0203")) {
		keyWord2 = "체험관광지";
	} else if(keyWord.equals("A0204")) {
		keyWord2 = "산업관광지";
	} else if(keyWord.equals("A0205")) {
		keyWord2 = "건축/조형물";
	} else if(keyWord.equals("A0206")) {
		keyWord2 = "문화시설";
	} else if(keyWord.equals("A0207")) {
		keyWord2 = "축제";
	} else if(keyWord.equals("A0208")) {
		keyWord2 = "공연/행사";
	} else if(keyWord.equals("A0301")) {
		keyWord2 = "레포츠소개";
	} else if(keyWord.equals("A0302")) {
		keyWord2 = "육상레포츠";
	} else if(keyWord.equals("A0303")) {
		keyWord2 = "수상레포츠";
	} else if(keyWord.equals("A0304")) {
		keyWord2 = "항공레포츠";
	} else if(keyWord.equals("A0305")) {
		keyWord2 = "복합레포츠";
	} else if(keyWord.equals("A0401")) {
		keyWord2 = "쇼핑";
	} else if(keyWord.equals("A0502")) {
		keyWord2 = "음식점";
	} else if(keyWord.equals("B0201")) {
		keyWord2 = "숙박시설";
	} else if(keyWord.equals("C0112")) {
		keyWord2 = "가족코스";
	} else if(keyWord.equals("C0113")) {
		keyWord2 = "나홀로코스";
	} else if(keyWord.equals("C0114")) {
		keyWord2 = "힐링코스";
	} else if(keyWord.equals("C0115")) {
		keyWord2 = "도보코스";
	} else if(keyWord.equals("C0116")) {
		keyWord2 = "캠핑코스";
	} else if(keyWord.equals("C0117")) {
		keyWord2 = "맛코스";
	} 
	if(keyWord.equals("")) {
		keyWord2 = "여행지리스트";
	}
	%>
	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
	<div style="margin-left: 190px;"><strong style="font-size: 30px;"><%=keyWord2 %></strong> 검색결과 : <%=totalRecord %>개 | <font color="blue"><%=nowPage %>/<%=totalPage %></font>페이지</div>
	<div style="width: 1500px; height: 820px; margin-left: 190px; margin-top: 30px;">
		<%
			vlist = tMgr.getBoardList(keyField, keyWord, start, end);
			listSize = vlist.size();	
			if(vlist.isEmpty()) {
				out.print("<tr><td colspan='5'>등록된 게시물이 없습니다</td></tr>");
			} else {
				for(int i=0; i<end; i++) {
					if(i==listSize)
						break;
					TourBean bean = vlist.get(i);
					int num = bean.getNum();
					String cat1 = bean.getCat1();
					String cat2 = bean.getCat2();
					String cat3 = bean.getCat3();
					String contenttypeid = bean.getContenttypeid();
					String areacode = bean.getAreacode();
					String sigungucode = bean.getSigungucode();
					String addr = bean.getAddr();
					String title = bean.getTitle();
					String tel = bean.getTel();
					String mapx = bean.getMapx();
					String mapy = bean.getMapy();
					String firstimage = bean.getFirstimage();
					String firstimage2 = bean.getFirstimage2();
					int bcount = cmgr.getBCommentCount(num);
										
					if(cat1.equals("A01")) {
						cat1 = "자연";
					} else if(cat1.equals("A02")) {
						cat1 = "인문(문화/예술/역사)";
					} else if(cat1.equals("A03")) {
						cat1 = "레포츠";
					} else if(cat1.equals("A04")) {
						cat1 = "쇼핑";
					} else if(cat1.equals("A05")) {
						cat1 = "음식";
					} else if(cat1.equals("B02")) {
						cat1 = "숙박";
					} else if(cat1.equals("C01")) {
						cat1 = "추천코스";
					}
					
					if(cat2.equals("A0101")) {
						cat2 = "자연관광지";
					} else if(cat2.equals("A0102")) {
						cat2 = "관광자원";
					} else if(cat2.equals("A0201")) {
						cat2 = "역사관광지";
					} else if(cat2.equals("A0202")) {
						cat2 = "휴양관광지";
					} else if(cat2.equals("A0203")) {
						cat2 = "체험관광지";
					} else if(cat2.equals("A0204")) {
						cat2 = "산업관광지";
					} else if(cat2.equals("A0205")) {
						cat2 = "건축/조형물";
					} else if(cat2.equals("A0206")) {
						cat2 = "문화시설";
					} else if(cat2.equals("A0207")) {
						cat2 = "축제";
					} else if(cat2.equals("A0208")) {
						cat2 = "공연/행사";
					} else if(cat2.equals("A0301")) {
						cat2 = "레포츠소개";
					} else if(cat2.equals("A0302")) {
						cat2 = "육상레포츠";
					} else if(cat2.equals("A0303")) {
						cat2 = "수상레포츠";
					} else if(cat2.equals("A0304")) {
						cat2 = "항공레포츠";
					} else if(cat2.equals("A0305")) {
						cat2 = "복합레포츠";
					} else if(cat2.equals("A0401")) {
						cat2 = "쇼핑";
					} else if(cat2.equals("A0502")) {
						cat2 = "음식점";
					} else if(cat2.equals("B0201")) {
						cat2 = "숙박시설";
					} else if(cat2.equals("C0112")) {
						cat2 = "가족코스";
					} else if(cat2.equals("C0113")) {
						cat2 = "나홀로코스";
					} else if(cat2.equals("C0114")) {
						cat2 = "힐링코스";
					} else if(cat2.equals("C0115")) {
						cat2 = "도보코스";
					} else if(cat2.equals("C0116")) {
						cat2 = "캠핑코스";
					} else if(cat2.equals("C0117")) {
						cat2 = "맛코스";
					}
		%>
		
		<div style="background-image: url('../img/bg2.png'); float: left; border-radius: 30px; margin: 5px;">
		<table style="float: left; width: 250px; margin: 30px;">
			<tr align="center" style="width: 300px;">
			    <td><a href="javascript:read('<%=num %>')"><img src=<%=firstimage2 %>></a></td>
			</tr>
			<tr>
			    <td align="center" style="border-bottom: 2px solid black;"><span><a href="javascript:read('<%=num %>')"><%=title %></a></span></td>
			</tr>
			<tr>
			    <td align="center" style="border-bottom: 2px solid black;"><span><a href="javascript:read('<%=num %>')"><%=addr %></span></td>
			</tr>
			<%if(bcount>0) { %>
			<tr>
				<td align="center">
				
			 <font><img src="https://cdn-icons-png.flaticon.com/128/6705/6705878.png" class="comm"> <%=bcount %></font>
			<% } %>
			</td>
			<%if(bcount == 0) { %>
			<tr>
			<td align="center">
			
			<font><img src="https://cdn-icons-png.flaticon.com/128/6705/6705878.png" class="comm"> <%=bcount %></font>
			<% } %>
			</td>
			</tr>
			
		</table>
		</div>
		<%
				}
			}
		%>
		</div>
		<hr width="1650">
		</div>
		<br>
		<div class="page_wrap" style="margin-bottom: -100px;">
		<div class="page_nation">
			<!-- 페이징 시작 -->
			<%
				int pageStart = (nowBlock-1) * pagePerBlock +1;
				int pageEnd = (pageStart + pagePerBlock <= totalPage) ? (pageStart + pagePerBlock) : totalPage+1;
				if(totalPage != 0) {
					if(nowBlock > 1) {
			%>
						<a class="arrow pprev" href="javascript:block('<%=nowBlock+1-nowBlock %>')"><<</a>
						<a class="arrow prev" href="javascript:block('<%=nowBlock-1 %>')"><</a>
			<%			
					}
					out.print("&nbsp;");
					for( ;pageStart<pageEnd; pageStart++) {
			%>
						<a href="javascript:pageing('<%=pageStart %>')"><%=pageStart %></a>
			<%
					}
					out.print("&emsp;");
					if(totalBlock > nowBlock) {
			%>
						<a class="arrow next" href="javascript:block('<%=nowBlock+1 %>')">></a>
						<a class="arrow nnext" href="javascript:block('<%=totalBlock %>')">>></a>
			<%
					}
				}
			%>
			<!-- 페이징 끝 -->
			<!-- <td colspan="1" align="right">&emsp;&emsp;
				<a href = "javascript:list()">[처음으로]</a>
			</td> -->
		</div>
	</div>
	<!-- <a href = "javascript:list()">[처음으로]</a> -->
	<jsp:include page="../travel/mainfooter.jsp"></jsp:include>
</body>
</html>