<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<!-- Wrapper for slides -->
<!-- 슬라이더 글자 부분 -->
<div class="carousel-inner" role="listbox">
	<c:forEach items="${list}" var="one">
		<!-- 반복문 -->
		<c:set var="i" value="${i+1}" />
		<!-- i변수 선언 -->
		<c:choose>
			<c:when test="${i eq 1}">
				<!-- if문 i 값이 1이면 출력 -->
				<div class="item active">
					<h2 class="nino-sectionHeading">
						<a href="place/pDetail?place_idx=${one.place_idx}"> <span
							class="nino-subHeading">${one.place_info}</span> <img
							src="${one.place_img}" alt="">
						</a>
					</h2>
					<a href="place/pDetail?place_idx=${one.place_idx}" class="nino-btn">이동하기</a>
				</div>
			</c:when>

			<c:otherwise>
				<!-- 1이 아니면 출력 -->
				<div class="item">
					<h2 class="nino-sectionHeading">
						<a href="place/pDetail?place_idx=${one.place_idx}"> <span
							class="nino-subHeading">${one.place_info}</span> <img
							src="${one.place_img}" alt="">
						</a>
					</h2>
					<a href="place/pDetail?place_idx=${one.place_idx}" class="nino-btn">이동하기</a>
				</div>
			</c:otherwise>
		</c:choose>
	</c:forEach>
</div>


<!-- Indicators -->
<!-- 슬라이더 아래 버튼 -->
<ol class="carousel-indicators clearfix">
	<c:forEach items="${list}" var="one">
		<c:set var="n" value="${n+1}" />
		<li data-target="#nino-slider" data-slide-to="${n-1}" class="active">
			<div class="inner">
				<span class="number">0${n}</span>${one.place_info}
			</div>
		</li>
	</c:forEach>
</ol>
