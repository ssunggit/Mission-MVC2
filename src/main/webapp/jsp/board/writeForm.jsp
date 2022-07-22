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
<title>새글등록폼</title>
<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css">
<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('#ListBtn').click(function() {
			location.href= 'list.jsp'
		})
	})
	
	function checkForm() {
	
		let f = document.writeForm
		
		if(f.title.value == '') {
			alert('제목을 입력하세요')
			f.title.focus()
			return false	
		}
		/*
		if(f.writer.value == '') {
			alert('작성자를 입력하세요')
			f.writer.focus()
			return false
		}
		*/
		if(f.content.value == '') {
			alert('내용을 입력하세요')
			f.content.focus()
			return false
		}
		
		// 첨부파일 확장자 체크
		if(checkExt(f.attachfile1)){
			return false	
		}
		
		if(checkExt(f.attachfile2)){
			return false	
		}
		
		return true
	}
	
	
	function checkExt(obj) {
		let forbidName = ['exe', 'java', 'class', 'js', 'jsp']
		let fileName = obj.value
		let ext = fileName.substring(fileName.lastIndexOf('.') + 1)
		
		for(let i = 0; i < forbidName.length; i++) {
			if(forbidName[i] == ext) {
				alert('[' + ext + '] 확장자는 파일 업로드 정책에 위배됩니다')
				return true
			}
		}
		
		return false
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
		<h2>새글 등록폼</h2>
		<hr>
		<br>
		<!-- onsubmit : action이 가르키는 url로 이동하게 할지 말지를 결정하는 속성 -->
		<!-- return false 이면 액션이 가르키는 url로 이동하지 않는다. -->
		<!-- form 태그의 name 속성으로 form 태그 안 태그들을 제어할 수 있다. -->
		<form action="${ pageContext.request.contextPath }/board/write.do" method="post" name="writeForm" onsubmit="return checkForm()">
			<!-- 
			type="hidden" : 내가 직접 입력하지 않았지만 form태그를 통해 전달, form 태그 안에서만 사용가능하다 
			위치는 form 태그 안에서만 있으면 된다.
			-->
			<%-- <input type="hidden" name="writer" value="${ userVO.id }"> --%>
			<table class="table">
				<tr>
					<th width="25%">제목</th>
																	<!-- 속성과 값이 같을 경우에는 속성명만 기재할 수 있다 -->
					<td><input type="text" name="title" size="80"></td>
				</tr>
				<tr>
					<th width="25%">작성자</th>
					<td>
						<input type="text" name="writer" > 
					</td>
				</tr>
				<tr>
					<th width="25%">내용</th>
					<td>
						<textarea rows="5" cols="80" name="content"></textarea>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<input type="file" name="attachfile1"><br>
						<input type="file" name="attachfile2">
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" value="새글등록">&nbsp;&nbsp;
			<button type="button" id="ListBtn">목록</button>
		</form>
	</div>
	</section>
	<footer id="footer" class="footer">
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>