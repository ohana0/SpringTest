<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨찾기 추가</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<div class="d-flex justify-content-between">
		<h1>즐겨찾기 추가하기</h1><a href="/faborite/list"><button class="btn">돌아가기</button></a>
	</div>
	
	<label>제목</label>
	<input type="text" class="form-control" id="nameInput" name="name">
	<label>주소</label>
	<input type="text" class="form-control" id="urlInput" name="url" value="https://">
	
	<button class="btn btn-success p-2" id="submitBtn">추가</button>

<script>
	    $(document).ready(function(){
			$("#submitBtn").on("click",function(){
				let name=$("#nameInput").val();
				let url=$("#urlInput").val();
				
				if(name==""){
					alert("제목을 입력하세요");
					return;
				}
				if(url==""){
					alert("주소를 입력하세요");
				}
				else if(!(url.startsWith("https://") || url.startsWith("http://"))){
					alert("주소를 확인하세요");
				}
				
				$.ajax({
					type:"post"
					,url:"/faborite/add"
					,data:{//여기서 data는 jsp파일에서 입력한 값.
						"name":name
						,"url":url
					}
					,success:function(data){//여기서 data는 controller "/faborite/add"의 return값
						if(data.result =="success"){
							location.href="/faborite/list";
						}
						else{
							alert("추가실패!");
							return;
						}
					}
					,error:function(){
						alert("추가 에러!");
						return;
					}
					
				})
				
				
			})
	    });
</script>
	
	
	
		<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


</body>
</html>