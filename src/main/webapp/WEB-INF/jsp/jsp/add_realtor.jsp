<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<form method="post" action="/jsp/realtor/add">
	<h3>공인중개사 추가</h3>
	
	<label>상호명</label><input type="text" name="office">
	<label>전화번호</label><input type="text" name="phoneNumber">
	<label>주소</label><input type="text" name="address">
	<label>등급</label><input type="text" name="grade">
	<button type="submit">추가</button>
	</form>

</div>

</body>
</html>