<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>요청 파라미터를 확인해보세요</h1>
<%=request.getAttribute(RequestDispatcher.FORWARD_QUERY_STRING)%>
</body>
</html>