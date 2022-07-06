<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
<div id="center">
  <div id="in_title">
                        <textarea name="title" id="idTitle" rows="1" cols="55" placeholder="제목" maxlength="100" required></textarea>
                    </div>
                    <div id="in_traveldate">
                        <textarea name="title" id="idDate" rows="1" cols="55" placeholder="여행기간" maxlength="100" required></textarea>
                    </div>
                    <div id="in_relationship">
                        <textarea name="title" id="idRelationship" rows="1" cols="55" placeholder="여행 동행자와의 관계" maxlength="100" required></textarea>
                    </div>
                    <div class="wi_line"></div>
                    <div id="in_content">
                        <textarea name="content" id="idContent" placeholder="내용" required></textarea>
                    </div>
 
			<form action="pReview.up">
				<div class="titleChange">
					<label for="title">제목:</label> 
					<input type="text"
						class="form-control" name="place_title" value="${one.place_title}">
				</div>
				<div class="pwChange">
					<label for="date">여행기간:</label> 					
					<input type="text"
						class="dateChange" name="placeComment_traveldate" value="${one.placeComment_traveldate}">
				</div>		
				<div class="relationshipChange">
					<label for="date">관계:</label> 		
					<input type="text"
						class="relatioshipChange" name="placeComment_relationship" value="${one.placeComment_relationship}">
				</div>
				<div class="contentChange">
					<label for="content">내용:</label> 					
					<textarea
						class="contentChange" name="place_content" value="${one.place_content}"></textarea>
				</div>
				<button type="submit" class="btn btn-success">수정하기</button>
			</form>
		</div>

</body>
</html>