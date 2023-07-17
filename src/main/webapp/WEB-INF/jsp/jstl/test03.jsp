<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test03</title>
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
	<h1>1. 후보자 득표율</h1>
	<table class="table text-center">
		<thead>
		<tr>
			<th>기호</th>
			<th>득표수</th>
			<th>득표율</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${candidates }" var="candidate" varStatus="status"> 
			<tr>
				<td>${status.count }</td>
				<td><fmt:formatNumber value="${candidate }" pattern="###,###,###"/></td>
				
				<td><fmt:formatNumber value="${candidate/1000000 }" type="percent"/></td>
			</tr>
		</c:forEach>
		</tbody>
	
	</table>
	<h1>2. 카드 명세서</h1>
	<table class="table text-center">
		<thead>
			<tr>
				<th>사용처</th>
				<th>가격</th>
				<th>사용날짜</th>
				<th>할부</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${cardBills }" var="cardBill" varStatus="status">
			<tr>
				<td>${cardBill.store }</td>
				<td><fmt:formatNumber value="${cardBill.pay }" type="currency"/></td>
				<fmt:parseDate value="${cardBill.date }" var="parseDate" pattern="yyyy-MM-dd"/>
				<td><fmt:formatDate value="${parseDate }" pattern="yyyy년 M월 dd일"/></td>
				<td>${cardBill.installment }</td>
			</tr>
		</c:forEach>
		
		</tbody>
	</table>
	












        <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 
</body>
</html>