<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
        
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>날씨정보추가페이지</title>
    <link rel="stylesheet" href="/jstl/css/style.css" type="text/css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
	<div id="wrapper" class="d-flex">
		<%@ include file="/jstl/jsp/weather_nav.jsp" %>
		<div class="col-10">
			<h2 class="m-2">날씨 입력</h2>
			<form method="get" action="/jstl/weather/add" class="m-4">
				<div class="d-flex">
					<div class="col-6">
						<label>날짜</label>
						<input name="date" type="date" class="form-control" value="2023-07-18">
					</div>
					<div class="col-3">
						<label>날씨</label>
						<select name="weather" class="form-control">
							<option value="맑음">맑음</option>
							<option value="구름조금">구름조금</option>
							<option value="흐림">흐림</option>
							<option value="비">비</option>
						</select>
						</div>
					<div class="col-3">
						<label>미세먼지</label>
						<select name="microDust" class="form-control">
							<option value="나쁨">나쁨</option>
							<option value="보통">보통</option>
							<option value="좋음">좋음</option>
							<option value="최악">최악</option>
						</select>
					</div>
				</div>
				
				<div class="d-flex mt-2">
					<div class="col-4">
						<label>기온</label>
						<input type="number" class="form-control" name="temperature">
					</div>
					<div class="col-4">
						<label>강수량</label>
						<input type="number" class="form-control" name="precipitation">
					</div>
					<div class="col-4">
						<label>풍속</label>
						<input type="number" class="form-control" name="windSpeed">
					</div>					
				</div>
			
				<div class="d-flex justify-content-end m-4"><button type="submit" class="btn btn-primary">제출</button> </div>
			
			
			</form>
		
		
		
		
		</div>
	</div>
	<%@ include file="/jstl/jsp/weather_footer.jsp" %>

	    <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 
</body>
</html>