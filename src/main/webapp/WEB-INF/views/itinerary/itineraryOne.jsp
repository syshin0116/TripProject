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

$(function() {
	$.ajax({
		url : "../itineraryComment/iComment", //views/itineraryComment.jsp가 결과
/* 		dataType : 'json',
 */		data : {
			itinerary_idx : ${one.itinerary_idx}
		},
		success : function(result) { //결과가 담겨진 table부분코드
			$('#itineraryComment').html(result)
			//alert('ajax성공')
		},
		error : function() {
			alert('ajax실패')
		}
	}) 
}) 
</script>
<title>여행일정 게시판 상세보기</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="ninodezign.com, ninodezign@gmail.com">
<meta name="copyright" content="ninodezign.com">
<title>HI TRIP</title>

<!-- favicon -->
<link rel="shortcut icon" href="/resources/images/ico/favicon.jpg">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="/resources/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="/resources/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="/resources/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="/resources/images/ico/apple-touch-icon-57-precomposed.png">

<!-- css -->
<link rel="stylesheet" type="text/css"
	href="../resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="../resources/css/materialdesignicons.min.css" />
<link rel="stylesheet" type="text/css"
	href="../resources/css/jquery.mCustomScrollbar.min.css" />
<link rel="stylesheet" type="text/css"
	href="../resources/css/prettyPhoto.css" />
<link rel="stylesheet" type="text/css" href="../resources/css/unslider.css" />
<link rel="stylesheet" type="text/css" href="../resources/css/template.css" />
<link rel="stylesheet" type="text/css"
	href="../resources/css/slideshow.css" />

<!-- javascript -->
<script type="text/javascript" src="../resources/js/jquery.min.js"></script>
<script type="text/javascript" src="../resources/js/isotope.pkgd.min.js"></script>
<script type="text/javascript" src="../resources/js/jquery.prettyPhoto.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/jquery.hoverdir.js"></script>
<script type="text/javascript"
	src="../resources/js/modernizr.custom.97074.js"></script>
<script type="text/javascript"
	src="../resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="../resources/js/unslider-min.js"></script>
<script type="text/javascript" src="../resources/js/template.js"></script>
<script type="text/javascript" src="../resources/js/weatherAPI.js?var=1"></script>


</head>
<body>
	<%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		int member_idx = 0;
		if(session.getAttribute("member_idx") != null){
			member_idx = (int)(session.getAttribute("member_idx"));
		} 
		
		// itineraryID를 초기화 시키고
		// 'itineraryID'라는 데이터가 넘어온 것이 존재한다면 캐스팅을 하여 변수에 담는다
		int itinerary_idx = 0;
		if(request.getParameter("itinerary_idx") != null){
			itinerary_idx = Integer.parseInt(request.getParameter("itinerary_idx"));
		}
		
		// 만약 넘어온 데이터가 없다면
		if(itinerary_idx == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다')");
			script.println("location.href='itinerary/itinerary.jsp'");
			script.println("</script");
		}
		
		// 유효한 글이라면 구체적인 정보를 'itinerary'라는 인스턴스에 담는다
	%>
	
	<header id="nino-header">
		<div id="nino-headerInner">
			<%
				if (session.getAttribute("member_name") == null) {
			%>
			<jsp:include page="/header.jsp"></jsp:include>
			<%
				} else {
			%>
			<jsp:include page="/header2.jsp"></jsp:include>
			<%
				}
			%>
		</div>
	</header>
	
	<!-- 게시판 글 보기 양식 영역 시작 -->
	<div class="container">
	<div align="right">
	<a href="itinerary.jsp" class="btn btn-primary">목록</a>
			
			<!-- 해당 글의 작성자가 본인이라면 수정과 삭제가 가능하도록 코드 추가 -->
			 <%
/* 			 String strYear = (String) request.Attribute("strYear");
 */				if(member_idx != 0 && member_idx == (int)(request.getAttribute("memberModel_idx"))){
			%> 
					<a href="itineraryUpdate?itinerary_idx=${one.itinerary_idx}" class="btn btn-primary">수정</a>
					<a href="itineraryDelete?itinerary_idx=${one.itinerary_idx}" class="btn btn-primary">삭제</a>
		 	<%
				}
			%> 
	</div>
		<div class="row">
		
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2">${one.itinerary_title}</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2">${memberOne.member_name}</td>
					</tr>
					<tr>
						<td>좋아요 수</td>
						<td colspan="2">${one.itinerary_like}</td>
					</tr>
					<tr>
						<td>조회수</td>
						<td colspan="2">${one.itinerary_view}</td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2">${one.itinerary_date}</td>
					</tr>
					<tr>
						<td>여행지</td>
						<td colspan="2">
						<c:forEach items="${placeList}" var="placeList" varStatus="status">
						<a href="../place/pDetail?place_idx=${placeList.place_idx}">
							${placeList.place_info}</a><br>
						</c:forEach>
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="height: 200px; text-align: left;"> ${one.itinerary_details}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!-- 게시판 글 보기 양식 영역 끝 -->
	
	<!-- 댓글 -->
<%-- 	<%@ include file="/itineraryComment/itineraryComment.jsp" %>
 --%>	<div id="itineraryComment">
	
	</div>
</body>
</html>