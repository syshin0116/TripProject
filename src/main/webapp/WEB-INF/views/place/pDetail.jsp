<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 화면 최적화 -->
<meta name="viewport" content="width-device-width", initial-scale="1">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<!-- 루트 폴더에 부트스트랩을 참조하는 링크 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script type="text/javascript" src="../resources/js/jquery-3.6.0.min.js"></script>

<script type="text/javascript">

</script>
<title>여행지 상세보기</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="ninodezign.com, ninodezign@gmail.com">
<meta name="copyright" content="ninodezign.com">
<!-- favicon -->
<link rel="shortcut icon" href="resources/images/ico/favicon.jpg">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="../resources/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="../resources/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="../resources/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="../resources/images/ico/apple-touch-icon-57-precomposed.png">

<!-- css -->
<link rel="stylesheet" type="text/css"
	href="../resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="../resources/css/materialdesignicons.min.css" />
<link rel="stylesheet" type="text/css"
	href="../resources/css/jquery.mCustomScrollbar.min.css" />
<link rel="stylesheet" type="text/css"
	href="../resources/css/prettyPhoto.css" />
<link rel="stylesheet" type="text/css"
	href="../resources/css/unslider.css" />
<link rel="stylesheet" type="text/css"
	href="../resources/css/template.css" />

</head>
  <body>
  <!-- Header
   ================================================== -->
	<header id="nino-header">
		<div id="nino-headerInner">
			<%
				if (session.getAttribute("member_name") == null) {
			%>
			<jsp:include page="../../../header.jsp"></jsp:include>
			<%
				} else {
			%>
			<jsp:include page="../../../header2.jsp"></jsp:include>
			<%
				}
			%>
		</div>
	</header>	
			

		<div class="row">
		
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">여행지 상세보기</th>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2">${one.place_info}</td>
					</tr>
					<tr>
						<td>주소</td>
						<td colspan="2">${one.place_addr}</td>
					</tr>
					
					<tr>
						<td>여행지사</td>
						<td >						
							<img src = "${one.place_img}">
						</td>
						
					</tr>
					<tr>
						<td>상세정보</td>
						<td colspan="2" style="height: 200px; text-align: left;"> ${one.place_detail}</td>
					</tr>
					<tr>
						<td>지도</td>
						<td colspan="2" style="height: 200px; text-align: left;"> <div id="map" style="width:60%;height:400px;">${one.place_mapy}, ${one.place_mapx}</div></td>
					</tr>
				</tbody>

			</table>
			<%
				if (session.getAttribute("member_name") != null) {
			%>
				<center><a href="#" onclick="location.href='/trip/member/createFavorite?place_idx=${one.place_idx}'"><button style="color: black;">즐겨찾기 추가</button></a></center>
				<center><a href="http://127.0.0.1:8000/placeReview/reviewList/${one.place_info}/<%=session.getAttribute("member_name")%>/1"><button style="color: black;">리뷰 페이지</button></a></center>
			<%
				} else {
			%>
				<center><a href="http://127.0.0.1:8000/placeReview/reviewList/${one.place_info}/0/1"><button style="color: black;">리뷰 페이지</button></a></center>
				
			<%
				}
			%>
			
		</div>
	
	<!-- 게시판 글 보기 양식 영역 끝 -->



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=031ef1beec2da906c3e36a639f49b56c&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(${one.place_mapy}, ${one.place_mapx}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨 
    }; 

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('one.place_addr', function(result, status) {

   
	 // 정상적으로 검색이 완료됐으면 
    if (status === kakao.maps.services.Status.OK) {
        var coords = new kakao.maps.LatLng(${one.place_mapy}, ${one.place_mapx});

        
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            //map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${one.place_info}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
        marker.setMap(map);
    }  
})
</script>
  
  
  </body>
</html>