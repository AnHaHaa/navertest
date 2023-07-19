<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<style type="text/css"> * {font-family: 'NanumSquareNeo';} </style>
</head>
<body>
<h1>다운로드 가능한 파일 목록입니다.</h1>
<c:forEach items="${filearray}" var="filename">
<h3><a href="filedownloadresult?filename=${filename}">${filename}</a> 다운로드 </h3>
</c:forEach>

</body>
</html>