<%@page import="tour.DBConn"%>
<%@page import="oracle.jdbc.driver.OracleSql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="tour.TourBean" %>
<jsp:useBean id="tMgr" class="tour.TourMgr"></jsp:useBean>
<%@ page import="tour.DBConnectionMgr, java.sql.*" %>
<%@ page import = "tour.*, java.util.*" %>
<%@page import="tour.UtilMgr"%>
<%@page import="tour.BCommentBean"%>
<%@page import="java.net.URLEncoder"%>
<jsp:useBean id="cmgr" class="tour.BCommentMgr"/>
<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	String numPerPage = request.getParameter("numPerPage");	
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	String flag = request.getParameter("flag");
	if(flag!=null){
		if(flag.equals("insert")){
			BCommentBean cbean = new BCommentBean();
			cbean.setNum(num);//어떤 게시물
			cbean.setName(request.getParameter("name"));
			cbean.setCommentt(request.getParameter("comment"));
			cmgr.insertBComment(cbean);
		}else if(flag.equals("del")){
			//댓글 삭제
			cmgr.deleteBComment(UtilMgr.parseInt(request, "cnum"));
		}
	}
	TourBean bean = tMgr.getBoard(num);
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
	session.setAttribute("bean", bean);
	
	if(contenttypeid.equals("12")) { contenttypeid = "관광지"; } 
	else if(contenttypeid.equals("14")) { contenttypeid = "문화시설"; } 
	else if(contenttypeid.equals("15")) { contenttypeid = "행사/공연/축제"; } 
	else if(contenttypeid.equals("25")) { contenttypeid = "여행코스"; } 
	else if(contenttypeid.equals("28")) { contenttypeid = "레포츠"; }
	else if(contenttypeid.equals("32")) { contenttypeid = "숙박"; } 
	else if(contenttypeid.equals("38")) { contenttypeid = "쇼핑"; } 
	else if(contenttypeid.equals("39")) { contenttypeid = "음식"; }
	
	if(cat1.equals("A01")) { cat1 = "자연"; } 
	else if(cat1.equals("A02")) { cat1 = "인문(문화/예술/역사)"; } 
	else if(cat1.equals("A03")) { cat1 = "레포츠"; } 
	else if(cat1.equals("A04")) { cat1 = "쇼핑"; } 
	else if(cat1.equals("A05")) { cat1 = "음식"; } else if(cat1.equals("B02")) { cat1 = "숙박"; } 
	else if(cat1.equals("C01")) { cat1 = "추천코스"; }
	
	if(cat2.equals("A0101")) { cat2 = "자연관광지"; } 
	else if(cat2.equals("A0102")) { cat2 = "관광자원"; } 
	else if(cat2.equals("A0201")) { cat2 = "역사관광지"; } 
	else if(cat2.equals("A0202")) { cat2 = "휴양관광지"; } 
	else if(cat2.equals("A0203")) { cat2 = "체험관광지"; } 
	else if(cat2.equals("A0204")) { cat2 = "산업관광지"; } 
	else if(cat2.equals("A0205")) { cat2 = "건축/조형물"; } 
	else if(cat2.equals("A0206")) { cat2 = "문화시설"; } 
	else if(cat2.equals("A0207")) { cat2 = "축제"; } 
	else if(cat2.equals("A0208")) { cat2 = "공연/행사"; } 
	else if(cat2.equals("A0301")) { cat2 = "레포츠소개"; } 
	else if(cat2.equals("A0302")) { cat2 = "육상레포츠"; } 
	else if(cat2.equals("A0303")) { cat2 = "수상레포츠"; } 
	else if(cat2.equals("A0304")) { cat2 = "항공레포츠"; } 
	else if(cat2.equals("A0305")) { cat2 = "복합레포츠"; } 
	else if(cat2.equals("A0401")) { cat2 = "쇼핑"; } 
	else if(cat2.equals("A0502")) { cat2 = "음식점"; } 
	else if(cat2.equals("B0201")) { cat2 = "숙박시설"; } 
	else if(cat2.equals("C0112")) { cat2 = "가족코스"; } 
	else if(cat2.equals("C0113")) { cat2 = "나홀로코스"; } 
	else if(cat2.equals("C0114")) {cat2 = "힐링코스";  } 
	else if(cat2.equals("C0115")) { cat2 = "도보코스"; } 
	else if(cat2.equals("C0116")) { cat2 = "캠핑코스"; } 
	else if(cat2.equals("C0117")) { cat2 = "맛코스"; }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Where</title>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/jquery-ui.min.js"></script>
