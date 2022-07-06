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


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
        //구글차트(성별 파이차트)
        google.charts.load('current', {'packages':['corechart']}); 
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var data = new google.visualization.DataTable();
            data.addColumn('string','gender');
            data.addColumn('number','비중');
 
            data.addRows([ 
                ['남자', ${list.get(0).memberstatistics_count}],
                ['여자', ${list.get(1).memberstatistics_count}]
            ]);
            var opt = {
                    'title':'남녀 회원수',
                    'width':350,
                    'height':350,
                    pieSliceText:'label',
                    legend:'none' 
            };
            var chart = new google.visualization.PieChart(document.getElementById('genderChart'));
            chart.draw(data,opt);
        }
        
        
      	//구글차트(회원가입 종류 파이차트)
        google.charts.load('current', {'packages':['corechart']}); 
        google.charts.setOnLoadCallback(drawType);
        function drawType() {
            var data = new google.visualization.DataTable();
            data.addColumn('string','type');
            data.addColumn('number','비중');
 
            data.addRows([ 
                ['하이트립', ${list.get(15).memberstatistics_count}],
                ['네이버', ${list.get(16).memberstatistics_count}],
                ['구글', ${list.get(17).memberstatistics_count}]
            ]);
            var opt = {
                    'title':'회원가입 종류',
                    'width':350,
                    'height':350,
                    pieSliceText:'label',
                    legend:'none' 
            };
            var chart = new google.visualization.PieChart(document.getElementById('typeChart'));
            chart.draw(data,opt);
        }
        
        
        
        //연령별 막대그래프
        google.charts.load('current', {packages: ['corechart', 'bar']});
        google.charts.setOnLoadCallback(drawAge);
     
        function drawAge() {
       
        var data = new google.visualization.DataTable();
        data.addColumn('string', '연령대');
        data.addColumn('number', '회원수(명)');
         
        data.addRows([

        ['10대 이하', ${list.get(2).memberstatistics_count},],
        ['20대', ${list.get(3).memberstatistics_count}],
        ['30대', ${list.get(4).memberstatistics_count}],
        ['40대', ${list.get(5).memberstatistics_count}],
        ['50대', ${list.get(6).memberstatistics_count}],
        ['60대 이상', ${list.get(7).memberstatistics_count}]

        ]);

        var options = {
        title: '연령대별 회원 수',
        hAxis: {
        title: '연령대',
        viewWindow: {
        min: [7, 30, 0],
        max: [17, 30, 0]
        }
        },

        vAxis: {
        title: '회원수(명)'
        }
        };
      
        var chart = new google.visualization.ColumnChart(

        document.getElementById('ageChart'));
      
        chart.draw(data, options);

        }
        
        
        
      	//주소 지역별 막대그래프
        google.charts.load('current', {packages: ['corechart', 'bar']});
        google.charts.setOnLoadCallback(drawAddr);
     
        function drawAddr() {
       
        var data = new google.visualization.DataTable();
        data.addColumn('string', '지역');
        data.addColumn('number', '회원수(명)');
        
        
         
        data.addRows([

        ['서울', ${list.get(8).memberstatistics_count}],
        
        ['경기도', ${list.get(9).memberstatistics_count}+${list.get(23).memberstatistics_count}], //경기+인천
        
        ['강원도', ${list.get(10).memberstatistics_count}], 
        
        ['충청도', ${list.get(11).memberstatistics_count}+${list.get(20).memberstatistics_count}
        		 +${list.get(25).memberstatistics_count}], //충북+충남+대전
        		 
        ['전라도', ${list.get(12).memberstatistics_count}+${list.get(19).memberstatistics_count}
        		 +${list.get(24).memberstatistics_count}], //전북+전남+광주
        		 
        ['경상도', ${list.get(13).memberstatistics_count}+${list.get(18).memberstatistics_count}
        		 +${list.get(22).memberstatistics_count}+${list.get(26).memberstatistics_count}
        		 +${list.get(21).memberstatistics_count}], //경북+경남+대구+울산+부산
        
        ['제주도', ${list.get(14).memberstatistics_count}]

        ]);

        var options = {
        title: '거주 지역별 회원 수',
        hAxis: {
        title: '거주 지역',
        viewWindow: {
        min: [7, 30, 0],
        max: [17, 30, 0]
        }
        },

        vAxis: {
        title: '회원수(명)'
        }
        };
      
        var chart = new google.visualization.ColumnChart(

        document.getElementById('addrChart'));
      
        chart.draw(data, options);

        }
 
</script>

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
    		<th>남녀 회원 수</th>
    	</tr>
        <tr class="active-row">
        	<td>
        	<div id="ageChart" style="width: 550px; height: 300px;"></div>
        	</td>
        	<td>
        	<div id="genderChart" style="padding-left: 45px;"></div>
        	</td>
        </tr>
        <tr class="active-row">
    		<th>거주 지역별 회원 수</th>
    		<th>회원가입 종류</th>
    	</tr>
        <tr class="active-row">
        	<td>
        	<div id="addrChart" style="width: 550px; height: 300px;"></div>
        	</td>
        	<td>
        	<div id="typeChart" style="padding-left: 45px;"></div>
        	</td>
        </tr>
        
    </tbody>
	</table>
</body>
<!-- <script> //파이차트 정렬  테스트
console.log(document.getElementById("genderChart").children)
var child=document.getElementById("genderChart").children;
console.log(child.setAttribute("style", ""));
document.getElementById("genderChart").children[0].setAttribute("style","position: relative; text-align: center;");
</script> -->
</html>