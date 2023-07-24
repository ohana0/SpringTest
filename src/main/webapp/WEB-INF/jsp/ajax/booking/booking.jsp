<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>통나무 팬션</title>


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
			
            <section class="contents">
                <div>
                    <img id="main-image" alt="배너1-팬션사진" src="http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner1.jpg" width="1200px">

                </div>
                <div class="d-flex main-contents">
                    <div class="col-3 d-flex align-items-center justify-content-center banner-2">실시간<br>예약하기</div>
                    <div class="col-6 d-flex justify-content-center align-items-center main-menu">
                        <div id="confirm">
                            <div class="d-flex">
                                
                                <h3 class="text-light">예약 확인</h3>

                            </div>

                            <div>
                                <div class="d-flex">
                                    <div class="label-box text-light d-flex justify-content-center align-items-center">이름</div>
                                    <input id="input-name" type="text" class="form-control inputbox">
                                </div>
                                <div class="d-flex pt-2">
                                    <div class="label-box text-light d-flex justify-content-center align-items-center">전화번호</div>
                                    <input id="input-phoneNumber" type="text" class="form-control inputbox" value="010-">
                                </div>

                            </div>

                            <div class="d-flex justify-content-end pt-2">
                                <button type=button id="check-button" class="form-control bg-success text-light">조회하기</button>
    
                            </div>
                        </div>
                    </div>
                    <div class="col-3 phone-number d-flex align-items-center justify-content-center"><h1 class="text-white">예약문의:<br>010-<br>000-1111</h1></div>
                </div>
                
            </section>
			<%@ include file="/ajax/jsp/booking_footer.jsp" %>
        </div>
        
        


        <script>

    
            let images = ["http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner1.jpg","http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner2.jpg","http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner3.jpg","http://marondal.com/material/images/dulumary/web/front/jquery/test06_banner4.jpg"];

            function nextImg(){
                let imageIndex = images.indexOf($("#main-image").attr("src"));

                imageIndex += 1;
                    
                $("#main-image").attr("src",images[imageIndex % images.length]);
            }

            
            $(document).ready(function(){
                //setInterval 함수는 이 안에 들어가는게 맞다.
                setInterval(nextImg,3000);

                $("#check-button").on("click",function(){

                        let name = $("#input-name").val();
                        let phoneNumber = $("#input-phoneNumber").val();
                        if(name =="" || phoneNumber == ""){
                            alert("정보를 입력해주세요");
                            return;
                        }
                        if(phoneNumber.substring(0,3) !="010"){
                            alert("010 으로 시작하는 번호만 입력 가능합니다.")
                            $("#input-phoneNumber").val("");
                            return;
                        }
                        else{
                            $.ajax({
                            	type:"get"
                            	,url:"/booking/check"
                            	,data:{"name":name
                            		,"phoneNumber":phoneNumber}
                            	,success:function(data){
                            		if(data == ""){

                            			alert("조회결과가 없습니다");
                            			return;
                            		}

                            		else{
                            			let name = data.name;
                            			let headcount = data.headcount;
                            			let day = data.day;
                            			let dateData = new Date(data.date);
                            			let month;
                            			let date;
                            			if(dateData.getMonth() <=10){
                            				month = '0' + (dateData.getMonth());
                            			}
                            			else{
                            				month = (dateData.getMonth());
                            			}
                            			if(dateData.getDate() <10){
                            				date = '0' + dateData.getDate();
                            			}
                            			else{
                            				date = dateData.getDate();
                            			}

                            			let state = data.state;
                            			alert(
                            					"이름: " + data.name
                            					+ "\n날짜: " + dateData.getFullYear() + "-" + month + "-" + date
                            					+ "\n일수: " + data.day
                            					+ "\n인원: " + data.headcount
                            					+ "\n상태: " + data.state

                            			);
                            		}
                            		
                            		
                            	}
                            	,error:function(){
                            		alert("조회오류");
                            	}
                            })
                        }
              
                })





            });
        </script>
    </body>
</html>