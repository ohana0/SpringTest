<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>예약목록</title>
        
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

        <link rel="stylesheet" href="/ajax/css/style.css" type="text/css">
    </head>
    <body>
        <div id="wrap">
			<%@ include file="/ajax/jsp/booking_header.jsp" %>
            <%@ include file="/ajax/jsp/booking_nav.jsp" %>
			<section>
			<br>
				<table class="table text-center font-weight-bold">
					<thead>
						<tr>
							<th>이름</th>
							<th>예약날짜</th>
							<th>숙박일수</th>
							<th>숙박인원</th>
							<th>전화번호</th>
							<th>예약상태</th>
							<th></th>
						</tr>
					</thead>

					<tbody>
<c:forEach var="booking" items="${booking }">
<fmt:formatDate var="date" value="${booking.date }" pattern="yyyy년 MM월 dd일"/>
						<tr>
							<td>${booking.name }</td>
							
							<td>${date }</td>
							
							
							<td>${booking.day }</td>
							<td>${booking.headcount }</td>
							<td>${booking.phoneNumber}</td>
							<td>
<c:set var="state" value="${booking.state }"/>
<c:choose>

	<c:when test="${state eq '확정' }">
		<div class="text-success">${booking.state }</div>
	</c:when>
	<c:when test="${state eq '대기중' }">
		<div class="text-info">${booking.state }</div>
	</c:when>
	<c:when test="${state eq '취소' }">
		<div class="text-danger">${booking.state }</div>
	</c:when>	
</c:choose>								
							</td>
							<td><button type="button" class="btn btn-danger btn-sm deleteBtn" data-booking-id="${booking.id }">삭제</button></td>
							
						</tr>				
</c:forEach>					
					</tbody>
				</table>

			</section>
			<%@ include file="/ajax/jsp/booking_footer.jsp" %>
        </div>
        <script>
            $(document).ready(function(){
            	$("#deleteBtn").click(function(){
            		let id = $(this).data("booking-id");
            		$.ajax({
            			type:"post"
            			,url:"/booking/delete"
            			,data:{"id":id}
            			,success:function(data){
            				if(data.result == "success"){
            					alert("삭제성공");
            					location.reload();
            				}
            				else{
            					alert("삭제실패");
            				}
            			}
            			,error:function(){
            				alert("오류발생");
            			}
            			
            		}
            	})
            	


            });
        </script>
</body>
</html>