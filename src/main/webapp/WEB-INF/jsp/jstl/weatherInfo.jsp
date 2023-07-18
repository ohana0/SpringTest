<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
        
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>날씨정보페이지</title>
    <link rel="stylesheet" href="/jstl/css/style.css" type="text/css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<div id="wrapper" class="d-flex">
		<%@ include file="/jstl/jsp/weather_nav.jsp" %>

		<div class="col-10">
			<h3 class="m-2">과거 날씨</h3>
			<table class="table text-center">
				<thead>
					<tr>
						<th>날짜</th>
						<th>날씨</th>
						<th>기온</th>
						<th>강수량</th>
						<th>미세먼지</th>
						<th>풍속</th>
					</tr>
				</thead>
				<tbody>
		<c:forEach items="${weatherHistory }" var="weather" varStatus="status">
					<tr>
						<fmt:formatDate var="dateString" value="${weather.date }" pattern="yyyy년 MM월 dd일"/>
						<td>${dateString }</td>
						
						
						<c:set var="weatherString" value="${weather.weather }"/>
						<c:choose>
						<c:when test="${weatherString == '맑음' }">
							<td><img src="/jstl/image/sunny.jpg"></td>
						</c:when>
						<c:when test="${weatherString == '구름조금' }">
							<td><img src="/jstl/image/partlyCloudy.jpg"></td>
						</c:when>
						<c:when test="${weatherString == '흐림' }">
							<td><img src="/jstl/image/cloudy.jpg"></td>
						</c:when>
						<c:when test="${weatherString == '비' }">
							<td><img src="/jstl/image/rainy.jpg"></td>
						</c:when>		
						<c:otherwise>
							<td></td>
						</c:otherwise>																	
						</c:choose>
						
						
						<td>${weather.temperatures }</td>
						<td>${weather.precipitation }</td>
						<td>${weather.microDust }</td>
						<td>${weather.windSpeed }</td>
					</tr>
		</c:forEach>				
				
				
				</tbody>	
			</table>
		</div>	
	</div>
	<%@ include file="/jstl/jsp/weather_footer.jsp" %>
	
	    <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 
</body>
</html>