<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.hi.trip.member.MemberVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
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

<title>여행지 즐겨찾기</title>
<script type="text/javascript" src="../resources/js/jquery-3.6.0.min.js"></script>


<style>

table {
    margin-left:auto; 
    margin-right:auto;
}

table, td, th {
    border-collapse : collapse;
    text-align: center;
};

.styled-table {
    border-collapse: collapse;
    margin: 25px 0;
    font-size: 0.9em;
    font-family: sans-serif;
    min-width: 400px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}

.styled-table thead tr {
    background-color: rgb(234, 168, 134);
    color: #ffffff;
    text-align: left;
}

.styled-table th,
.styled-table td {
    padding: 12px 15px;
    width: 450px;
}

.styled-table tbody tr {
    border-bottom: 1px solid #dddddd;
}

.styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
    border-bottom: 2px solid rgb(234, 168, 134);
}

.styled-table tbody tr.active-row {
    font-weight: bold;
    color: black;
    font-size: 25px;
}
button{
	background-color: rgb(234, 168, 134);
	color: #ffffff; 
}

div{
	text-align: center;
}
.btn {
    position: relative;
    height: 30px;
    background: #eee linear-gradient(to bottom, #fcfcfc, #eee);
    border: 1px solid #d5d5d5;
    border-radius: 4px;
    display: inline-flex; 
    align-items: center;
    padding: 0 12px;
    font-size: 14px;
    font-weight: 500;
    line-height: 1.5;
    cursor: pointer;
    box-sizing: border-box;
}

</style>
</head>
<body>

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
	<br>
	<br>
	<br>
	<br>
	<table id="favorite_table" class="styled-table">
    <thead>
        <tr>
            <th colspan="3" style="font-size: 30px;">여행지 즐겨찾기</th>
        </tr>
    </thead>
    <tbody>
    	<tr>
    	</tr>
    	<%-- <tr class="active-row">
    		<th>${list.get(0).place_name}</th>
    		<th>${list.get(1).place_name}</th>
    	</tr>
        <tr class="">
        	<td>
        	사진 설명..
        	<p><a href="#">삭제</a>
        	</td>
        	<td>
        	사진 설명..
        	<p><a href="#">삭제</a>
        	</td>
        </tr>
        <tr class="active-row">
    		<th>${list.get(2).place_name}</th>
    		<th>${list.get(3).place_name}</th>
    	</tr>
        <tr class="">
        	<td>
        	사진 설명..
        	<p><a href="#">삭제</a>
        	</td>
        	<td>
        	사진 설명..
        	<p><a href="#">삭제</a>
        	</td>
        </tr> --%>
        <tr class="active-row">
        <c:forEach var="one" items="${list2}" varStatus="status">
    			
    		<td style="text-align: left;">
    		<script>console.log('${one}')</script> 		
    		<p><a href="#" onclick="location.href='/trip/place/pDetail?place_idx=${one.place_idx}'"><img src="${one.place_img}"></a></p>
    		<p><a style="color: black;" href="#" onclick="location.href='/trip/place/pDetail?place_idx=${one.place_idx}'">${one.place_info}</a></p>
    		<p><a href="#" onclick="location.href='/trip/member/deleteFavorite?favorite_idx=${list.get(status.index).favorite_idx}'"><button class="btn" style="color:black;">삭제</button>	</a>	
    		</td>
    		
    		<c:if test="${status.count mod 2 eq 0}">
    			</tr><tr class="active-row">
    		</c:if>
		</c:forEach>
		</tr>
        
    </tbody>
	</table>
</body>
</html>