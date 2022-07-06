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

<title>회원 통계</title>
<script type="text/javascript" src="../resources/js/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://d3js.org/d3.v7.min.js"></script>

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


/*d3.js css*/
svg {
    border: 1px solid;
}
.bar {
    fill: orange;
}
.bar:hover {
    fill: tomato;
    cursor: pointer;
}
.text {
    fill: white;
    font-weight: bold;
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
	<table id="statistics_table" class="styled-table">
    <thead>
        <tr>
            <th colspan="3" style="font-size: 30px;">회원 통계</th>
        </tr>
    </thead>
    <tbody>
    	<tr>
    	</tr>
    	<tr class="active-row">
    		<th>연령대별 회원 수</th>
    		<th>남녀 성비</th>
    	</tr>
        <tr>
        	<td>
        	<div style="text-align: center;" ><svg id="ageGraph" style="width:300; height:200; border: 1px solid black;"></svg></div> 	
        	</td>
        	<td>
        	<div style="text-align: center;" ><svg id="genderGraph" style="width:300; height:200; border: 1px solid black;"></svg></div> 	
        	</td>
        </tr>
        <tr class="active-row">
    		<th>거주 지역별 회원 수</th>
    		<th>회원가입 종류</th>
    	</tr>
        <tr>
        	<td>
        	<div style="text-align: center;" ><svg id="addrGraph" style="width:300; height:200; border: 1px solid black;"></svg></div> 	
        	</td>
        	<td>
        	<div style="text-align: center;" ><svg id="snsGraph" style="width:300; height:200; border: 1px solid black;"></svg></div> 	
        	</td>
        </tr>
        
    </tbody>
	</table>
    ${list}
</body>

<script>
		var svgHeight=200; //svg 요소의 높이
		var barElements; //막대그래프의 막대 요소를 저장할 변수
		var dataSet=[40,50,60,70,80, 90];
		
		//그래프 그리기
		barElements=d3.select("#ageGraph")
		.selectAll("rect") //rect 요소를 지정
		.data(dataSet) //데이터를 요소에 연결
		
		//데이터가 추가될 때 
		barElements.enter() //데이터 개수만큼 반복
		.append("rect") //데이터 개수만큼 rect 요소가 추가됨
		.attr("class", "bar") //css 클래스를 지정
		.attr("height", function(d,i){ return d; }) //높이 지정, 2번째 파라미터에 함수 지정, 데이터값을 그대로 높이로반환
		.attr("width", 20) //넓이 지정
		.attr("x", function(d,i){ return i*50+14; }) //x좌표 지정, 표시 순서에 25를 곱하여 위치 계산
		.attr("y", function(d,i){ return svgHeight-d;}) // y좌표 지정, y좌표 계산
		.selectAll("rect") //rect요소를 지정
		.data(dataSet) //데이터를 요소에 연결
		.enter() //데이터 개수만큼 반복
		.append("rect") //데이터 개수만큼 rect요소가 추가됨

		
</script>
	
<script>
	var dataset = [ {x : 'A', y : 9}
	              , {x : 'B', y : 19}
	              , {x : 'C', y : 29}
	              , {x : 'D', y : 39}
	              , {x : 'E', y : 29}
	              , {x : 'F', y : 19}
	              , {x : 'G', y : 9} ];
	
	var svg = d3.select("#addrGraph");
	
	
	svg.selectAll("rect")
	     .data(dataset)
	     .enter()
	     .append("rect")
	         .attr("class","bar")
	         .attr("height", function(d, i) {return (d.y * 5)})
	         .attr("width", 40)
	         .attr("x", function(d, i) {return (50 * i)})
	         .attr("y", function(d, i) {return (250 - d.y * 5)});
	
	svg.selectAll("text")
	     .data(dataset)
	     .enter()
	     .append("text")
	     .text(function(d) {return d.y})
	         .attr("class", "text")
	         .attr("x", function(d, i) {return 50 * i + 10})
	         .attr("y", function(d, i) {return 250 - d.y * 5 + 15});
</script>
</html>