<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	let replyJS = {
			id : null,
			boardId : 5,
			userId : 3,
			content : "good",
			createDate : null
	}
	
	function send(){
		//replyJS를 -> json으로 변환 JSON.stringify()
		var StringReply = JSON.stringify(replyJS);
		//ajax 호출 -> /blog/test/reply -> POST -> application/json, utf-8
				
		$.ajax({
			type : "POST",
			url : "/blog/test/reply",
			data : StringReply,
			contentType : "application/json; charset=utf-8",
			success : function(r) {
				alert(r);
			},
			error : function(xhr) {
				console.log("xhr : " + xhr)
				console.log("xhr.status : " + xhr.status);
			}
		});
	}
</script>
</head>
<body>
<button onClick="send()">전송</button>
</body>
</html>