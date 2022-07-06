<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.hi.trip.member.MemberVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<title>회원 정보 보기</title>
<script type="text/javascript" src="../resources/js/jquery-3.6.0.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
    width: 400px;
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
	<table id="member_table" class="styled-table">
    <thead>
        <tr>
            <th colspan="2" style="font-size: 30px;">회원 정보</th>
        </tr>
    </thead>
    <tbody>
        <tr class="active-row">
            <th>아이디</th>
            <td id="member_id">${vo.member_id}</td>
        </tr>
        <tr class="active-row">
            <th>닉네임</th>
            <td>${vo.member_name}</td>
        </tr>
        <tr class="active-row">
            <th>생년월일</th>
            <td>${vo.member_birth}</td>
        </tr>
        <tr class="active-row">
            <th>성별</th>
            <td id="gender"></td>
        </tr>
        <tr class="active-row">
            <th>주소</th>
            <td>${vo.member_addr}</td>
        </tr>
        <!-- and so on... -->
    </tbody>
</table>
</body>
<script>
	if("${vo.member_type}"=="2")
	{
		document.getElementById("member_id").innerHTML="NAVER-"+"${vo.member_naver_token}".substring(10, 20);
	}
	else if("${vo.member_type}"=="3")
	{
		document.getElementById("member_id").innerHTML="GOOGLE-"+"${vo.member_google_token}".substring(0, 10);
	}

	
	if(${vo.member_gender}==1)
	{
		document.getElementById("gender").innerHTML="남";

	}
	else
	{
		document.getElementById("gender").innerHTML="여";

	}
	
</script>
</html>