<%@page import="java.util.List"%>
<%@page import="com.hi.trip.place.PagingVO"%>
<%@page import="com.hi.trip.place.PlaceDAO"%>
<%@page import="com.hi.trip.place.PlaceVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	//한글깨짐방지
/* 	request.setCharacterEncoding("UTF-8");
 */	
	// 사용자 이름 설정
	String id = (String)session.getAttribute("id");
	
	// 임의의 상수 설정
	String action = "pShowSearch.jsp";
	String searchCondition = request.getParameter("searchCondition");
	String searchKeyword = request.getParameter("searchKeyword");
	String search = "&searchCondition="+searchCondition+"&searchKeyword="+searchKeyword;
	


//========= get place list with paging ===========
 	PlaceVO vo = new PlaceVO();
	PlaceDAO placeDAO = new PlaceDAO();

	// 게시글 검색 설정
	vo.setSearchCondition(searchCondition);
	vo.setSearchKeyword(searchKeyword);

	// 페이징 처리 된 데이터 조회
	int placeListcnt = placeDAO.getPlaceCnt(vo);
	
	
	//========= paging ===========
	PagingVO pagingVO = new PagingVO();
	
	// 현재 페이지 체크 및 설정
	// 첫 페이지면 1이 설정, 아니라면 해당 페이지 넘버가 설정됨
	int currentPage = 1;
	//System.out.println("request.param page = " + request.getParameter("page") );
	if (request.getParameter("page") != null) {
		currentPage = Integer.parseInt(request.getParameter("page"));
	}
	pagingVO.setCurrentPage(currentPage);
	
	// 전체 페이지 설정 
	// sql rownum 설정하기 이전의 count 필요
	pagingVO.setTotalCount( placeListcnt );
/* 	out.println(pagingVO.getTotalCount());
 */	
	
	//========= pagination ===========
	pagingVO.setEndPage( ((int) Math.ceil(pagingVO.getCurrentPage() / (double) pagingVO.getDisplayPage())) * pagingVO.getDisplayPage() );	//Math.ceil : 소수점 이하를 올림한다
	pagingVO.setBeginPage( pagingVO.getEndPage() - (pagingVO.getDisplayPage() - 1) );
	pagingVO.setTotalPage( (int) Math.ceil(pagingVO.getTotalCount() / (double) pagingVO.getDisplayRow()) );
	if (pagingVO.getEndPage() > pagingVO.getTotalPage()) {
		pagingVO.setEndPage(pagingVO.getTotalPage());
	}
	
	 
	//========= get place list with paging ===========
	// 페이징 처리 된 데이터 조회
	List<PlaceVO> placeList;
	placeList = placeDAO.getPlaceListWithPaging(currentPage, vo);
	
	
	System.out.println("currentPage = " + currentPage );
	System.out.println("999 pagingVO.toString() = " + pagingVO.toString() );
	System.out.println("000 placeList.toString() = " + placeList.toString() );

%>   
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
<!--     <link rel="stylesheet" type="text/css" href="../mogo/css/style.css" />
 -->    <title></title>
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
	<style>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="com.hi.trip.itinerary.ItineraryDAO"%>
<%@ page import="com.hi.trip.itinerary.ItineraryVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
		

      <h1>여행지 검색결과</h1>
 
<div class="row">
<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">사진</th>
						<th style="background-color: #eeeeee; text-align: center;">조회수</th>
						<th style="background-color: #eeeeee; text-align: center;">좋아요수</th>
					</tr>
				</thead>
				
				<tbody>
				
					<c:forEach items="${list}" var="one" varStatus="status">

						<tr>
							<td>${one.place_idx}</td>
							<!-- 게시글 제목을 누르면 해당 글을 볼 수 있도록 링크를 걸어둔다 -->
							<td><a href="pDetail?place_idx=${one.place_idx}" style="color: black;">
									${one.place_info}</a></td>
							<td><div class="image-block align-center">
							<a href="pDetail?place_idx=${one.place_idx}">
												<img class="" src="${one.place_img}" alt="${one.place_info}" width="500" height="250" ></a>
											</div></td>
							<td>1<%-- ${one.place_view} --%></td>
							<td>2<%-- ${one.place_like} --%></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
<%-- 			
			
							<div class="col-12 col-sm-4 px-2 align-center">
									<a href="pDetail?place_idx=${one.place_idx}" class="">
										<div class="spot-block" title="${one.place_info}">
											<div class="image-block align-center">
												<img class="" src="${one.place_img}" alt="${one.place_info}" data-src="" >
											</div>
											<div class="spot-title-block">
												${one.place_info}
											</div>
										</div>
									</a>
								</div> --%>
</div>	
					
 		<div id="pagination">
            <!-- 변수 매핑 -->
            <c:set var="page" value="<%=pagingVO.getCurrentPage() %>" />
 			<c:set var="beginPage" value="<%=pagingVO.getBeginPage() %>" />
 			<c:set var="endPage" value="<%=pagingVO.getEndPage() %>" />
 			<c:set var="totalPage" value="<%=pagingVO.getTotalPage() %>" />
            <c:set var="action" value="<%=action %>" />
            <c:set var="displayPage" value="<%=pagingVO.getDisplayPage() %>" />
            
            <c:set var="searchKeyword" value="<%=searchKeyword %>" />
            <c:set var="search" value="<%=search %>" />
           
            
            <!-- 처음으로 -->
			<c:if test="${ searchKeyword == null }">
            	<a href="${ action }?page=1">
					<span>«</span>
				</a>
			</c:if>
			<c:if test="${ searchKeyword != null }">
            	<a href="${ action }?page=1${ search }">
					<span>«</span>
				</a>
			</c:if>
			
			<!-- 이전버튼 -->
            <c:if test="${ page <= 1 }">
				<span>이전</span>
            </c:if>
            <c:if test="${ page > 1 }">
				<c:if test="${ searchKeyword == null }">
					<a href="${ action }?page=${ page - 1 }">이전</a>
				</c:if>
				<c:if test="${ searchKeyword != null }">
					<a href="${ action }?page=${ page - 1 }${ search }">이전</a>
				</c:if>
            </c:if>
            
            
 			<!-- 넘버링버튼 for문 -->
            <c:forEach var="item" varStatus="status" begin="${ beginPage }" end="${ endPage }" step="1">
                <c:if test="${ page == item }">
                    ${ item }
                </c:if>
                <c:if test="${ page != item }">
		 			<c:if test="${ searchKeyword == null }">
		 				<a href="${ action }?page=${ item }">${ item }</a>
		 			</c:if>
		 			<c:if test="${ searchKeyword != null }">
		 				<a href="${ action }?page=${ item }${ search }">${ item }</a>
		 			</c:if>
                </c:if>
            </c:forEach>
			
			<!-- 다음버튼 -->
            <c:if test="${ page >= totalPage }">
				<span>다음</span>
            </c:if>
            <c:if test="${ page < totalPage }">
				<c:if test="${ searchKeyword == null }">
	 				<a href="${ action }?page=${ page + 1 }">다음</a>
				</c:if>
				<c:if test="${ searchKeyword != null }">
	 				<a href="${ action }?page=${ page + 1 }${ search }">다음</a>
				</c:if>
            </c:if>
            
            <!-- 끝으로 -->
			<c:if test="${ searchKeyword == null }">
 				<a href="${ action }?page=${ totalPage }">
					<span>»</span>
				</a>
			</c:if>
			<c:if test="${ searchKeyword != null }">
				<a href="${ action }?page=${ totalPage }${ search }">
					<span>»</span>
				</a>
			</c:if>
	    </div>
 		
 
 
 
 
  </body>
</html>