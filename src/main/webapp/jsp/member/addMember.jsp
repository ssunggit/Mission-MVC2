<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");;
	String name = request.getParameter("name");;
	String password = request.getParameter("password");;
	String emailId = request.getParameter("emailId");;
	String emailDomain = request.getParameter("emailDomain");;
	String tel1 = request.getParameter("tel1");;
	String tel2 = request.getParameter("tel2");;
	String tel3 = request.getParameter("tel3");;	
	String post = request.getParameter("post");;
	String basicAddr = request.getParameter("basicAddr");;
	String detailAddr = request.getParameter("detailAddr");;
    
    MemberVO member = new MemberVO();
    member.setId(id);
    member.setName(name);
    member.setPassword(password);
    member.setEmailId(emailId);
    member.setEmailDomain(emailDomain);
    member.setTel1(tel1);
    member.setTel2(tel2);
    member.setTel3(tel3);
    member.setPost(post);
    member.setBasicAddr(basicAddr);
    member.setDetailAddr(detailAddr);
    
    MemberDAO dao = new MemberDAO();
    
    dao.addMember(member);	 
%>

<script>
	alert('새글등록을 완료하였습니다.')
	location.href = "list.jsp";
</script>
