<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<style type="text/css"> * {font-family: 'NanumSquareNeo';} </style>
</head>
<body>
<script src="/js/jquery-3.6.4.min.js"></script>
<script>
$(document).ready(function(){
	$("#writinglink").on('click', function(){
		let sessionid = <%=session.getAttribute("sessionid")%>;
		if(sessionid == null){
			alert("로그인부터 진행해 주세요.");
			e.preventDefault();
		}//if
		
	});// onclick
	
	
});//ready

</script>


<h1 style="color:blue;"> 로그인 여부 : ${sessionid} </h1>

<h1> 나의 게시판 시작화면입니다. </h1>
<h2> 메뉴는 다음과 같습니다. </h2>
<ul>
	<li> <a href='boardlist'>게시물리스트보기</a> </li>
	<li> <a id='writinglink' href='boardwrite'>글쓰러 가기(로그인필요)</a> </li>
	<li> <a href='boardlogin'>로그인하기</a> </li>
	<li> <a href='boardlogout'>로그아웃하기</a> </li>
</ul>
</body>
</html>