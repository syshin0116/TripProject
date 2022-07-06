<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">

$(function() {
	$.ajax({
		url : "pShowSearch", //views/surveyList.jsp가 결과
		success : function(result) { //결과가 담겨진 table부분코드
			$('#pShowSearch').html(result)
			//alert('ajax성공')
		},
		error : function() {
			alert('ajax실패')
		},
	})
})
</script>

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
	
   <div class="searchbox">
     
        <h1>여행지 검색</h1>
        <form action="pShowSearch">       
        	<input type="text" name="place_area" placeholder="Type to Search">
			<button class="btn btn-danger" type="submit">검색</button>
		</form>
</div>
<img src="../resources/img/여행지 종류 파이차트.png">
<img src="../resources/img/지역별 여행지 수 파이차트.png">
<!-- <div id = "pShowSearch">

</div> -->
 

</body>
</html>