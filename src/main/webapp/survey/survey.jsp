<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
<script type="tex/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"><</script>
<script type="text/javascript"
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"></script>
<script type="text/javascript"
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">

$(function() {
	$.ajax({
		url : "surveyList", //views/surveyList.jsp가 결과
		success : function(result) { //결과가 담겨진 table부분코드
			$('#surveyList').html(result)
			//alert('ajax성공')
		},
		error : function() {
			alert('ajax실패')
		}
	})
})
</script>
<title>설문지</title>

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

<!-- Header
    ================================================== -->
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

	<div id="total">
<%-- 		<div id="menu">
			<jsp:include page="top.jsp"></jsp:include>
		</div>
		<div id="memberTop">
			<jsp:include page="top2.jsp"></jsp:include>
		</div> --%>
		<div id="center">
			<h3 align="center">
				설문지
				<%
				if(session.getAttribute("member_idx") != null) {
				if(session.getAttribute("member_idx").equals("1")) {
			%> 
				(관리자모드)
				<a href="surveyInsert.jsp"><button id="insertBtn" style="background-color: black;">새 설문지 질문 추가</button></a>
				<a href="surveyUpdate1.jsp"><button id="updateBtn" style="background-color: black;">설문지 수정/삭제</button></a>
			</h3>

 			<%
				}}
			%> 
			<hr color="red">
			<div id="surveyList"></div>
		</div>
	</div>
</body>
</html>