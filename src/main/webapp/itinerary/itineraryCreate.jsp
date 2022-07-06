<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 화면 최적화 -->
<meta name="viewport" content="width-device-width", initial-scale="1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script><title>JSP 게시판 웹 사이트</title>
<title>여행일정 게시판</title>

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
	<%-- <%
		// 메인 페이지로 이동했을 때 세션에 값이 담겨있는지 체크
		int member_idx = 0;
		if(session.getAttribute("member_idx") != null){
			member_idx = (int)session.getAttribute("member_idx");
		}
	%> --%>
	
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
	
	<!-- 게시판 글쓰기 양식 영역 시작 -->
	<div class="container">
		<div class="row">
			<form method="post" action="itineraryCreateAction">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">여행일정 게시판 글쓰기 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" name="itinerary_title" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" name="itinerary_detail" maxlength="2048" style="height: 350px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<!-- 글쓰기 버튼 생성 -->
				<input type="submit" class="btn btn-primary pull-right" value="글등록">
			</form>
		</div>
	</div>
	<!-- 게시판 글쓰기 양식 영역 끝 -->
	<%-- 
<%
	Object itinerary = request.getAttribute("result");


		// 현재 세션 상태를 체크한다
		int member_idx = 0;
		if(session.getAttribute("member_idx") != null){
			member_idx = (int)session.getAttribute("member_idx");
		}
		// 로그인을 한 사람만 글을 쓸 수 있도록 코드를 수정한다
		if(member_idx == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}else{
			// 입력이 안 된 부분이 있는지 체크한다
			if(itinerary_title == null || itinerary.getItinerary_recommendation() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			}else{
				// 정상적으로 입력이 되었다면 글쓰기 로직을 수행한다
				ItineraryDAO itineraryDAO = new ItineraryDAO();
				int result = itineraryDAO.write(itinerary.getItinerary_title(), member_idx, itinerary.getItinerarDetail());
				// 데이터베이스 오류인 경우
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");
				// 글쓰기가 정상적으로 실행되면 알림창을 띄우고 게시판 메인으로 이동한다
				}else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기 성공')");
					script.println("location.href='itinerary.jsp'");
					script.println("</script>");
				}
			}
		}
		
	
	%> --%>
	<!-- 부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>