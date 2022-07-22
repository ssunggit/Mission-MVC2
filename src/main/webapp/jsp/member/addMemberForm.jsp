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
<title>회원가입</title>
<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css">

<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script>
/* 	$(document).ready(function() {
		$('#addButtonBtn').click(function() {
			location.href= 'index.jsp'
		})
	}) */
</script>
</head>
<body>
	<header id="header" class="header fixed-top d-flex align-items-center">
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	
	<section>
	<div align="center">
		<hr>
		<h2>회원가입</h2>
		<hr>
		<br>
		<form action="addMember.jsp" method="post">
		<table class="table">
			<tr>
				<th>id</th>
				<td><input type="text" name="id" size="75"></td>
			</tr>
			<tr>	
				<th>비밀번호</th>
				<td><input type="password" name="password" size="75"></td>
			</tr>
			<tr>	
				<th>이름</th>
				<td><input type="text" name="name" size="75"></td>
			</tr>
			<tr>	
				<th>이메일</th>
				<td><input type="text" name="emailId" size="30">&nbsp;@
				<input type="text" name="emailDomain" size="35"></td>
			</tr>
			<tr>	
				<th>전화번호</th>
				<td>
				<input type="text" name="tel1" size="25">&nbsp;-
				<input type="text" name="tel2" size="25">&nbsp;-
				<input type="text" name="tel3" size="25">
				</td>
			</tr>
			<tr>	
				<th>우편번호</th>
				<td>
				<input type="text" name="post" size="75">
				</td>
			</tr>
			<tr>	
				<th>주소</th>
				<td>
				<input type="text" name="basicAddr" size="35">
				<input type="text" name="detailAddr" size="30"></td>
			</tr>				
			</table>
			<input type="submit" value="회원가입" class="btn btn-outline-dark">
			</form>
		</div>
	</div>
	</section>
	<footer id="footer" class="footer">
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>