<style>
.img22 { width: 200px; 
		 height: 200px; 
		 vertical-align: middle;
		 border-radius: 10px;}

.jb-wrap {
	margin: 10px auto;
	border: none;
	position: relative;
	width: 250px;
}
/* .jb-wrap img {
	width: 200px;
	height: 200px;
	vertical-align: middle;
	border-radius: 10px;
} */
.jb-text {
	padding: 5px 10px;
	color: white;
	text-align: center;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate( -50%, -50% );
	overflow: hidden; display: block; width:200px; white-space: nowrap; text-overflow: ellipsis; 
	font-weight: bold;
}

#comm { display: none; }

.wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
    
.marker { width: 50px; height: 50px; }

.click { width: 20px; height: 20px; }

</style>
<script type="text/javascript">
$(function(){
	    $("#comm").slice(0, 1).show();
	    $("#load").click(function(e){ 
	        e.preventDefault();
	        $("table:hidden").slice(0, 2).show();
	        if($("table:hidden").length == 0) { 
	            /* alert("마지막 댓글입니다."); */ 
				$("#load").hide();
	        }
	    });
			if($("table:hidden").length == 0) { 
				$("#load").hide();
		    }
	});
</script>
<script>
	function list() {
		document.listFrm.submit();
	}
	
	function read(num) {
		document.readFrm.num.value = num;
		document.readFrm.action = "tourRead.jsp";
		document.readFrm.submit();
	} 
	function cInsert() {
		if(document.cFrm.comment.value==""){
			alert("내용을 입력하세요.");
			document.cFrm.comment.focus();
			return;
		}
		var flag = confirm("등록하시겠습니까?");
		if(flag == true) {
			
		}else{
			return;
		}
		document.cFrm.submit();
		
	}
	
	function cDel(cnum) {
		document.cFrm.cnum.value=cnum;
		
		var flag = confirm("삭제 하시겠습니까?");
		if(flag == true) {
			document.cFrm.flag.value="del";
		}else{
			return;
		}
		document.cFrm.submit();
	}
	
	function cWrite() {
		location.href = "../login/login.jsp";
	}
</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=932f6de9fc0e16e66d3365a746d8aba7&libraries=services"></script>
</head>
<jsp:include page="tourheader.jsp"></jsp:include>
<body style="width: 1650px;">
	<hr width="1px;">
	<div align="center"><font style="font-weight: bold; font-size: 50px; font-family: Do Hyeon"><%=title %></font></div>
	<div align="center"><font style="font-weight: bold; font-size: 30px;">주소</font>  <font style="font-size: 20px;"> <%=addr %> | </font><font style="font-weight: bold; font-size: 30px;">전화번호</font><font style="font-size: 20px;"> <%=tel %> | </font><font style="font-weight: bold; font-size: 30px;">분류</font><font style="font-size: 20px;"> <%=cat2 %> </font></div>
	<div align="center"><hr width="1000px;"></div>
	<div align="center">
		<img src=<%=firstimage %> style="width: 800px; height: 600px;">
	</div>
	<hr width="1650px;" style="background-color: black; border: 0px;">
	<!--  지도, 주변 정보 묶음 -->
	<div>
	<div id="map" style="width:600px; height:977.69px; background-color: #FAE0D4; float: left"></div>	
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(<%=mapy %>, <%=mapx %>), // 지도의 중심좌표
	        level: 6 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(<%=mapy %>, <%=mapx %>); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);    
	
	</script>
	
	<!-- 주변 정보 START -->
	
	<div style="width: 1000px; float: right;">
