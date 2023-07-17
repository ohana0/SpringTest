<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test04</title>
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>
<body>
	
	<h1 class="d-flex justify-content-center">회원 정보 리스트</h1>
	<table class="table text-center">
		<thead>
			<tr>
				<th>No</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>국적</th>
				<th>이메일</th>
				<th>자기소개</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${members }" var="member" varStatus="status">
			<tr>
				<c:set var="phoneNumber" value="${member.phoneNumber }"/>
				<c:choose>
					
					<c:when test="${fn:startsWith(phoneNumber,'010-') }"></c:when>
					<c:otherwise>
						<c:set var="phoneNumber" value="유효하지 않은 전화번호"/>
					</c:otherwise>
				</c:choose>
				
				<c:set var="nationality" value="${member.nationality }"/>
				
				<c:set var="email" value="${member.email }"/>
				
				<c:set var="introduce" value="${member.introduce }"/>
				
				<c:set var="introduceLength" value="${fn:length(introduce) }"/>
				
				<td>${status.count }</td>
				<td>${member.name }</td>
				<td>${phoneNumber }</td>
				<td>삼국-${fn:substring(nationality,5,7) }</td>
				<td class="d-flex justify-content-center">
					<div class="font-weight-bold">${fn:split(email,"@")[0] }</div>@${fn:split(email,"@")[1] }
				</td>
				<td>${fn:substring(introduce,0,15) }
						<c:if test="${introduceLength>15 }">...</c:if>
				</td>
			</tr>
		</c:forEach>
		
		</tbody>
	
	
	
	
	</table>

















        <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 

</body>
</html>