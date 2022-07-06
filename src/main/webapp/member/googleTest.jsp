<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="166227979625-2oeo9jd7muj3rspks8npeo3t07on6vg8.apps.googleusercontent.com">
<script type="text/javascript" src="../resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<img src="../resources/img/구글-계정으로-로그인.png"><div class="g-signin2" data-onsuccess="onSignIn"></div></img>

</body>
<script>

	function onSignIn(googleUser) {
		  var profile = googleUser.getBasicProfile();
		  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
		  console.log('Name: ' + profile.getName());
		  console.log('Image URL: ' + profile.getImageUrl());
		  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
		  console.log()		 
		  
		  
		  //로그아웃
		  if(gapi.auth2 != undefined){
			 	var auth2 = gapi.auth2.getAuthInstance();
		   		 auth2.signOut().then(function () {
		    	  console.log('User signed out.');
		    });
			}

	}
	
	 /* function signOut() {
			if(gapi.auth2 != undefined){
			 	var auth2 = gapi.auth2.getAuthInstance();
		   		 auth2.signOut().then(function () {
		    	  console.log('User signed out.');
		    });
			}

			
			location.href= "googleTest.jsp"
		  }
 	*/

</script>
</html>