<img src="../img/관광지.png" class="marker"><font style="font-weight: bold; font-size: 20px;">주변 관광지 정보</font>
<div style="width:100%; overflow:auto">
<table style="border-collapse: separate; border-spacing: 50px 0px;">
<tr>
		<%	
			request.setCharacterEncoding("UTF-8");
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			try {
				double dy = Double.parseDouble(mapy);
				double dx = Double.parseDouble(mapx);
				con = DBConn.getConnection();
				/* sql = "SELECT * FROM ( SELECT num, contenttypeid, title, addr, firstimage2, mapy, mapx, CALC_DISTANCE(37.57883618, 126.980065, MAPY, MAPX)* 1000 AS DISTANCE FROM TOUR WHERE (MAPY BETWEEN 37.57883618 - 0.019 AND 37.57883618 + 0.019) AND (MAPX BETWEEN 126.980065 - 0.022 AND 126.980065 + 0.022) AND CONTENTTYPEID = 12 ORDER BY DBMS_RANDOM.VALUE ) TMP WHERE ROWNUM < 6"; */
				sql = "SELECT * FROM ( SELECT num, contenttypeid, title, addr, firstimage2, mapy, mapx, CALC_DISTANCE(" + dy + "," + dx + ", MAPY, MAPX) AS DISTANCE FROM TOUR WHERE (MAPY BETWEEN " + (dy-0.038) + " AND " + (dy+0.038) + ") AND (MAPX BETWEEN " + (dx-0.044) + " AND " + (dx+0.044) + ") AND CONTENTTYPEID = 12 ORDER BY DBMS_RANDOM.VALUE ) TMP WHERE ROWNUM < 6";
				pstmt = con.prepareStatement(sql);														
				rs = pstmt.executeQuery();
				while(rs.next()) {
					TourBean bean2 = new TourBean();
					bean2.setNum(rs.getInt("num"));
					bean2.setContenttypeid(rs.getString("contenttypeid"));
					bean2.setTitle(rs.getString("title"));
					bean2.setAddr(rs.getString("addr"));
					bean2.setFirstimage2(rs.getString("firstimage2"));
					bean2.setDistance(rs.getString("distance"));
					bean2.setMapy(rs.getString("mapy"));
					bean2.setMapx(rs.getString("mapx"));
					int num2 = bean2.getNum();
					String contenttypeid2 = bean2.getContenttypeid();
					String title2 = bean2.getTitle();
					String addr2 = bean2.getAddr();
					String firstimage22 = bean2.getFirstimage2();
					String distance = bean2.getDistance();
					if(distance.length() == 2)
						distance = "0" + distance;
					String mapy3 = bean2.getMapy();
					String mapx3 = bean2.getMapx();
			%>
			
			<script>
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
   {
        title: '<%=title2 %>', 
        latlng: new kakao.maps.LatLng(<%=mapy3 %>, <%=mapx3 %>)
    }
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = '../img/관광지.png'; 
/* https://cdn-icons-png.flaticon.com/128/7902/7902238.png 초록색 관광지 */
for (var i = 0; i < positions.length; i++) {
	var latlng = positions[i].latlng;
	var title = positions[i].title;
	var clickedOverlay = null;
	var content = '<div class="wrap">' + 
    '    <div class="info">' + 
    '        <div class="title">' + 
    '            <%=title2 %>' + 
    '            <div class="close" onclick="closeOverlay<%=num2 %>()" title="닫기"></div>' + 
    '        </div>' + 
    '        <div class="body">' + 
    '            <div class="img">' +
    '                <img src="<%=firstimage22 %>" width="73" height="70">' +
    '           </div>' + 
    '            <div class="desc">' + 
    '                <div class="ellipsis"><%=addr2 %></div>' + 
    '                <div><a href="https://map.kakao.com/link/to/<%=addr2 %>,<%=mapy3 %>,<%=mapx3 %>" target="_blank" class="link">길찾기</a></div>' + 
    '            </div>' + 
    '        </div>' + 
    '    </div>' +    
    '</div>';
		iwPosition = new kakao.maps.LatLng(<%=mapy3 %>, <%=mapx3 %>), // 커스텀오버레이 표시 위치
		iwRemoveable = true;
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(30, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
  
    // 마커를 생성합니다
    let marker2 = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: latlng, // 마커를 표시할 위치
        title : title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
    
    let overlay = new kakao.maps.CustomOverlay({
        content: content,
        position: iwPosition
    });

    // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
    kakao.maps.event.addListener(marker2, 'click', function() {
    	 if (clickedOverlay) {
    	        clickedOverlay.setMap(null);
    	    }
    	 overlay.setMap(map);
    	    clickedOverlay = overlay;
    });

    // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
    function closeOverlay<%=num2 %>() {
        overlay.setMap(null);     
    }
    
    function mapClick<%=num2 %>() {
    	if (clickedOverlay) {
	        clickedOverlay.setMap(null);
	    }
	 overlay.setMap(map);
	    clickedOverlay = overlay;
	    
	    let moveLatLon = new kakao.maps.LatLng(<%=mapy3 %>, <%=mapx3 %>);
	    map.panTo(moveLatLon);            
    };
}
</script>	
<td class="jb-wrap"><a href="tourRead.jsp?num=<%=num2 %>"><div class="jb-image"><img src=<%=firstimage22 %> class="img22"></div><div class="jb-text"><%=title2 %></div></a><div onclick="mapClick<%=num2 %>()"><img src="../img/클릭.png" class="click"><font style="font-weight: bold;"> <%=distance %>km </font></div></td>
			<%
					}
				} catch(Exception e) {
					e.printStackTrace();
				} finally {
					try {
						if(pstmt != null)
							pstmt.close();
						if(con != null)
							con.close();
						if(rs != null)
							rs.close();
					} catch(Exception e) {
						e.printStackTrace();	
					}
				}
			%>
	</tr>
	</table>
	</div>
<img src="../img/숙박업소.png" class="marker"><font style="font-weight: bold; font-size: 20px;">주변 숙박업소 정보</font>
<div style="width:100%; overflow:auto">
<table style="border-collapse: separate; border-spacing: 50px 20px;">
<tr>
		<%	
			request.setCharacterEncoding("UTF-8");
			Connection con2 = null;
			PreparedStatement pstmt2 = null;
			ResultSet rs2 = null;
			String sql2 = null;
			try {
				double dy = Double.parseDouble(mapy);
				double dx = Double.parseDouble(mapx);
				con2 = DBConn.getConnection();
				/* sql2 = "SELECT * FROM ( SELECT num, contenttypeid, title, addr, firstimage2, CALC_DISTANCE(37.57883618, 126.980065, MAPY, MAPX)* 1000 AS DISTANCE FROM TOUR WHERE (MAPY BETWEEN 37.57883618 - 0.019 AND 37.57883618 + 0.019) AND (MAPX BETWEEN 126.980065 - 0.022 AND 126.980065 + 0.022) AND CONTENTTYPEID = 32 ORDER BY DBMS_RANDOM.VALUE ) TMP WHERE ROWNUM < 6"; */
				sql2 = "SELECT * FROM ( SELECT num, contenttypeid, title, addr, firstimage2, mapy, mapx, CALC_DISTANCE(" + dy + "," + dx + ", MAPY, MAPX) AS DISTANCE FROM TOUR WHERE (MAPY BETWEEN " + (dy-0.019) + " AND " + (dy+0.019) + ") AND (MAPX BETWEEN " + (dx-0.022) + " AND " + (dx+0.022) + ") AND CONTENTTYPEID = 32 ORDER BY DBMS_RANDOM.VALUE ) TMP WHERE ROWNUM < 6";
				pstmt2 = con2.prepareStatement(sql2);														
				rs2 = pstmt2.executeQuery();
				while(rs2.next()) {
					TourBean bean2 = new TourBean();
					bean2.setNum(rs2.getInt("num"));
					bean2.setContenttypeid(rs2.getString("contenttypeid"));
					bean2.setTitle(rs2.getString("title"));
					bean2.setAddr(rs2.getString("addr"));
					bean2.setFirstimage2(rs2.getString("firstimage2"));
					bean2.setDistance(rs2.getString("distance"));
					bean2.setMapy(rs2.getString("mapy"));
					bean2.setMapx(rs2.getString("mapx"));
					int num3 = bean2.getNum();
					String contenttypeid3 = bean2.getContenttypeid();
					String title3 = bean2.getTitle();
					String addr3 = bean2.getAddr();
					String firstimage33 = bean2.getFirstimage2();
					String distance3 = bean2.getDistance();
					if(distance3.length() == 2)
						distance3 = "0" + distance3;
					String mapy4 = bean2.getMapy();
					String mapx4 = bean2.getMapx();
			%>
			<script>
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
   {
        title: '<%=title3 %>', 
        latlng: new kakao.maps.LatLng(<%=mapy4 %>, <%=mapx4 %>)
    }
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = '../img/숙박업소.png'; 
/* https://cdn-icons-png.flaticon.com/128/7902/7902245.png 초록색 숙박업소 */
for (var i = 0; i < positions.length; i++) {
	var latlng = positions[i].latlng;
	var title = positions[i].title;
	var clickedOverlay = null;
	var content = '<div class="wrap">' + 
    '    <div class="info">' + 
    '        <div class="title">' + 
    '            <%=title3 %>' + 
    '            <div class="close" onclick="closeOverlay<%=num3 %>()" title="닫기"></div>' + 
    '        </div>' + 
    '        <div class="body">' + 
    '            <div class="img">' +
    '                <img src="<%=firstimage33 %>" width="73" height="70">' +
    '           </div>' + 
    '            <div class="desc">' + 
    '                <div class="ellipsis"><%=addr3 %></div>' + 
    '                <div><a href="https://map.kakao.com/link/to/<%=addr3 %>,<%=mapy4 %>,<%=mapx4 %>" target="_blank" class="link">길찾기</a></div>' + 
    '            </div>' + 
    '        </div>' + 
    '    </div>' +    
    '</div>';
		iwPosition = new kakao.maps.LatLng(<%=mapy4 %>, <%=mapx4 %>), // 커스텀오버레이 표시 위치
		iwRemoveable = true;
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(30, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
  
    // 마커를 생성합니다
    let marker2 = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: latlng, // 마커를 표시할 위치
        title : title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
    
    let overlay = new kakao.maps.CustomOverlay({
        content: content,
        position: iwPosition
    });

    // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
    kakao.maps.event.addListener(marker2, 'click', function() {
    	 if (clickedOverlay) {
    	        clickedOverlay.setMap(null);
    	    }
    	 overlay.setMap(map);
    	    clickedOverlay = overlay;
    });

    // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
    function closeOverlay<%=num3 %>() {
        overlay.setMap(null);     
    }
    
    function mapClick<%=num3 %>() {
    	if (clickedOverlay) {
	        clickedOverlay.setMap(null);
	    }
	 overlay.setMap(map);
	    clickedOverlay = overlay;
	    
	    let moveLatLon = new kakao.maps.LatLng(<%=mapy4 %>, <%=mapx4 %>);
	    map.panTo(moveLatLon);            
    };
}
</script>
<td class="jb-wrap"><a href="tourRead.jsp?num=<%=num3 %>"><div class="jb-image"><img src=<%=firstimage33 %> class="img22"></div><div class="jb-text"><%=title3 %></div></a><div onclick="mapClick<%=num3 %>()"><img src="../img/클릭.png" class="click"><font style="font-weight: bold;"> <%=distance3 %>km </font></div></td>
			<%
					}
				} catch(Exception e) {
					e.printStackTrace();
				} finally {
					try {
						if(pstmt2 != null)
							pstmt2.close();
						if(con2 != null)
							con2.close();
						if(rs2 != null)
							rs2.close();
					} catch(Exception e) {
						e.printStackTrace();	
					}
				}
			%>
	</tr>
	</table>
	</div>
<img src="../img/음식점.png" class="marker"><font style="font-weight: bold; font-size: 20px;">주변 음식점 정보</font>
<div style="width:100%; overflow:auto">
<table style="border-collapse: separate; border-spacing: 50px 20px;">
<tr>
		<%	
			request.setCharacterEncoding("UTF-8");
			Connection con3 = null;
			PreparedStatement pstmt3 = null;
			ResultSet rs3 = null;
			String sql3 = null;
			try {
				double dy = Double.parseDouble(mapy);
				double dx = Double.parseDouble(mapx);
				con3 = DBConn.getConnection();
				/* sql3 = "SELECT * FROM ( SELECT num, contenttypeid, title, addr, firstimage2, CALC_DISTANCE(37.57883618, 126.980065, MAPY, MAPX)* 1000 AS DISTANCE FROM TOUR WHERE (MAPY BETWEEN 37.57883618 - 0.019 AND 37.57883618 + 0.019) AND (MAPX BETWEEN 126.980065 - 0.022 AND 126.980065 + 0.022) AND CONTENTTYPEID = 39 ORDER BY DBMS_RANDOM.VALUE ) TMP WHERE ROWNUM < 6"; */
				sql3 = "SELECT * FROM ( SELECT num, contenttypeid, title, addr, firstimage2, mapy, mapx, CALC_DISTANCE(" + dy + "," + dx + ", MAPY, MAPX) AS DISTANCE FROM TOUR WHERE (MAPY BETWEEN " + (dy-0.019) + " AND " + (dy+0.019) + ") AND (MAPX BETWEEN " + (dx-0.022) + " AND " + (dx+0.022) + ") AND CONTENTTYPEID = 39 ORDER BY DBMS_RANDOM.VALUE ) TMP WHERE ROWNUM < 6";
				pstmt3 = con3.prepareStatement(sql3);														
				rs3 = pstmt3.executeQuery();
				while(rs3.next()) {
					TourBean bean2 = new TourBean();
					bean2.setNum(rs3.getInt("num"));
					bean2.setContenttypeid(rs3.getString("contenttypeid"));
					bean2.setTitle(rs3.getString("title"));
					bean2.setAddr(rs3.getString("addr"));
					bean2.setFirstimage2(rs3.getString("firstimage2"));
					bean2.setDistance(rs3.getString("distance"));
					bean2.setMapy(rs3.getString("mapy"));
					bean2.setMapx(rs3.getString("mapx"));
					int num4 = bean2.getNum();
					String contenttypeid4 = bean2.getContenttypeid();
					String title4 = bean2.getTitle();
					String addr4 = bean2.getAddr();
					String firstimage44 = bean2.getFirstimage2();
					String distance4 = bean2.getDistance();
					if(distance4.length() == 2)
						distance4 = "0" + distance4;
					String mapy5 = bean2.getMapy();
					String mapx5 = bean2.getMapx();
			%>
			<script>
// 마커를 표시할 위치와 title 객체 배열입니다 
var positions = [
   {
        title: '<%=title4 %>', 
        latlng: new kakao.maps.LatLng(<%=mapy5 %>, <%=mapx5 %>)
    }
];

// 마커 이미지의 이미지 주소입니다
var imageSrc = '../img/음식점.png'; 
/* "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"  카카오기본*/
/* https://cdn-icons-png.flaticon.com/128/7902/7902144.png 초록색음식점*/
for (var i = 0; i < positions.length; i++) {
	var latlng = positions[i].latlng;
	var title = positions[i].title;
	var clickedOverlay = null;
	var content = '<div class="wrap">' + 
    '    <div class="info">' + 
    '        <div class="title">' + 
    '            <%=title4 %>' + 
    '            <div class="close" onclick="closeOverlay<%=num4 %>()" title="닫기"></div>' + 
    '        </div>' + 
    '        <div class="body">' + 
    '            <div class="img">' +
    '                <img src="<%=firstimage44 %>" width="73" height="70">' +
    '           </div>' + 
    '            <div class="desc">' + 
    '                <div class="ellipsis"><%=addr4 %></div>' + 
    '                <div><a href="https://map.kakao.com/link/to/<%=addr4 %>,<%=mapy5 %>,<%=mapx5 %>" target="_blank" class="link">길찾기</a></div>' + 
    '            </div>' + 
    '        </div>' + 
    '    </div>' +    
    '</div>';
		iwPosition = new kakao.maps.LatLng(<%=mapy5 %>, <%=mapx5 %>), // 커스텀오버레이 표시 위치
		iwRemoveable = true;
    // 마커 이미지의 이미지 크기 입니다
    var imageSize = new kakao.maps.Size(30, 35); 
    
    // 마커 이미지를 생성합니다    
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
  
    // 마커를 생성합니다
    let marker2 = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: latlng, // 마커를 표시할 위치
        title : title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
        image : markerImage // 마커 이미지 
    });
    
    let overlay = new kakao.maps.CustomOverlay({
        content: content,
        position: iwPosition
    });

    // 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
    kakao.maps.event.addListener(marker2, 'click', function() {
    	 if (clickedOverlay) {
    	        clickedOverlay.setMap(null);
    	    }
    	 overlay.setMap(map);
    	    clickedOverlay = overlay;
    });

    // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
    function closeOverlay<%=num4 %>() {
        overlay.setMap(null);     
    }
    
    function mapClick<%=num4 %>() {
    	if (clickedOverlay) {
	        clickedOverlay.setMap(null);
	    }
	 overlay.setMap(map);
	    clickedOverlay = overlay;
	    
	    let moveLatLon = new kakao.maps.LatLng(<%=mapy5 %>, <%=mapx5 %>);
	    map.panTo(moveLatLon);            
    };
}
</script>
<td class="jb-wrap"><a href="tourRead.jsp?num=<%=num4 %>"><div class="jb-image"><img src=<%=firstimage44 %> class="img22"></div><div class="jb-text"><%=title4 %></div></a><div onclick="mapClick<%=num4 %>()"><img src="../img/클릭.png" class="click"><font style="font-weight: bold;"> <%=distance4 %>km </font></div></td>
			<%
					}
				} catch(Exception e) {
					e.printStackTrace();
				} finally {
					try {
						if(pstmt3 != null)
							pstmt3.close();
						if(con3 != null)
							con3.close();
						if(rs3 != null)
							rs3.close();
					} catch(Exception e) {
						e.printStackTrace();	
					}
				}
			%>
	</tr>
	</table>
	</div>
	</div>
	
	<!-- 주변 정보 END -->
	</div>
	<hr width="1650px;">
	<br><br>

	<hr width="1100px;">
	<br><br>

