<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<!-- 구글 로그인 및 css -->
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
    <script src="https://apis.google.com/js/api:client.js"></script>
    <style type="text/css">
    #customBtn {
      display: inline-block;
      background: white;
      color: #444;
      width: 190px;
      border-radius: 5px;
      border: thin solid #888;
      box-shadow: 1px 1px 1px grey;
      white-space: nowrap;
    }
    #customBtn:hover {
      cursor: pointer;
    }
    span.label {
      font-family: serif;
      font-weight: normal;
    }
    span.icon {
      background: url('/identity/sign-in/g-normal.png') transparent 5px 50% no-repeat;
      display: inline-block;
      vertical-align: middle;
      width: 42px;
      height: 42px;
    }
    span.buttonText {
      display: inline-block;
      vertical-align: middle;
      padding-left: 42px;
      padding-right: 42px;
      font-size: 14px;
      font-weight: bold;
      /* Use the Roboto font that is loaded in the <head> */
      font-family: 'Roboto', sans-serif;
    }
  </style>

</head>
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="../resources/js/jquery-3.6.0.min.js"></script>
<script>
console.log("<%=request.getRequestURL()%>")
console.log(location.host)

<!--구글로 로그인 -->
var googleUser = {};
var startApp = function() {
  gapi.load('auth2', function(){
    // Retrieve the singleton for the GoogleAuth library and set up the client.
    auth2 = gapi.auth2.init({
      client_id: '166227979625-2oeo9jd7muj3rspks8npeo3t07on6vg8.apps.googleusercontent.com',
      cookiepolicy: 'single_host_origin',
      // Request scopes in addition to 'profile' and 'email'
      //scope: 'additional_scope'
    });
    attachSignin(document.getElementById('customBtn'));
  });
};

function attachSignin(element) {
  console.log(element.id);
  auth2.attachClickHandler(element, {},
      function(googleUser) {
        /* document.getElementById('name').innerText = "로그인한 아이디: " +
            googleUser.getBasicProfile().getId(); */
            console.log("구글 식별자: "+googleUser.getBasicProfile().getId());
            location.href="loginGoogle?id="+googleUser.getBasicProfile().getId();
      }, function(error) {
        alert(JSON.stringify(error, undefined, 2)); //쿠키설정 허용 안할 시 크롬에서 에러 날 수 있음
      });
}
</script>
<body>

<header id="nino-header">
		<div id="nino-headerInner">
			<%
				if (session.getAttribute("member_name") == null) {
			%>
			<jsp:include page="../header.jsp"></jsp:include>
			<%
				} else {
			%>
			<jsp:include page="../header2.jsp"></jsp:include>
			<%
				}
			%>
		</div>
	</header>

	<!-- <button onclick="location.href='createMemberForm.jsp'" type="button">Hi-TRIP으로 가입</button>
	
	<div id="naverIdLogin" style="display:none;"></div>
    아래 커스텀 버튼 동작을 위해 필요. 
    <div class="social-login"> 
    <a href="#no" title="네이버ID로 로그인" class="naver-login" id="naverLogin">
    <i class="xi-naver"></i><img width="230px" src="../resources/img/loginWithNaver.png"></a> 
    커스텀 버튼 
    </div>
	
	<form action="">
		<button type="submit">구글</button>
	</form> -->
	
	<br>
	<br>
	<br>
	<br>
	<table id="rgst_table" class="styled-table">
    <thead>
        <tr>
            <th colspan="2" style="font-size: 30px; text-align: center;">회원가입</th>
        </tr>
    </thead>
    <tbody>
        <tr class="active-row">
            <th colspan="2" style="text-align: center"><button style="width: 342px; height:63.69px" onclick="location.href='createMemberForm.jsp'" type="button">HITRIP으로 가입</button></td>
        </tr>
        <tr class="active-row">
            <th colspan="2" style="text-align: center"><div id="naverIdLogin" style="display:none;"></div>
    		<div class="social-login"> 
    		<a href="#no" title="네이버ID로 가입" class="naver-login" id="naverLogin">
    		<img style="width: 60%;" src="../resources/img/네이버-계정으로-회원가입.png"></a> 
    		</div></th>
        </tr>
        <tr class="active-row">
            <th colspan="2" style="text-align: center">
            	<div id="gSignInWrapper" style="text-align:center;">
				<span class="label"></span>
				<div id="customBtn" class="customGPlusSignIn" style="width:342px; height:63.69px; color:white; border:white; box-shadow:0px 0px 0px white;">     
				<span><img style="width:100%;" src="../resources/img/구글-계정으로-회원가입.png"></span>
				</div>
				</div>
				<div id="name"></div>
				<script>startApp();</script>
            </th>
        </tr>      
    </tbody>
</table>

</body>
<script type="text/javascript" src="../resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	

<!--네이버로 회원가입 -->
  var naverLogin = new naver.LoginWithNaverId(
   {
    clientId: "n0kdjXCYJdG3WwDKAvfR",
    callbackUrl: "<%=request.getRequestURL()%>",
    loginButton: {color: "green", type: 2, height: 40}
    }
   );
  
    naverLogin.init();
    
    $(document).on("click", "#naverLogin", function(){ var naverLogin = document.getElementById("naverIdLogin").firstChild; naverLogin.click(); });
     
    naverLogin.getLoginStatus(function (status) {
      if (status) {
    	  var id=naverLogin.user.getId();
          var gender=naverLogin.user.getGender();
          var birthday=naverLogin.user.getBirthday();
          var birthyear = naverLogin.user.getBirthyear();
          console.log(gender+" "+birthday+" "+birthyear+" "+id)

         if(gender===null||gender===undefined )
         {
            alert("필수 정보 제공에 동의해주세요.");
            naverLogin.reprompt();
            return ;  
         }
         else if(birthday===null||birthday===undefined )
         {
        	 alert("필수 정보 제공에 동의해주세요.");
             naverLogin.reprompt();
             return ; 
         }
         else if(birthyear===null||birthyear===undefined )
         {
        	 alert("필수 정보 제공에 동의해주세요.");
             naverLogin.reprompt();
             return ; 
         }
         else
         {
        	 	var f = document.createElement('form');
        	    
        	    var obj1;
        	    obj1 = document.createElement('input');
        	    obj1.setAttribute('type', 'hidden');
        	    obj1.setAttribute('name', 'id');
        	    obj1.setAttribute('value', id);
        	    
        	    var obj2;
        	    obj2 = document.createElement('input');
        	    obj2.setAttribute('type', 'hidden');
        	    obj2.setAttribute('name', 'gender');
        	    obj2.setAttribute('value', gender);
        	    
        	    var obj3;
        	    obj3 = document.createElement('input');
        	    obj3.setAttribute('type', 'hidden');
        	    obj3.setAttribute('name', 'birthday');
        	    obj3.setAttribute('value', birthday);
        	    
        	    var obj4;
        	    obj4 = document.createElement('input');
        	    obj4.setAttribute('type', 'hidden');
        	    obj4.setAttribute('name', 'birthyear');
        	    obj4.setAttribute('value', birthyear);
        	    
        	    f.appendChild(obj1);
        	    f.appendChild(obj2);
        	    f.appendChild(obj3);
        	    f.appendChild(obj4);
        	    f.setAttribute('method', 'post');
        	    f.setAttribute('action', 'loginNaver');
        	    document.body.appendChild(f);
        	         	    
        	    naverLogin.logout();
        	    
        	    f.submit();

         }
	}
    });
    
    
   
  
    
</script>

</html>