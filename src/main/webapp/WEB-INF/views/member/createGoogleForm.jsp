<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../resources/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../resources/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../resources/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../resources/images/ico/apple-touch-icon-57-precomposed.png">
	
	<!-- css -->
	<link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="../resources/css/materialdesignicons.min.css" />
	<link rel="stylesheet" type="text/css" href="../resources/css/jquery.mCustomScrollbar.min.css" />
	<link rel="stylesheet" type="text/css" href="../resources/css/prettyPhoto.css" />
	<link rel="stylesheet" type="text/css" href="../resources/css/unslider.css" />
	<link rel="stylesheet" type="text/css" href="../resources/css/template.css" />

<title>회원가입</title>
<style>

table {
    margin-left:auto; 
    margin-right:auto;
}

table, td, th {
    border-collapse : collapse;
    text-align: left;
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
    width: 600px;
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
<script type="text/javascript" src="../resources/js/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
alert("가입을 위해 필수 정보를 입력해주세요.")

$(function(){
	
	document.getElementById("member_google_token").value='${vo.member_google_token}'
	
	$('#find_addr').click(function(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	
	        	console.log(data);
	        	
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var roadAddr = data.roadAddress; // 도로명 주소 변수
	            var jibunAddr = data.jibunAddress; // 지번 주소 변수
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            if(roadAddr !== ''){
	                document.getElementById("addr_first").value = roadAddr;
	            } 
	            else if(jibunAddr !== ''){
	                document.getElementById("addr_first").value = jibunAddr;
	            }
	        }
	    }).open();
	})
	
	
	var nameChecked=0;
	
	$('#nameCheck').click(function(){
		console.log("중복확인 ajax 함수")
		if($('#member_name').val()=="")
		{
			alert("닉네임을 먼저 입력해주세요.")
		}
		else
		{
			$.ajax({
				url: "nameCheck" ,
				data: {
					member_name : $('#member_name').val()
				},
				success: function(result){
					console.log(result)
					if(result=='false')
					{
						alert("사용 가능한 닉네임입니다.")
						if(confirm("이 닉네임을 사용하시겠습니까?"))
							{
								$('#member_name').attr('readonly', 'true')
								$('#member_name').attr('style', 'background-color: mistyrose;')
								nameChecked=1;
							}
					}
					else
					{
						alert("사용할 수 없는 닉네임입니다.")
						$('#member_name').val("")
					}
				} ,
				error: function(){
					alert('ajax 실패.@@')
				}
				
			})
		}
	})
	
	$('#formCheck').click(function(){
		
		 console.log($('#member_id').val());
         console.log($('#member_pw').val());
         
         if($('#member_name').val()=="")
         {
        	 alert("닉네임을 입력해주세요.");
             $('#member_name').focus();
             return;
         }
         else if(nameChecked==0)
         {
        	 alert("닉네임을 중복 확인해주세요.");
             $('#member_name').focus();
             return;
         }
         else if($('#member_gender_M').is(':checked')==false&&$('#member_gender_F').is(':checked')==false)
         {
        	 alert("성별 항목에 체크해주세요.");
             return;
         }
         else if($('#member_birth').val()=="")
         {
        	 alert("생년 월일을 입력해주세요.");
             $('#member_birth').focus();
             return;
         }
         else if($('#addr_first').val()=="")
         {
        	 alert("주소를 입력해주세요.");
             $('#addr_first').focus();
             return;
         }
         else if($('#addr_last').val()=="")
         {
        	 alert("나머지 주소를 입력해주세요.");
             $('#addr_last').focus();
             return;
         }
         else
         {                          
             
         }
         
         $('#member_addr').val($('#addr_first').val()+', '+$('#addr_last').val());
         console.log($('#member_addr').val());
         $("form").submit();
         
	})
         
})
</script>
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
	<form action="createMember">
	<table id="member_table" class="styled-table">
    <thead>
        <tr>
            <th colspan="2" style="font-size: 30px;">구글 계정으로 가입</th>
        </tr>
    </thead>
    <tbody>
        <tr class="active-row">
            <th>닉네임</th>
            <td><input type="text" name="member_name" id="member_name"> <button type="button" id="nameCheck" >닉네임 확인</button></td>
        </tr>
        <tr class="active-row">
            <th>성별</th>
            <td><label><input type="radio" name="member_gender" id="member_gender_M" value="1"> 남</label>
      		 <label><input type="radio" name="member_gender" id="member_gender_F" value="2"> 여</label></td>
        </tr>
        <tr class="active-row">
            <th>생년월일</th>
            <td><input type='date' name='member_birth' id='member_birth'></td>
        </tr>
        <tr class="active-row">
            <th>주소</th>
            <td><input name="addr_first" id="addr_first" type="text" placeholder="주소" readonly> <button id="find_addr" type="button">주소 찾기</button></td>
        </tr>
        <tr class="active-row">
            <th>상세 주소</th>
            <td><input name="addr_last" id="addr_last" type="text" placeholder="상세 주소"></td>
        </tr>
        <tr>
            <th colspan="2" style="font-size: 30px; text-align: center;">
            <input name="member_addr" id="member_addr" type="hidden">
  			<input name="member_type" id="member_type" type="hidden" value="3">
  			<input name="member_google_token" id="member_google_token" type="hidden">
			<button type="button" id="formCheck">회원가입</button>
            </th>
        </tr>
    </tbody>
</table>
</form>
</body>
</html>