<!-- 댓글 입력폼 START  -->
<div>
  <form method="post" name="cFrm" action="tourRead.jsp?num=<%=num%>">
		
				<%
	if(session.getAttribute("id") != null) {
%>
	
			<%if(bcount>0) { %>
			<div>
			<span style="font-size: 30px; margin-left: 300px;"><font style="font-weight: bold;">여행 기록</font> <font color="skyblue" > <%=bcount %> </font></span><% } %>
			</div>
			<%if(bcount == 0) { %>
			<span style="font-size: 30px; margin-left: 300px;"><font style="font-weight: bold;">여행 기록</font> <font color="skyblue"> <%=bcount %> </font></span><% } %>
			<div align="center" style="border: 1px solid #D5D5D5; width: 1100px; margin-left: 275px;">
			<table width="1000px;">
			<tr>
				<td align="left">
				<input name="name" value="<%=session.getAttribute("name")%>" readonly style="border: none">
				</td>
			</tr>
			<tr>
				<td>
				<jsp:include page="summernote.jsp"></jsp:include>
				</td>
			</tr>
			<tr>
				<td align="center">
				<input type="button" value="등록" onclick="cInsert()" style="background-color: skyblue; color: white; font-weight: bold; font-size: 20px; border: none; border-radius: 20px; width: 100px; height: 50px;">
				</td>
			</tr>
			</table>
			</div>
			<br><br>
			<%if(bcount == 0) { %>
			<div align="center"><font>작성된 댓글이 없습니다.</font></div>
			
			<% } %>
<%
	} else {
%>
			<%if(bcount>0) { %>
			<span style="font-size: 30px; margin-left: 300px;"><font style="font-weight: bold;">여행 기록</font> <font color="skyblue"> <%=bcount %> </font></span><% } %>
			<%if(bcount == 0) { %>
			<span style="font-size: 30px; margin-left: 300px;"><font style="font-weight: bold;">여행 기록</font> <font color="skyblue"> <%=bcount %> </font></span><% } %>
			<div style="border: 1px solid #D5D5D5; width: 1100px; height: 300px; margin-left: 275px; position: relative;">
				<div style="width : 1000px; height : 200px; border : 1px solid #D5D5D5; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
					<span style="width : 300px; height : 50px; position: absolute; top: 53%; left: 53%; transform: translate(-50%, -50%);">로그인 후 댓글을 작성해 주세요</span>
				</div>
					<input type="button" value="로그인" onclick="cWrite()" style="background-color: skyblue; color: white; font-weight: bold; font-size: 20px; border: none; border-radius: 20px; width: 100px; height: 50px; position: absolute; top: 92%; left: 50%; transform: translate(-50%, -50%);">
				
			</div>
			<br><br>

			<%if(bcount == 0) { %>
			<div align="center"><font>작성된 댓글이 없습니다.</font></div>
			
			<% } %>
			
<% } %>	
		
		
	 <input type="hidden" name="flag" value="insert">	
	 <input type="hidden" name="num" value="<%=num%>">
	 <input type="hidden" name="cnum">
    <input type="hidden" name="nowPage" value="<%=nowPage%>">
    <input type="hidden" name="numPerPage" value="<%=numPerPage%>">
   <%if(!(keyWord==null||keyWord.equals(""))){ %>
    <input type="hidden" name="keyField" value="<%=keyField%>">
    <input type="hidden" name="keyWord" value="<%=keyWord%>">
	<%}%>
	</form>
    
  <!-- 댓글 입력폼 END -->

  <!-- 댓글 LIST START -->
  <%
  	Vector<BCommentBean> cvlist = cmgr.getBComment(num);
  	if(!cvlist.isEmpty()){
  	%>
  	<%
  		for(int i=0; i<cvlist.size();i++){
  			BCommentBean cbean = cvlist.get(i);
  			int cnum = cbean.getCnum();
  			String name = cbean.getName();
  			String comment = cbean.getCommentt();
  			String cregdate = cbean.getRegdate();
  	%>
  	<table id="comm" width="1000px;" align="center" style="background: #F6F6F6">
	<tr>
		<td height="100%;"><div style="overflow-y:auto; height:300px; width:100%"><%=comment%></div></td>
	</tr>
	<tr>
		<td><b><%=name%></b> | <%=cregdate%></td>
	</tr>
		<%
	if(session.getAttribute("id") == null) {
%>
 <%
	} else if(session.getAttribute("name").equals(name)) {
%>	
	<tr>
		<td><input type="button" value="삭제" onclick="cDel('<%=cnum%>')"></td>
	</tr>
<%
}
%>
	<tr style="border-bottom: 1px solid black;">
		<td colspan="3"><br/></td>
	</tr>
	</table>
	<br>
  		<%}//--for%>  	  
  	<div align="center"><a href="" id="load">더 보기</a></div>
  	 <hr/>	
  		
  <%}//--if %>   

  <!-- 댓글 LIST END -->
	<form name="listFrm" method="post" action="tourList.jsp">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
		<%
			if(!(keyWord == null || keyWord.equals(""))) {
		%>
			<input type="hidden" name="keyField" value="<%=keyField %>">
			<input type="hidden" name="keyWord" value="<%=keyWord %>">
		<%
			}
		%>
	</form>
	<form name="readFrm" method="post">
		<input type="hidden" name="num">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
		<input type="hidden" name="keyField" value="<%=keyField %>">
		<input type="hidden" name="keyWord" value="<%=keyWord %>">
	</form>
	</div>
<jsp:include page="../travel/mainfooter.jsp"></jsp:include>
</body>
</html>