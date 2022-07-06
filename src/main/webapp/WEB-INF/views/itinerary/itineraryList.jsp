<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 화면 최적화 -->
<meta name="viewport" content="width-device-width" initial-scale="1">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!-- 루트 폴더에 부트스트랩을 참조하는 링크 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.hi.trip.itinerary.ItineraryDAO"%>
<%@ page import="com.hi.trip.itinerary.ItineraryVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<title>여행일정 목록</title>
<style type="text/css">
a {
	color: #000000;
}

a:hover {
	color: #000000;
	font-weight: bold;
	text-decoration-line: underline;
	text-decoration-style: wavy;
	text-decoration-color: black;
}
</style>
</head>
<body>
	

	<!-- 게시판 메인 페이지 영역 시작 -->
	
	<div class="container">
		<h3>게시판 목록</h3>
		총 레코드 수 : ${count}

		<form name="form1" method="post" action="itineraryList">

			<select name="search_option">
				<option value="member_idx"
					<c:if test="${map.search_option == 'member_idx'}">selected</c:if>>작성자</option>

				<option value="itinerary_title"
					<c:if test="${map.search_option == 'itinerary_title'}">selected</c:if>>제목</option>

				<option value="itinerary_details"
					<c:if test="${map.search_option == 'itinerary_details'}">selected</c:if>>내용</option>

				<option value="all"
					<c:if test="${map.search_option == 'all'}">selected</c:if>>작성자+내용+제목</option>

			</select> <input name="keyword" value="${map.keyword}"> <input
				type="submit" value="조회">
		</form>

		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;">좋아요수</th>
						<th style="background-color: #eeeeee; text-align: center;">조회수</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${itineraryList}" var="one" varStatus="status">

						<tr>
							<td>${one.itinerary_idx}</td>
							<!-- 게시글 제목을 누르면 해당 글을 볼 수 있도록 링크를 걸어둔다 -->
							<td><a
								href="itineraryOne?itinerary_idx=${one.itinerary_idx}">
									${one.itinerary_title}</a></td>
							<td>${one.member_idx}</td>
							<td>${one.itinerary_date}</td>
							<td>${one.itinerary_like}</td>
							<td>${one.itinerary_view}</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>

			<!-- 페이징 처리 영역 -->
			<c:if test="${pageNumber ne 1}">
				<a href="itineraryList?pageNumber=${pageNumber-1}"
					class="btn btn-success btn-arraw-left">이전</a>
			</c:if>
			<c:if test="${nextPage}">
				<a href="itineraryList?pageNumber=${pageNumber+1}"
					class="btn btn-success btn-arraw-left">다음</a>
			</c:if>
			<%-- <%
				if(pageNumber != 1){
			%>
				<a href="itinerary.jsp?pageNumber=<%=pageNumber - 1 %>"
					class="btn btn-success btn-arraw-left">이전</a>
			<%
				}try{if(itineraryDAO.nextPage(pageNumber + 1)){
			%>
				<a href="itinerary.jsp?pageNumber=<%=pageNumber + 1 %>"
					class="btn btn-success btn-arraw-left">다음</a>
			<%
				}}catch(NullPointerException e){
					System.out.println("--NullPointerException 발생151--"); 
					System.out.println("기존 코드를 체크해 주세요!!");
				}finally { System.out.println("예외처리 코드가 오류없이 진행되었습니다.");
				}
			%>  --%>

			<!-- 글쓰기 버튼 생성 -->
			<a href="itineraryCreate.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	<!-- 게시판 메인 페이지 영역 끝 -->


</body>
</html>