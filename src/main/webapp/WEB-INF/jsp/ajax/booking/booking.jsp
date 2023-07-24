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
                                <div class="d-flex align-items-end pl-3">
                                    <label class="text-light">회원<input type="radio" name="is-member" value="member" checked></label>
                                    <label class="text-light pl-2">비회원<input type="radio" name="is-member" value="not-member"></label>
                                </div>
                            </div>
                            <div id="member">
                                <div class="d-flex">
                                    <div class="label-box text-light d-flex justify-content-center align-items-center">아이디</div>
                                    <input id="input-id" type="text" class="form-control inputbox">
                                </div>
                                <div class="d-flex pt-2">
                                    <div class="label-box text-light d-flex justify-content-center align-items-center">비밀번호</div>
                                    <input id="input-password" type="password" class="form-control inputbox">
                                </div>

                            </div>

                            <div id="not-member" class="d-none">
                                <div class="d-flex">
                                    <div class="label-box text-light d-flex justify-content-center align-items-center">이름</div>
                                    <input id="input-name" type="text" class="form-control inputbox">
                                </div>
                                <div class="d-flex pt-2">
                                    <div class="label-box text-light d-flex justify-content-center align-items-center">전화번호</div>
                                    <input id="input-phoneNumber" type="text" class="form-control inputbox" value="010">
                                </div>
                                <div class="d-flex pt-2">
                                    <div class="label-box text-light d-flex justify-content-center align-items-center">날짜</div>
                                    <input type="text" id="datepicker1" class="form-control inputbox input-date">
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
                    let value= $("input[name='is-member']:checked").val();
                    if(value == "member"){
                        let id = $("#input-id").val();
                        let pw = $("#input-password").val();
                        if(id == "" || pw == ""){
                            alert("아이디와 비밀번호를 입력해주세요.");    
                            return;
                        }
                        else{
                            alert(id + "님의 예약은 ㅇㅇ월 ㅇㅇ일 ㅇㅇ시 입니다.")
                        }
                    }
                    else if(value == "not-member"){
                        let name = $("#input-name").val();
                        let phoneNumber = $("#input-phoneNumber").val();
                        let date = $(".input-date").val();
                        if(name =="" || phoneNumber == "" || date == ""){
                            alert("정보를 입력해주세요");
                            return;
                        }
                        if(phoneNumber.substring(0,3) !="010"){
                            alert("010 으로 시작하는 번호만 입력 가능합니다.")
                            $("#input-phoneNumber").val("");
                            return;
                        }
                        else{
                            alert("이름: " + name + "\n전화번호: " + phoneNumber + "\n날짜: " + date);
                        }
                    }
                })



                $("#datepicker1").datepicker({
                    dateFormat:"yy년 mm월 dd일"
                    ,minDate: 0 //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)

                    
                });

                $("input[name='is-member']").on("change",function(){
                    let value = $(this).val();
                    if(value =="not-member"){
                        $("#member").addClass("d-none");
                        $("#not-member").removeClass("d-none");
                    }
                    if(value =="member"){
                        $("#member").removeClass("d-none");
                        $("#not-member").addClass("d-none");
                    }
                })


            });
        </script>
    </body>
</html>