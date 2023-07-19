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
<h1>글쓰기 폼</h1>
<form action="boardwrite" method="post">
제목 : <input type='text' name ='title'> <br>
내용 : <textarea name='contents' rows='5' cols='50'>
여기에 내용을 입력하세요.
</textarea><br>
작성자 : <input type='text' name ='writer' value="${sessionid}" readonly> <br>
글암호 : <input type='text' name ='pw'> <br>
<input type="submit" value="글저장">
</form>
</body>
</html>