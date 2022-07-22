<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="/Mission-Web/assets/img/favicon.png" rel="icon">
  <link href="/Mission-Web/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Amatic+SC:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/Mission-Web/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/Mission-Web/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/Mission-Web/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="/Mission-Web/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="/Mission-Web/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/Mission-Web/assets/css/main.css" rel="stylesheet">
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css">
<script src="/Mission-Web/resources/js/myJS.js"></script>
<script>
/* 
	function isNull(obj, msg) {
		if(obj.value == ''){
			alert(msg)
			obj.focus()
			return true
		}
		return false
	}
*/

	function checkForm(){
		
		let f = document.loginForm
		
		if(isNull(f.id, "아이디를 입력하세요"))
			return false
		
		if(isNull(f.password, "패스워드를 입력하세요"))
			return false
		
		
		/*
		if(f.id.value == ''){
			alert('아이디를 입력하세요')
			f.id.focus()
			return false
		}
		
		if(f.password.value == ''){
			alert('패스워드를 입력하세요')
			f.password.focus()
			return false
		}
		
		return true
		*/
	}
</script>
</head>
<body>
	<header id="header" class="header fixed-top d-flex align-items-center">
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	
	<section>
		<div align="center">
			<hr>
			<h2>로그인</h2>
			<hr>
			<br>
			<form action="${ pageContext.request.contextPath }/loginProcess.do" method="post" onsubmit="return checkForm()" name="loginForm" >
				<table class="table">
					<tr>
						<th>ID</th>
						<td><input type="text" name="id"></td>
					</tr>
					<tr>
						<th>PASSWORD</th>
						<td><input type="password" name="password"></td>
					</tr>
				</table>
				<br>
				<input type="submit" value="로그인" class="btn btn-outline-dark">
			</form>
		</div>
	</section>
	
	<footer id="footer" class="footer">
	<!-- xml include forward 에서의 루트는 context-path 뒤 : http://localhost:9999/Mission-Web/ 뒤 -->
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>