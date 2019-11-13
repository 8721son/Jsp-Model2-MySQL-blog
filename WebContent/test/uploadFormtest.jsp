<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div>
	<img id="img__wrap"/>
	</div>

	<form action="uploadActiontest.jsp" method="POST" enctype="multipart/form-data">
		username : <input type="text" name="username" /> <br /> 
		userProfile : <input id="img__input" type="file" name="userProfile" /> <br /> 
		<input type="submit" value="전송" />

	</form>

<script src="/blog/js/jquery-3.2.1.min.js"></script>
<script>
	$("#img__input").on("change",handleImgFile);
	
	function handleImgFile(e){
		var f = e.target.files[0];
		if(!f.type.match("image.*")){
			return;
		}
		
		var reader = new FileReader();
		
		reader.onload = function(e){
			$("#img__wrap").attr("src",e.target.result);
		}
		reader.readAsDataURL(f);
	}
</script>
</body>
</html>