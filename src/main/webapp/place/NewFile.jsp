<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
     <div>
      <table class="search-trip" border="1">
      <thead>
          <tr>
                <th width="500">여행지 시퀀스</th>
                <th width="120">지역</th>
                <th width="100">여행지 중분류</th>
                <th width="100">여행지 소분류</th>
                <th width="100">여행지 시,군</th>
                <th width="100">여행지 정보</th>
            </tr>
        </thead>
<c:forEach var="one" items="${list}">
       <tr>
      <td width="70">${one.place_idx}</td> <!-- one.getId() -->
      <td width="500">${one.place_area}</td>    
      <td width="120">${one.place_middle}</td>     
      <td width="100">${one.place_small}</td>
      <td width="100">${one.place_city}</td>
      <td width="100">
      	<a href="pDetail?place_idx=${one.place_idx}">
      		${one.place_info}	
      	</a>
      </td>
      
   </tr>
   </c:forEach>
</table>
</body>
 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script> 
  <script type="text/javascript"> $(document).ready(function () { var val = location.href.substr( location.href.lastIndexOf('=') + 1 ); 
  console.log('val : ' + val); }); </script>

</html>