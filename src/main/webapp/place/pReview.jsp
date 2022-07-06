<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
  </head>
  <body>
  <a href="pReivewWrite.jsp">
		
    <div id="pReview">
 
      <h1>여행지 리뷰</h1>
      <table class="list-trip">
      <thead>
          <tr>
              <th width="70">번호</th>
                <th width="500">작성자 id</th>
                <th width="120">여행지 시뭔스</th>
                <th width="100">제목</th>
                <th width="100">여행날짜</th>
                <th width="100">등록일</th>
            </tr>
        </thead>

       <tr>
      <td width="70">${one.placeComment_idx}</td> <!-- one.getId() -->
      <td width="500">${one.member_id}</td>    
      <td width="120">${one.place_idx}</td>     
      <td width="100">${one.place_title}</td>
      <td width="100">${one.placeComment_traveldate}</td>
      <td width="100">${one.placeComment_mdfydate}</td>
      
   </tr>
</table>
<a href = "pReview.write">
<button class="btn btn-success">리뷰쓰기</button>

</a>
</div>
</a>
      
 
 
 
 
 
  </body>
</html>