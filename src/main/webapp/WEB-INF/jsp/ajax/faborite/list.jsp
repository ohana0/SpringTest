<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 목록</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
         <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 

</head>
<body>
	<h1>즐겨찾기목록</h1>
	<table class="table text-center">
		<thead>
			<tr>
				<th>No.</th>
				<th>이름</th>
				<th>주소</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
<c:forEach var="faborite" items="${faboriteList }" varStatus = "status">
	
			<tr>
				<td>${status.count }</td>
				<td>${faborite.name }</td>
				<td><a href="${faborite.url }" class="text-dark">${faborite.url }</a></td>
				<td>
					<button class="btn btn-danger btn-sm deleteBtn" name="${faborite.id }">삭제하기</button>
				</td>
			</tr>

</c:forEach>
		</tbody>
	</table>
<a href="/faborite/input"><button class="btn">추가</button></a>

<script>
	    $(document).ready(function(){
	    	
			$('.deleteBtn').click(function(){
				id=$(this).attr("name");
				//alert(name);
				$.ajax({
					type:"post"
					,url:"/faborite/delete"
					,data:{"id":id}
					,success:function(data){
						//{"result":"success"}
						//{"result":"fail"}
						if(data.result == "success"){
							alert("삭제성공");
							location.href ="/faborite/list";
							return;
						}
						else{
							alert("삭제실패");
							location.href ="/faborite/list";
							return;
						}
						
					}
					,error:function(){
						alert("오류발생");
						return;
					}
				})
				
			});
	    })
</script>
</body>
</html>