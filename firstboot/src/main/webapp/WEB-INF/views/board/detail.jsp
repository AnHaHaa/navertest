<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<style type="text/css"> * {font-family: 'NanumSquareNeo';} </style>
<script src="/js/jquery-3.6.4.min.js"></script>
<script>
$(document).ready(function(){
	$("#deletebtn").on('click',function(){
		let inputpw = prompt("암호를 입력하세요");
		let dbpw = ${oneBoard.pw}; //el표현식
		//let dbpw = $("input:hidden").val(); //jquary표현식
		if(inputpw == dbpw){
			alert("게시글을 삭제합니다.");
			location.href="boarddelete?seq=${oneBoard.seq}";
		}else{
			alert("암호를 확인하세요.");
		}
	});//deletbtn
	
	$("#updatebtn").on('click',function(){
		let inputpw = prompt("암호를 입력하세요");
		let dbpw = ${oneBoard.pw}; //el표현식
		//let dbpw = $("input:hidden").val(); //jquary표현식
		if(inputpw == dbpw){
			alert("게시글을 수정합니다.");
			
			$("form").attr("action","updateBoard");
			$("form").attr("method","post");
			$("form").submit(); // or button -> submit 변경
		}else{
			alert("암호를 확인하세요.");
		}
	});//deletbtn
	
});//ready
</script>
</head>
<body>
<h1>상세게시물</h1>

<form action="">
번호 : <input type="text" readonly="readonly" name='seq' value="${oneBoard.seq}"><br>
제목 : <input type="text" name='title' value="${oneBoard.title}"><br>
내용 : <textarea name="contents" rows="5" cols="50">${oneBoard.contents}</textarea><br>
작성자 : <input type="text" readonly="readonly" name='writer' value="${oneBoard.writer}"><br>
조회수 : <input type="text" readonly="readonly" name='viewcount' value="${oneBoard.viewcount}"><br>
작성시간 : <input type="text" readonly="readonly" name='writetime' value="${oneBoard.writetime}"><br>
<input type="hidden" readonly="readonly" name='pw' value="${oneBoard.pw}"><br>

<input type="button" id="updatebtn" value="수정">
<input type="button" id="deletebtn" value="삭제">

</form>

</body>
</html>