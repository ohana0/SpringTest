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
            <section class="d-flex justify-content-center">
            	<div id="reserveForm">
            		<div class="d-flex justify-content-center p-2"><h2 class="font-weight-bold">예약하기</h2></div>
            		<div class="p-2"><label>이름</label><input type="text" class="form-control" id="nameInput"></div>
            		<div class="p-2"><label>예약날짜</label><input type="date" class="form-control" id="dateInput"></div>
            		<div class="p-2"><label>숙박일수</label><input type="number" class="form-control" id="dayInput"></div>
            		<div class="p-2"><label>숙박인원</label><input type="number" class="form-control" id="headcountInput"></div>
            		<div class="p-2"><label>전화번호</label><input type="tel" class="form-control" id="phoneNumberInput" value="010-"></div>
            		<div class="p-2 d-flex justify-content-center"><button class="btn btn-warning p-2" id="submitBtn">예약하기</button></div>
            	
            	
            	
            	
            	</div>

            </section>

            <%@ include file="/ajax/jsp/booking_footer.jsp" %>
        </div>
<script>
	    $(document).ready(function(){
			$("#submitBtn").on("click",function(){
				let name = $("#nameInput").val();
				let date = $("#dateInput").val();
				let day = $("#dayInput").val();
				let headcount = $("#headcountInput").val();
				let phoneNumber = $("#phoneNumberInput").val();
				if(name == ""){
					alert("이름을 입력하세요");
					return;
				}
				if(date == ""){
					alert("날짜를 입력하세요");
					 return;
				}
				if(day == ""){
					alert("숙박일수를 입력하세요");
					 return;
				}
				if(phoneNumber == ""){
					alert("전화번호를 입력하세요");
					 return;
				}
				if(headcount == ""){
					alert("인원수를 입력하세요");
					 return;
				}
				
				$.ajax({
					type:"post"
					,url:"/booking/add"
					,data:{
						"name":name
						,"date":date
						,"day":day
						,"headcount":headcount
						,"phoneNumber":phoneNumber
					}
					,success:function(data){
						if(data.result=="success"){
							alert("예약성공");
							location.href="/booking/home";
						}
						else{
							alert("예약실패");
							return;
						}
					}
					,error:function(){
						alert("error");
						return;
					}
				})
				
			})

	    	
	    	
	    })
	   
</script>    
</body>
</html>