<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	  <div class="container d-flex align-items-center justify-content-between">
			<a href="/Mission-Web" class="logo d-flex align-items-center me-auto me-lg-0">
				<h1>Mission_Board<span>.</span></h1>
			</a>
			<nav id="navbar" class="navbar">
				<ul>
					<c:if test="${ userVO.type eq 'S' }">
				<li>
						<a href="/Mission-Web/jsp/member/list.jsp">회원리스트</a> 
				</li>
					</c:if>
				<li>
					<a href="/Mission-Web/jsp/board/list.jsp">게시판</a> 
				</li>
					<c:choose>
					<c:when test="${ empty userVO }">
					<li>
						<a href="/Mission-Web/jsp/member/addMemberForm.jsp">회원가입</a> 
					</li>
					<li>
						<a href="/Mission-Web/jsp/login/login.jsp">로그인</a> 
					</li>
					</c:when>
					<c:otherwise>
					<li>
						<a href="/Mission-Web/jsp/login/logout.jsp">로그아웃</a>
					</li>
					</c:otherwise>
					</c:choose>
					
					<li>
						<c:if test="${ not empty userVO }">
					<span id="login_name">
							${ userVO.name }님 환영합니다.
					</span>
						</c:if>
					</li>
				</ul>
			</nav>
</div>