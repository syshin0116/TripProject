<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 드롭다운 css -->
<style>
/* Style The Dropdown Button */
.dropbtn {
  background-color:transparent;
  color: white;
  padding: 14px;
  font-size: 13px;
  border: none;
  cursor: pointer;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
  position: relative;
  display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #f1f1f1}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
  display: block;
}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {
  background-color:transparent;
}
#logoutButton{
	background-color: rgb(234, 168, 134);
	color: #ffffff; 
}
</style>

<!-- Header
    ================================================== -->
			
			<nav id="nino-navbar" class="navbar navbar-default" role="navigation">
				<div class="container">

					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
					<!-- 화면이 작아지면 헤더 메뉴 토글로 바뀐다. -->
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#nino-navbar-collapse">
							<span class="sr-only">Toggle navigation</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<!-- 왼쪽 상단 로고부분 -->
						<a href="#" class="navbar-brand" onclick="location.href='/trip/main.jsp'">HITRIP</a>
					</div>

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="nino-menuItem pull-right">
						<div class="collapse navbar-collapse pull-left" id="nino-navbar-collapse">
							<ul class="nav navbar-nav">
								<li><a href="#" onclick="location.href='/trip/place/pSearch.jsp'">여행지 검색 </a></li>
								<li><a href="#" onclick="location.href='/trip/itinerary/itinerary.jsp'">여행경로 게시판</a></li>
								<li><a href="#" onclick="location.href='/trip/survey/survey.jsp'">여행지 추천</a></li>
							</ul>
						</div><!-- /.navbar-collapse -->
						<ul class="nino-iconsGroup nav navbar-nav">
							<div class="dropdown">
								<% if(session.getAttribute("member_idx").equals(1)) { %>
									<button class="dropbtn">관리자 페이지</button>
	 					 				 <div class="dropdown-content">
	 					 				 	<a href="#" onclick="location.href='/trip/member/statistics'">회원 통계</a>
	  										<a href="#" onclick="location.href='/trip/member/information'">관리자 정보</a>
	  									  	<a href="#" onclick="location.href='/trip/member/modify'">관리자 정보 수정</a>
	    									<a href="#" onclick="location.href='/trip/member/surveyResultList'">나의 추천 결과</a>
	    									<a href="#" onclick="location.href='/trip/member/favorite'">즐겨 찾기</a>
	    									
	  									</div>
								<% } else { %>
									<button class="dropbtn">마이페이지</button>
 					 				 <div class="dropdown-content">
  										<a href="#" onclick="location.href='/trip/member/information'">회원 정보</a>
  									  	<a href="#" onclick="location.href='/trip/member/modify'">정보 수정</a>
    									<a href="#" onclick="location.href='/trip/member/surveyResultList'">나의 추천 결과</a>
    									<a href="#" onclick="location.href='/trip/member/favorite'">즐겨 찾기</a>
  									</div>
								<% } %>	
  								
							</div>
						</ul>
						<ul class="nino-iconsGroup nav navbar-nav">
							<li><i class="mdi mdi-emoticon-outline nino-icon" style="color:yellow;">[<%=session.getAttribute("member_name")%>]님 환영합니다 </i></li>
							<li><i class="mdi mdi-emoticon-outline nino-icon" style="color:blue;"><a href="#" onclick="location.href='/trip/member/logout'" style="font-size: small"><button id="logoutButton">로그아웃</button></a></i></li>
						</ul>
						
					</div>
				</div><!-- /.container-fluid -->
			</nav>

			