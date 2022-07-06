<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>





<c:forEach items="${list}" var="one">
	<!-- 반복문 -->
	<div class="col-md-4 col-sm-4">
		<div class="item">
			<a class="overlay" href="place/pDetail?place_idx=${one.place_idx}"> <span class="content">
					<h3>${one.place_info}</h3> <br>
					<h3>추천 수 : ${one.place_like}명</h3>
			</span> <img src="${one.place_img}" alt="">
			</a>
		</div>
	</div>
</c:forEach>

