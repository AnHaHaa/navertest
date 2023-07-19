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

<h1>게시물 작성 정보</h1>

<h3>글번호 : ${writerdto.seq}</h3>
<h3>글제목 : ${writerdto.title}</h3>
<h3>글내용 : ${writerdto.contents}</h3>
<h3>글암호 : ${writerdto.pw}</h3>

<h3>작성자 id : ${writerdto.member.memberid}</h3>
<h3>작성자 이름 : ${writerdto.member.name}</h3>
<h3>작성자 이메일 : ${writerdto.member.email}</h3>
<h3>작성자 연락처 : ${writerdto.member.phone}</h3>
<h3>작성자 가입일 : ${writerdto.member.regtime}</h3>
<h3>회원암호 : ${writerdto.member.pw}</h3>


</body>
</html>