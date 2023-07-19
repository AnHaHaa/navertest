<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<style type="text/css"> 
* {font-family: 'NanumSquareNeo';} 
table * {
	width:70px;
	text-align: center
	}
.title {
	width:250px;
}
.writetime {
	width:250px;
}

</style>
</head>
<body>
<h3> 검색 </h3>
<form action="boardsearchlist">
<select name='search' style="height:25px">
	<option value='all'>전체</option>
	<option value='title'>제목</option>
	<option value='contents'>내용</option>
	<option value='writer'>작성자</option>
</select>
<input type='text' name='searchtxt' style="height:19px">
<input type="submit" value="검색" style="height:25px">
</form>
<hr>
<h3> 게시물 리스트 </h3>
<table border="1">
<tr><th>번호</th><th class='title'>제목</th><th>작성자</th><th>조회수</th><th class='writetime'>작성날짜</th></tr>
<c:forEach items="${list}" var="list">
	<tr><td>${list.seq}</td><td class='title'><a href="boarddetail?seq=${list.seq}">${list.title}</a></td><td>${list.writer}</td><td>${list.viewcount}</td><td class='writetime'>${list.writetime}</td></tr>
</c:forEach>
</table>
<br>
page : 
<% 
	int totalBoard = (Integer)request.getAttribute("totalBoard");
	int totalpage = 0;
	
	if(totalBoard % 4 ==0){
		totalpage = totalBoard/4;
	}else{
		totalpage = totalBoard/4 + 1;		
	}
	
	for(int i=1; i<=totalpage; i++){
%>
	<a href='boardlist?page=<%=i %>'><%=i %></a>
<% 
	}	
%>


</body>
</html>