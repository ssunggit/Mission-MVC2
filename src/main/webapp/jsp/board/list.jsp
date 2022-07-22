<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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

<title>게시물 목록</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/layout.css">
<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('#addBtn').click(function() {
			location.href = 'writeForm.jsp'
		})
	})

	function checkLogin(boardNo) {
		/* el과 jstl중에서는 jstl(백단코드)의 해석이 먼저된다  */
		/* js에서 c:set태그를 실행하려는것은 안된다 */
		<c:choose>
			<c:when test="${ empty userVO }">	
				if(confirm('로그인 후 사용가능합니다\n로그인 페이지로 이동할까요?')){
					location.href = '/Mission-Web/jsp/login/login.jsp'
				}
			</c:when>	
			
			<c:otherwise>
				location.href = 'detail.jsp?no=' + boardNo
			</c:otherwise>
		</c:choose>
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
		<h2>전체게시글 조회</h2>
		<hr>
		<br>
		<table class="table">
		<tr>
			<th width="7%">번호</th>
			<th>제목</th>
			<th width="16%">작성자</th>
			<th width="20%">등록일</th>
		</tr>	
		
		<c:forEach items="${ list }" var="board" varStatus="loop">
			<tr <c:if test="${ loop.count mod 2 eq 0 }">class="even"</c:if>>
				<td>
					<c:out value="${ board.no }"/> 
				</td>
				<td>
					<!-- 
						겟방식으로 넘겨줌 
						? : 클라이언트가 자신의 정보를 서버에 담을 때 ? 뒤로 쓴다
					-->
					
					<!-- 보안을 위해 링크를 el로 적지 않는다  -->
					<!--  화면 출력을 위해 el 이 아닌 out 태그로 적어야한다 -->
					<%-- 
					<a href="updateViewCnt.jsp?no=${board.no}">
						<c:out value="${ board.title }"/> 
					</a>
					 --%>
					 <a href="${ pageContext.request.contextPath }/board/detail.do?no=${board.no}">
							<c:out value="${ board.title }" />
					</a>
					 <!-- href javascript를 실행하겠다  -->
					 <%-- <a href="javascript:checkLogin(${ board.no })">
						<c:out value="${ board.title }"/> 
					</a> --%>
				</td>
				<td>
					<c:out value="${ board.writer }"/> 
				</td>
				<td>${ board.regDate }</td>
			</tr>
		</c:forEach>
		</table>
		<br>
		<c:if test="${ not empty userVO }">
			<button id="addBtn" class="btn btn-outline-dark">새글등록</button>
		</c:if>
	</div>
	</section>
	
	<footer id="footer" class="footer">
	<!-- xml include forward 에서의 루트는 context-path 뒤 : http://localhost:9999/Mission-Web/ 뒤 -->
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>