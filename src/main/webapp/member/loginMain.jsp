<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
  <head>
  	<title>Login 07</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="../resources/css/style.css">

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
	
	<script type="text/javascript" src="../resources/js/jquery-3.6.0.min.js"></script>
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
	
	<script>
    $(function()
    {
    	
        $('#loginHitrip').on('click', function()
        {
            login_submit();
        });


        function login_submit()
        {
            
                console.log($('#member_id').val());
                console.log($('#member_pw').val());
                
                if($('#member_id').val()=="")
                {
                    alert("아이디를 입력해주세요.");
                    $('#member_id').focus();
                    return;
                }
                else if($('#member_pw').val()=="")
                {
                    alert("패스워드를 입력해주세요.");
                    $('#member_pw').focus();
                    return;
                }
                else
                {                          
                	$("#HitripForm").submit();
                }
            
        };
        
        
    });
    
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
            alert("쿠키를 허용해주세요."); //[*]google.com 쿠키허용 등록
          });
    }
    
    </script>

<body>	
	
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section"><a style="font-size:60px;" href="#" class="navbar-brand" onclick="location.href='/trip/main.jsp'">HITRIP</a></h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-12 col-lg-10">
					<div class="wrap d-md-flex">
						<div class="text-wrap p-4 p-lg-5 text-center d-flex align-items-center order-md-last">
							<div class="text w-100">
								<h2>하이트립에 오신 것을</h2>
								<h2>환영합니다</h2>
								<p>계정이 없으신가요?</p>
								<a href="#" onclick="location.href='rgstSelect.jsp'" class="btn btn-white btn-outline-white">가입하기</a>
							</div>
			      </div>
						<div class="login-wrap p-4 p-lg-5">
			      	<div class="d-flex">
			      		<div class="w-100">
			      			
			      		</div>
								<div class="w-100">
									
								</div>
			      	</div>
							<form id="HitripForm" action="loginHitrip" class="signin-form">
			      		<div class="form-group mb-3">
			      			<label class="label" for="name">ID</label>
			      			<input type="text" id="member_id" name="member_id" class="form-control" placeholder="아이디 입력" required>
			      		</div>
		            <div class="form-group mb-3">
		            	<label class="label" for="password">Password</label>
		              <input type="password" id="member_pw" name="member_pw" class="form-control" placeholder="패스워드 입력" required>
		            </div>
		            <div class="form-group">
		            	<button id="loginHitrip" type="button" class="form-control btn btn-primary submit px-3">HITRIP 로그인</button>
		            </div>
		            <div class="form-group d-md-flex">
		            	<div class="w-50 text-left">
			            	<!-- <label class="checkbox-wrap checkbox-primary mb-0">로그인 정보 기억하기
									  <input type="checkbox">
									  <span class="checkmark"></span>
										</label> -->
									</div>
		            </div>
		          </form>
		          <div id="naverIdLogin" style="display:none;"></div>
		            		<p></p>
    						<!-- 아래 커스텀 버튼 동작을 위해 필요.--> 
    						<div class="social-login"> 
    						<button style="padding: 0; border: none; background: none; background-color:transparent;" title="네이버ID로 로그인" id="naverLogin">
    						<img style="width: 90%;" src="../resources/img/네이버-계정으로-로그인.png"></button>
    						<!-- 커스텀 버튼--> 
    						</div>
  							
  							<p></p>
					        <div id="gSignInWrapper" style="text-align:center;">
							<span class="label"></span>
							<div id="customBtn" class="customGPlusSignIn" style="width:90%; color:white; border:white; box-shadow:0px 0px 0px white;">     
							<span><img style="width:100%;" src="../resources/img/구글-계정으로-로그인.png"></span>
							</div>
							</div>
							<div id="name"></div>
							<script>startApp();</script>
    						<!-- 커스텀 버튼--> 
    						</div>
					 			
		        </div>
		      </div>
				</div>
			</div>
		</div>
	</section>

	<script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>
	</body>
	
<script type="text/javascript">
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

